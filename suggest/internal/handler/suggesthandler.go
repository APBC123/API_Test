package handler

import (
	"net/http"

	"API_Test/suggest/internal/logic"
	"API_Test/suggest/internal/svc"
	"API_Test/suggest/internal/types"
	"github.com/zeromicro/go-zero/rest/httpx"
)

func SuggestHandler(svcCtx *svc.ServiceContext) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		var req types.SuggestRequest
		if err := httpx.Parse(r, &req); err != nil {
			httpx.ErrorCtx(r.Context(), w, err)
			return
		}

		l := logic.NewSuggestLogic(r.Context(), svcCtx)
		resp, err := l.Suggest(&req)
		if err != nil {
			httpx.ErrorCtx(r.Context(), w, err)
		} else {
			httpx.OkJsonCtx(r.Context(), w, resp)
		}
	}
}
