package logic

import (
	"context"
	"encoding/json"
	"fmt"
	"strconv"
	"time"
	"unicode"

	"API_Test/suggest/internal/svc"
	"API_Test/suggest/internal/types"

	"github.com/zeromicro/go-zero/core/logx"
)

type SuggestLogic struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

func NewSuggestLogic(ctx context.Context, svcCtx *svc.ServiceContext) *SuggestLogic {
	return &SuggestLogic{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *SuggestLogic) Suggest(req *types.SuggestRequest) (resp *types.SuggestResponse, err error) {
	resp = new(types.SuggestResponse)
	key := strconv.QuoteToASCII(req.Keyword)
	key = key[1 : len(key)-1]
	list, err := l.svcCtx.RDB.Get(l.ctx, "keyword:"+key).Result()
	if err != nil { //Redis中不存在对应的记录
		kwList := make([]*types.Keyword, 0)
		//截取中文/拼音字符
		var strTempChinese string
		var strTempPinyin string
		for _, v := range req.Keyword {
			if unicode.Is(unicode.Han, v) {
				strTempChinese += string(v)
			} else {
				strTempPinyin += string(v)
			}
		}
		//判断是否进行拼音匹配
		if strTempChinese != "" {
			err = l.svcCtx.Engine.Table("keywords").Where("content like ?", strTempChinese+"%").Limit(10, 0).Find(&kwList)
			if err != nil {
				return nil, err
			}
		} else {
			err = l.svcCtx.Engine.Table("keywords").Where("pinyin like ?", strTempPinyin+"%").Limit(10, 0).Find(&kwList)
			if err != nil {
				return nil, err
			}
		}
		s, err := json.Marshal(kwList)
		if err != nil {
			return nil, err
		}
		l.svcCtx.RDB.Set(l.ctx, "keyword:"+key, s, time.Second*time.Duration(300)) //将查询到数据写入Redis，缓存时间5分钟
		fmt.Println("keyword:" + key)
		resp.RelatedWords = kwList
	} else { //Redis中存在对应的记录
		err = json.Unmarshal([]byte(list), &resp.RelatedWords)
		if err != nil {
			return nil, err
		}
	}

	return
}
