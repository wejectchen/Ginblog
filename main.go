package main

import (
	"github.com/wejectchen/ginblog/model"
	"github.com/wejectchen/ginblog/routes"
)

func main() {
	// 引用数据库
	model.InitDb()
	// 引入路由组件
	routes.InitRouter()

}
