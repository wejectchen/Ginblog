package middleware

import (
	"ginblog/utils"
	"ginblog/utils/errmsg"
	"github.com/dgrijalva/jwt-go"
	"github.com/gin-gonic/gin"
	"net/http"
	"strings"
	"time"
)

var JwtKey = []byte(utils.JwtKey)

type MyClaims struct {
	Username string `json:"username"`
	jwt.StandardClaims
}

// 生成token
func SetToken(username string) (string, int) {
	expireTime := time.Now().Add(10 * time.Hour)
	SetClaims := MyClaims{
		username,
		jwt.StandardClaims{
			ExpiresAt: expireTime.Unix(),
			Issuer:    "ginblog",
		},
	}

	reqClaim := jwt.NewWithClaims(jwt.SigningMethodHS256, SetClaims)
	token, err := reqClaim.SignedString(JwtKey)
	if err != nil {
		return "", errmsg.ERROR
	}
	return token, errmsg.SUCCSE

}

// 验证token

func CheckToken(token string) (*MyClaims, int) {
	var claims MyClaims
	var err error
	setToken, _ := jwt.ParseWithClaims(token, &claims, func(token *jwt.Token) (interface{}, error) {
		return JwtKey, nil
	})

	if key, ok := setToken.Claims.(*MyClaims); ok && setToken.Valid {
		return key, errmsg.SUCCSE
	} else {
		ve := err.(*jwt.ValidationError)
		if ve.Errors&jwt.ValidationErrorMalformed != 0 {
			return nil, errmsg.ERROR_TOKEN_WRONG
		} else if ve.Errors&(jwt.ValidationErrorExpired|jwt.ValidationErrorNotValidYet) != 0 {
			return nil, errmsg.ERROR_TOKEN_RUNTIME
		} else {
			return nil, errmsg.ERROR_TOKEN_TYPE_WRONG
		}
	}

}

// jwt中间件
func JwtToken() gin.HandlerFunc {
	return func(c *gin.Context) {
		var code int
		tokenHerder := c.Request.Header.Get("Authorization")
		if tokenHerder == "" {
			code = errmsg.ERROR_TOKEN_TYPE_WRONG
			c.JSON(http.StatusOK, gin.H{
				"code":    code,
				"message": errmsg.GetErrMsg(code),
			})
			c.Abort()
			return
		}
		checkToken := strings.Split(tokenHerder, " ")
		if len(checkToken) == 0 {
			code = errmsg.ERROR_TOKEN_TYPE_WRONG
			c.JSON(http.StatusOK, gin.H{
				"code":    code,
				"message": errmsg.GetErrMsg(code),
			})
			c.Abort()
			return
		}

		if len(checkToken) != 2 && checkToken[0] != "Bearer" {
			code = errmsg.ERROR_TOKEN_TYPE_WRONG
			c.JSON(http.StatusOK, gin.H{
				"code":    code,
				"message": errmsg.GetErrMsg(code),
			})
			c.Abort()
			return
		}
		key, tCode := CheckToken(checkToken[1])
		if tCode != errmsg.SUCCSE {
			code = tCode
			c.JSON(http.StatusOK, gin.H{
				"code":    code,
				"message": errmsg.GetErrMsg(code),
			})
			c.Abort()
			return
		}
		c.Set("username", key)
		c.Next()
	}
}
