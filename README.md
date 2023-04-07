命令
```text
goctl api new suggest

goctl api go -api suggest.api -dir . style go_zero

# 启动服务(需预先启动Redis)
cd suggest

go run suggest.go -f etc/suggest-api.yaml

# 配置文件(可修改MySQL及Redis配置)
suggest-api.yaml

# 访问端口
http://127.0.0.1:8888/api/suggest?keyword=
```