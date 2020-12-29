# Ginblog（项目已完成，欢迎使用)

## 介绍

gin+vue 全栈制作一个博客。

这是一个分享全栈制作过程的项目，旨在为有兴趣接触 golang web 开发的朋友分享一些制作经验。

你可以前往 [B 站(https://space.bilibili.com/402177130)](https://space.bilibili.com/402177130) 观看全栈的制作过程，你也可以留言分享你的观点，非常乐意与你交流。



## 目录结构

```shell
│  .gitignore
│  go.mod // 项目依赖
│  go.sum
│  latest_log.log
│  LICENSE
│  main.go //主程序
│  README.md
│  tree.txt
│          
├─api         
├─config // 项目配置入口   
├─database  // 数据库备份文件（初始化）
├─log  // 项目日志
├─middleware  // 中间件
├─model // 数据模型层
├─routes
│      router.go // 路由入口    
├─static // 打包静态文件
│  ├─admin  // 后台管理页面              
│  └─front  // 前端展示页面          
├─upload   
├─utils // 项目公用工具库
│  │  setting.go 
│  ├─errmsg   
│  └─validator         
└─web // 前端开发源码（VUECLI项目源文件)
    ├─admin             
    └─front
```



## 运行&&部署

1. 克隆项目

	```shell
	git clone git@gitee.com:wejectchan/ginblog.git
	or
	git clone https://github.com/wejectchen/Ginblog.git
	```

2. 转到下面文件夹下


	cd yourPath/ginbolg


3. 安装依赖

```
go mod tidy
```

4. 启动数据库配置config.ini

```ini
config.ini

[server]
AppMode = debug # debug 开发模式，release 生产模式
HttpPort = :3000 # 项目端口
JwtKey = 89js82js72 #JWT密钥，随机字符串即可

[database]
Db = mysql #数据库类型，不能变更为其他形式
DbHost = 127.0.0.1 # 数据库地址
DbPort = 3306 # 数据库端口
DbUser = ginblog # 数据库用户名
DbPassWord = admin123 # 数据库用户密码
DbName = ginblog # 数据库名

[qiniu]
# 七牛储存信息
AccessKey = # AK
SecretKey = # SK
Bucket = 
QiniuSever =
```

5. 在database中将sql文件导入数据库

	推荐navicat或者其他sql管理工具导入

6. 启动项目

```go
go run main.go
```



此时，项目启动，你可以访问页面

```shell
首页
http://localhost:3000
后台管理页面
http://localhost:3000/admin

默认管理员:admin  密码:123456
```



enjoy~~~~

#### 使用、二开过程中，发现问题或者有功能需求欢迎提交 `Iusse` 或者直接 `PR`

## 实现功能

1.  简单的用户管理权限设置
2.  用户密码加密存储
3.  文章分类自定义
4.  列表分页
5.  图片上传七牛云
6.  JWT 认证
7.  自定义日志功能
8.  跨域 cors 设置
9.  [todo] 文章评论功能

## 技术栈

- golang
  - Gin web framework
  - gorm(v1 && v2)
  - jwt-go
  - scrypt
  - logrus
  - gin-contrib/cors
  - go-playground/validator/v10
  - go-ini
- JavaScript
  - vue
  - vue cli
  - vue router
  - ant design vue
  - vuetify
  - axios
  - tinymce
  - moment
- MySQL version:8.0.21

## 项目预览

- 前端展示页面
  ![](https://gitee.com/wejectchan/ginblog/raw/frontDev/upload/front1.png)

- 前端展示页面
  ![](https://gitee.com/wejectchan/ginblog/raw/frontDev/upload/front2.png)

- 后台登录页面

  ![](https://gitee.com/wejectchan/ginblog/raw/master/upload/admin.jpg)

- 后台管理页面

  ![](https://gitee.com/wejectchan/ginblog/raw/master/upload/admin2.jpg)



## 更新进度(制作视频已基本全部更新完毕)

### 后端完成

[第一节 初始化项目+配置参数](https://www.bilibili.com/video/BV1AA411v7e6)

[第二节 配置数据库，数据模型](https://www.bilibili.com/video/BV1A5411a7cf)

[第三节 构架错误处理模块和路由接口](https://www.bilibili.com/video/BV1oA411e7kM)

[第四节 编写用户模块接口，实现初步验证+分页功能](https://www.bilibili.com/video/BV1A5411a7qw)

[第五节 用户密码加密存储策略介绍及选择](https://www.bilibili.com/video/BV1AD4y1D7BX)

[第六节 编写编辑用户信息+删除用户接口](https://www.bilibili.com/video/BV19f4y1R7RE)

[第七节 完成博客分类接口编写](https://www.bilibili.com/video/BV16Z4y1T7Nc)

[第八节 编写博客文章接口（新增、编辑、删除）](https://www.bilibili.com/video/BV1JD4y1U76f)

[第九节 完成博客文章接口（文章和分类的关联查询）](https://www.bilibili.com/video/BV1YT4y1j7Co)

[第十节 编写登录接口，完成 JWT 中间件](https://www.bilibili.com/video/BV1Mp4y1q76P)

[第十一节 完成登录接口](https://www.bilibili.com/video/BV1cZ4y1M79w)

[第十二节 完成上传接口（GIN+七牛对象储存）](https://www.bilibili.com/video/BV17V411z7cW)

[第十三节 处理日志系统（自定义日志、按时间分割日志、软连接最新日志）](https://www.bilibili.com/video/BV16v411v7D7)

[第十四节 后端数据验证、跨域参数配置、增加列表查询的总数返回](https://www.bilibili.com/video/BV1Hi4y1g7aj)

### 前端后台管理页面完成

[第一节 前端初始化，开发环境搭建及相关依赖安装](https://www.bilibili.com/video/BV16T4y157JB)

[第二节 编写登录页面，实现数据双向绑定和数据验证](https://www.bilibili.com/video/BV1oi4y1u7ZJ)

[第三节 完成登录页面](https://www.bilibili.com/video/BV1JK4y1Y7pd)

[第四节 配置路由导航守卫，搭建后台管理页面框架](https://www.bilibili.com/video/BV1Ni4y1g7ju)

[第五节 完成后台页面菜单栏和页面路由跳转](https://www.bilibili.com/video/BV1sC4y187Pc)

[第六节 编写用户列表页面](https://www.bilibili.com/video/BV19D4y127U9)

[第七节 用户列表搜索和删除功能](https://www.bilibili.com/video/BV19V411U7ud)

[第八节 完成用户列表新增用户和编辑用户功能](https://www.bilibili.com/video/BV19D4y127kb)

[第九节 修复部分 BUG](https://www.bilibili.com/video/BV19h411d7eF)

[第十节 编写分类列表和文章列表页面](https://www.bilibili.com/video/BV1rv411y7Wm)

[第十一节 完成新增文章和编辑文章页面](https://www.bilibili.com/video/BV19h41197BB)

[第十二节 自定义封装 tinymce 富文本编辑器，实现编辑器本地上传图片等功能](https://www.bilibili.com/video/BV1Uz4y1f76J)

[第十三节 后台页面完结，vue 打包部署](https://www.bilibili.com/video/BV12i4y1M7eD)

### 前端展示页面（正在更新中）

[第一节 搭建项目框架](https://www.bilibili.com/video/BV1LX4y1u7py)

[第二节 编写主内容区+个人介绍](https://www.bilibili.com/video/BV1EZ4y137qG)

[第三节 完成个人简介更新功能](https://www.bilibili.com/video/BV17v411t7Gw)

[第四节 完成文章列表页面](https://www.bilibili.com/video/BV17y4y1U7FB)

[第五节 完成文章详情页面](https://www.bilibili.com/video/BV1Eo4y1Z7c9)



## Thanks for free JetBrains Open Source license

感谢JetBrains免费开源授权

<a href="https://www.jetbrains.com" target="_blank"><img src="https://gitee.com/wejectchan/ginblog/raw/master/upload/jet.png" height="200" /></a>