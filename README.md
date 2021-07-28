# Ginblog（项目已完成，欢迎使用)

[![star](https://gitee.com/wejectchan/ginblog/badge/star.svg?theme=white)](https://gitee.com/wejectchan/ginblog/stargazers)

## 重要更新

- 2021.3.7 修改了文章阅读页面css样式。

- 2021.3.2 修改静态资源托管路径，前端项目下直接打包，不用再移动到static目录下，更加方便。

- 2021.2.12 为了交流方便，建立了一个QQ群：951736723，如果有问题，欢迎进群交流。

- 2021.2.10 增加了展示页面的移动端适配
  
  <img src="https://gitee.com/wejectchan/ginblog/raw/master/upload/mobile.png" width="250px" />
  
  <img src="https://gitee.com/wejectchan/ginblog/raw/master/upload/mobile2.png"  width="250px" />
  
  
  
- 2021.1.2 加入注册、登录、评论功能，后台管理加入评论审核功能

- 2021.1.3 增加 登录、注册验证功能；增加评论数量显示；增加阅读数量显示
         增加：文章页面评论数、阅读数

## 介绍

gin+vue 全栈制作一个博客。

这是一个分享全栈制作过程的项目，旨在为有兴趣接触 golang web 开发的朋友分享一些制作经验。

你可以前往 [B 站(https://space.bilibili.com/402177130)](https://space.bilibili.com/402177130) 观看全栈的制作过程，你也可以留言分享你的观点，非常乐意与你交流。



## 目录结构

```shell
├─  .gitignore
│  go.mod // 项目依赖
│  go.sum
│  latest_log.log #最新log日志软连接
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
│  ├─admin  // 后台管理页面 (已废弃，打包静态文件在web/admin/dist下)         
│  └─front  // 前端展示页面 (已废弃，打包静态文件在web/front/dist下)            
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

4. 初始化项目配置config.ini

```ini
./config/config.ini

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

```shell
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

#### ==使用、二开过程中，发现问题或者有功能需求欢迎提交 `Iusse` 或者直接 `PR`==

## 实现功能

1.  简单的用户管理权限设置
2.  用户密码加密存储
3.  文章分类自定义
4.  列表分页
5.  图片上传七牛云
6.  JWT 认证
7.  自定义日志功能
8.  跨域 cors 设置
9.  文章评论功能

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
  ![](https://gitee.com/wejectchan/ginblog/raw/master/upload/front1.png)

- 前端展示页面
  ![](https://gitee.com/wejectchan/ginblog/raw/master/upload/front2.png)

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

### 前端展示页面（更新完毕）

[第一节 搭建项目框架](https://www.bilibili.com/video/BV1LX4y1u7py)

[第二节 编写主内容区+个人介绍](https://www.bilibili.com/video/BV1EZ4y137qG)

[第三节 完成个人简介更新功能](https://www.bilibili.com/video/BV17v411t7Gw)

[第四节 完成文章列表页面](https://www.bilibili.com/video/BV17y4y1U7FB)

[第五节 完成文章详情页面](https://www.bilibili.com/video/BV1Eo4y1Z7c9)


##  Docker部署

### 一、如何安装docker

官方文档：[Get Docker | Docker Documentation](https://docs.docker.com/get-docker/)

选择对应的系统进行查看，以ubuntu 18.04 LTS为例

- 卸载旧版本


```shell
sudo apt-get remove docker docker-engine docker.io containerd runc
Reading package lists... Done
Building dependency tree    
Reading state information... Done
Package 'docker-engine' is not installed, so not removed
Package 'docker' is not installed, so not removed
Package 'containerd' is not installed, so not removed
Package 'docker.io' is not installed, so not removed
Package 'runc' is not installed, so not removed
0 upgraded, 0 newly installed, 0 to remove and 3 not upgraded.
```

- 添加新版本仓库


```shell
$ sudo apt-get update

$ sudo apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common
```

- 获取官方GPG key

```shell
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```



- 验证key,如果输出的是下列内容，则说明正确

```shell
$ sudo apt-key fingerprint 0EBFCD88

pub  rsa4096 2017-02-22 [SCEA]
   9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88
uid      [ unknown] Docker Release (CE deb) <docker@docker.com>
sub  rsa4096 2017-02-22 [S]
```

- 添加仓库地址


```shell
$ sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"

#也可以用国内的仓库下载，速度较快，推荐

$ sudo add-apt-repository \
  "deb [arch=amd64] https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu/ \
  $(lsb_release -cs) \
  stable"
```


- 更新仓库和安装

```shell
 $ sudo apt-get update

 $ sudo apt-get install docker-ce docker-ce-cli containerd.io
```
- 进行验证，运行hello-world

```shell
$ docker pull hello-world
$ docker run hello-world
#出现以下信息，表示docker安装成功，已经可以正常运行
Hello from Docker!
This message shows that your installation appears to be working correctly.
To generate this message, Docker took the following steps:

  1. The Docker client contacted the Docker daemon.
  2. The Docker daemon pulled the "hello-world" image from the Docker Hub.(amd64)
  3. The Docker daemon created a new container from that image which runs the executable that produces the output you are currently reading.
  4. The Docker daemon streamed that output to the Docker client, which sent it to your terminal.
	To try something more ambitious, you can run an Ubuntu container with:
	$ docker run -it ubuntu bash
	Share images, automate workflows, and more with a free Docker ID:
	https://hub.docker.com/
	For more examples and ideas, visit:
	https://docs.docker.com/get-started/
```

- 额外：配置国内仓储镜像，保证拉取速度

```shell
# 这里以阿里云为例，阿里云为用户提供了私人仓库，配置有所不同。

# 具体需要登录阿里云管理，进入控制台，找到 `镜像加速服务` -> `镜像工具` -> `镜像加速器`

sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
 "registry-mirrors": ["https://XXX你的id.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
```

到此，我们的docker环境就正式配置好了。

### 二、拉取镜像和创建镜像和容器编排

接下来，我们就要制作运行项目需要的镜像了

### Mysql服务器的镜像

**首先，个人非常不建议mysql用docker来部署，有几个原因：**

1. **必须做数据卷的映射，`千万不能` 将数据库数据放在docker容器中运行，否则一但删除容器数据将全部清空，所以一定要做数据持久化！！；**
2. **不利于io，数据读写在容器中读写一次，在绑定的卷中还要读写一次，两倍读写压力，性能上要打折扣。**

如果非要在docker上部署mysql，可以这么做

```shell
#首先确定mysql是否能被搜素到，这步可以跳过，也可以在dockerhub.com中搜索
$ docker search mysql

#拉取镜像
docker pull mysql  #这里默认是拉取的最新版本，如果需要特定版本可以在镜像后面添加tag，具体版本信息可以在dockerhub.com查询

#特定版本拉取,比如要拉取8.0.22(版本号一定要是官方放出的版本号，否则是查找不到的)
docker pull mysql:8.0.22

#这时可以查看下拉取的镜像
docker images

#运行镜像
docker run -d -p 3306:3306 -v /my/own/datadir:/var/lib/mysql --name ginblog-mysql -e MYSQL_ROOT_PASSWORD=admin123  mysql

# -d 表示后台运行，并返回容器id
# -p 3006:3306 表示端口映射，具体为 -p 主机端口：容器端口
# --name 给容器取个名字
# -e MYSQL_ROOT_PASSWORD=password 给mysql root管理员设置密码
# -v /my/own/datadir:/var/lib/mysql 添加数据卷/my/own/datadir是主机的数据库路径 /var/lib/mysql是容器中的数据库路径，这一步非常重要

#进入容器配置
docker exec -it ginblog-mysql bash

root@ed9345077e02:/# mysql -u root -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.22 MySQL Community Server - GPL
Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.
Oracle is a registered trademark of Oracle Corporation and/or its affiliates.
Other names may be trademarks of their respective owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>

# 之后就和一般情况下mysql的操作一样了。
```



### 制作ginblog项目镜像

- 首相要拉取我们的ginblog项目

```shell
# 新建一个项目文件夹，在你认为任何适合的地方都可以

$ cd /
$ mkdir app

# 我们这里利用git来远程同步

$ git clone 项目地址
```

- 编写Dockerfile

```dockerfile
FROM golang:latest
RUN go env -w GO111MODULE=on
RUN go env -w GOPROXY=https://goproxy.cn,https://goproxy.io,direct

WORKDIR $GOPATH/src/ginblog
COPY . $GOPATH/src/ginblog

RUN go build .

EXPOSE 3000

ENTRYPOINT ["./ginblog"]
```

- 配置ginblog的config

```ini
# config/config.ini

# DbHost = ginblog-mysql 是为了后面容器互通做准备，对应的是mysql容器的name

Db = mysql
DbHost = ginblog-mysql 
DbPort = 3306
DbUser = ginblog
DbPassWord = admin123
DbName = ginblog
```

这样的话，我们大概就配置好docker的build镜像文件了。

- 最后我们在确定下前端 `web` 文件夹下的axios请求地址

```js
// 在 web/admin/src/plugin/http.js 和 web/front/src/plugin/http.js 两个文件夹中,将 baseURL地址改为部署的服务器线上地址

axios.defaults.baseURL = 'http://localhost:3000/api/v1'

// 修改为

axios.defaults.baseURL = 'http://线上服务器ip或域名:3000/api/v1'
```

**别忘了，修改完地址后，重新打包下** 

```shell
$ yarn build

$ npm run build
```

### 生成镜像

最后一步，就是生成我们的ginblog docker image了，这部很简单，运行下列命令

```shell
$ docker build -t ginblog .
$ docker run -d -p 3000:3000 --name ginblog ginblog

#这样访问服务器IP:3000 就可以访问网站了
```



## Thanks for free JetBrains Open Source license

感谢JetBrains免费开源授权

<a href="https://www.jetbrains.com" target="_blank"><img src="https://gitee.com/wejectchan/ginblog/raw/master/upload/jet.png" height="200" /></a>