package routes

import (
	"ginblog/api/v1"
	"ginblog/middleware"
	"ginblog/utils"
	"github.com/gin-contrib/multitemplate"
	"github.com/gin-gonic/gin"
)

func createMyRender() multitemplate.Renderer {
	p := multitemplate.NewRenderer()
	p.AddFromFiles("admin", "static/admin/index.html")
	p.AddFromFiles("front", "static/front/index.html")
	return p
}

func InitRouter() {
	gin.SetMode(utils.AppMode)
	r := gin.New()
	r.HTMLRender = createMyRender()
	r.Use(middleware.Log())
	r.Use(gin.Recovery())
	r.Use(middleware.Cors())

	r.Static("/static","./static/front/static")
	r.Static("/admin","./static/admin")
	r.StaticFile("/favicon.ico","static/front/favicon.ico")

	r.GET("/", func(c *gin.Context) {
		c.HTML(200,"front",nil)
	})

	r.GET("/admin", func(c *gin.Context) {
		c.HTML(200,"admin",nil)
	})

	auth := r.Group("api/v1")
	auth.Use(middleware.JwtToken())
	{
		// 用户模块的路由接口
		auth.PUT("user/:id", v1.EditUser)
		auth.DELETE("user/:id", v1.DeleteUser)
		// 分类模块的路由接口
		auth.POST("category/add", v1.AddCategory)
		auth.PUT("category/:id", v1.EditCate)
		auth.DELETE("category/:id", v1.DeleteCate)
		// 文章模块的路由接口
		auth.POST("article/add", v1.AddArticle)
		auth.PUT("article/:id", v1.EditArt)
		auth.DELETE("article/:id", v1.DeleteArt)
		// 上传文件
		auth.POST("upload", v1.UpLoad)
		// 更新个人设置
		auth.PUT("profile/:id", v1.UpdateProfile)
	}
	router := r.Group("api/v1")
	{

		router.POST("user/add", v1.AddUser)
		router.GET("user/:id", v1.GetUserInfo)
		router.GET("users", v1.GetUsers)
		router.GET("category", v1.GetCate)
		router.GET("category/:id", v1.GetCateInfo)
		router.GET("article", v1.GetArt)
		router.GET("article/list/:id", v1.GetCateArt)
		router.GET("article/info/:id", v1.GetArtInfo)
		router.POST("login", v1.Login)
		router.GET("profile/:id", v1.GetProfile)
	}

	_ = r.Run(utils.HttpPort)

}
