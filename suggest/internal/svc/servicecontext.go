package svc

import (
	"API_Test/suggest/internal/config"
	"API_Test/suggest/models"
	"github.com/go-redis/redis/v8"
	"xorm.io/xorm"
)

type ServiceContext struct {
	Config config.Config
	Engine *xorm.Engine
	RDB    *redis.Client
}

func NewServiceContext(c config.Config) *ServiceContext {
	return &ServiceContext{
		Config: c,
		Engine: models.Init(c.Mysql.DataSource),
		RDB:    models.InitRedis(c),
	}
}
