package middleware

import (
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

func Cors() gin.HandlerFunc {

	return cors.Default()
	//return cors.New(cors.Config{
	//	AllowAllOrigins: true,
	//	AllowOrigins:  []string{"*"},
	//	AllowMethods:  []string{"*"},
	//	AllowHeaders:  []string{"Origin"},
	//	//ExposeHeaders: []string{"ContentType", "Authorization"},
	//	//AllowCredentials: true,
	//	//AllowOriginFunc: func(origin string) bool {
	//	//	return origin == "https://github.com"
	//	//},
	//	MaxAge: 12 * time.Hour,
	//})

}
