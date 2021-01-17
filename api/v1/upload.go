package v1

import (
	"ginblog/api/server"
	"ginblog/model"
	"ginblog/utils/errmsg"
	"github.com/gin-gonic/gin"
	"net/http"
)

func UpLoad(c *gin.Context) {
	file, fileHeader, _ := c.Request.FormFile("file")

	fileSize := fileHeader.Size

	url, code := model.UpLoadFile(file, fileSize)

	c.JSON(http.StatusOK, &server.Message1{
		Code:  code,
		Message: errmsg.GetErrMsg(code),
		Data: map[string]interface{}{
			"url":url,
		},
	})

}
