package main

import (
	"ginblog/model"
	"ginblog/routes"
)

func main() {
	// 引用数据库
	model.InitDb()
    // 引入路由组件
	routes.InitRouter()

}
