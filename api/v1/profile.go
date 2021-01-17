package v1

import (
	"ginblog/api/server"
	"ginblog/model"
	"ginblog/utils/errmsg"
	"github.com/gin-gonic/gin"
	"net/http"
	"strconv"
)

func GetProfile(c *gin.Context)  {
	id, _ := strconv.Atoi(c.Param("id"))
	data, code := model.GetProfile(id)
	c.JSON(http.StatusOK, &server.Message1{
		Code:  code,
		Data:    data,
		Message: errmsg.GetErrMsg(code),
	})
}

func UpdateProfile(c *gin.Context) {
	var data model.Profile
	id, _ := strconv.Atoi(c.Param("id"))
	_ = c.ShouldBindJSON(&data)

	code = model.UpdateProfile(id, &data)

	c.JSON(http.StatusOK, &server.Message1{
		Code:  code,
		Message: errmsg.GetErrMsg(code),
	})
}
