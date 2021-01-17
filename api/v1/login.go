package v1

import (
	"ginblog/api/server"
	"ginblog/middleware"
	"ginblog/model"
	"ginblog/utils/errmsg"
	"github.com/gin-gonic/gin"
	"net/http"
)

func Login(c *gin.Context) {
	var formData model.User
	_ = c.ShouldBindJSON(&formData)
	var token string
	var code int

	formData, code = model.CheckLogin(formData.Username, formData.Password)

	if code == errmsg.SUCCSE {
		token, code = middleware.SetToken(formData.Username)
	}
	c.JSON(http.StatusOK, &server.Message1{
		Code:  code,
		Data:    map[string]interface{}{
			"username":formData.Username,
			"id":formData.ID,
			"token":token,
		},
		Message: errmsg.GetErrMsg(code),
	})
}

// 前台登录

func LoginFront(c *gin.Context) {
	var formData model.User
	_ = c.ShouldBindJSON(&formData)
	var token string
	var code int

	formData, code = model.CheckLoginFront(formData.Username, formData.Password)

	c.JSON(http.StatusOK, server.Message1{
		Code:  code,
		Data:    map[string]interface{}{
			"username":formData.Username,
			"id":formData.ID,
			"token":token,
		},
		Message: errmsg.GetErrMsg(code),
	})
}

type UpToken struct {
	Token string `json:"token"`
}

// 验证token
func CheckToken(c *gin.Context) {
	var Token UpToken
	_ = c.ShouldBindJSON(&Token)

	_, code = middleware.CheckToken(Token.Token)

	c.JSON(http.StatusOK, server.Message1{
		Code:  code,
		Message: errmsg.GetErrMsg(code),
	})
}
