package v1

import (
	"ginblog/api/server"
	"ginblog/model"
	"ginblog/utils/errmsg"
	"github.com/gin-gonic/gin"
	"net/http"
	"strconv"
)

// 添加文章
func AddArticle(c *gin.Context) {
	var data model.Article
	_ = c.ShouldBindJSON(&data)

	code = model.CreateArt(&data)

	c.JSON(http.StatusOK, &server.Message1{
		Code:  code,
		Data:    data,
		Message: errmsg.GetErrMsg(code),
	})
}

//  查询分类下的所有文章
func GetCateArt(c *gin.Context) {
	pageSize, _ := strconv.Atoi(c.Query("pagesize"))
	pageNum, _ := strconv.Atoi(c.Query("pagenum"))
	id, _ := strconv.Atoi(c.Param("id"))

	switch {
	case pageSize >= 100:
		pageSize = 100
	case pageSize <= 0:
		pageSize = 10
	}

	if pageNum == 0 {
		pageNum = 1
	}

	data, code, total := model.GetCateArt(id, pageSize, pageNum)

	c.JSON(http.StatusOK, &server.Message1{
		Code:  code,
		Data:   map[string]interface{}{
			"list":data,
			"total":total,
		},
		Message: errmsg.GetErrMsg(code),
	})
}

// 查询单个文章信息
func GetArtInfo(c *gin.Context) {
	id, _ := strconv.Atoi(c.Param("id"))
	data, code := model.GetArtInfo(id)
	c.JSON(http.StatusOK, &server.Message1{
		Code:  code,
		Data:    data,
		Message: errmsg.GetErrMsg(code),
	})
}

// 查询文章列表
func GetArt(c *gin.Context) {
	pageSize, _ := strconv.Atoi(c.Query("pagesize"))
	pageNum, _ := strconv.Atoi(c.Query("pagenum"))
	title := c.Query("title")

	switch {
	case pageSize >= 100:
		pageSize = 100
	case pageSize <= 0:
		pageSize = 10
	}

	if pageNum == 0 {
		pageNum = 1
	}

	data, code, total := model.GetArt(title, pageSize, pageNum)

	c.JSON(http.StatusOK, &server.Message1{
		Code:  code,
		Data:    map[string]interface{}{
			"list":data,
			"total":total,
		},
		Message: errmsg.GetErrMsg(code),
	})
}

// 编辑文章
func EditArt(c *gin.Context) {
	var data model.Article
	id, _ := strconv.Atoi(c.Param("id"))
	_ = c.ShouldBindJSON(&data)

	code = model.EditArt(id, &data)

	c.JSON(http.StatusOK, &server.Message1{
		Code:  code,
		Message: errmsg.GetErrMsg(code),
	})
}

// 删除文章
func DeleteArt(c *gin.Context) {
	id, _ := strconv.Atoi(c.Param("id"))

	code = model.DeleteArt(id)

	c.JSON(http.StatusOK, &server.Message1{
		Code:  code,
		Message: errmsg.GetErrMsg(code),
	})
}
