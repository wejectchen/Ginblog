package model

import (
	"context"
	"github.com/qiniu/go-sdk/v7/auth/qbox"
	"github.com/qiniu/go-sdk/v7/storage"
	"github.com/wejectchen/ginblog/utils"
	"github.com/wejectchen/ginblog/utils/errmsg"
	"mime/multipart"
)

var Zone = utils.Zone
var AccessKey = utils.AccessKey
var SecretKey = utils.SecretKey
var Bucket = utils.Bucket
var ImgUrl = utils.QiniuSever

// UpLoadFile 上传文件函数
func UpLoadFile(file multipart.File, fileSize int64) (string, int) {
	putPolicy := storage.PutPolicy{
		Scope: Bucket,
	}
	mac := qbox.NewMac(AccessKey, SecretKey)
	upToken := putPolicy.UploadToken(mac)

	cfg := setConfig()

	putExtra := storage.PutExtra{}

	formUploader := storage.NewFormUploader(&cfg)
	ret := storage.PutRet{}

	err := formUploader.PutWithoutKey(context.Background(), &ret, upToken, file, fileSize, &putExtra)
	if err != nil {
		return "", errmsg.ERROR
	}
	url := ImgUrl + ret.Key
	return url, errmsg.SUCCESS
}

func setConfig() storage.Config {
	cfg := storage.Config{
		Zone:          selectZone(Zone),
		UseCdnDomains: false,
		UseHTTPS:      false,
	}
	return cfg
}

func selectZone(id int) *storage.Zone {
	switch id {
	case 1:
		return &storage.ZoneHuadong
	case 2:
		return &storage.ZoneHuabei
	case 3:
		return &storage.ZoneHuanan
	default:
		return &storage.ZoneHuadong
	}
}
