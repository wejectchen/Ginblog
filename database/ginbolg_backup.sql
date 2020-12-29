-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: ginbolg
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cid` bigint(20) unsigned NOT NULL,
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_article_deleted_at` (`deleted_at`) USING BTREE,
  KEY `fk_article_category` (`cid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=573 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'2020-12-29 13:48:53.928','2020-12-29 13:48:53.928',NULL,'欢迎来到Ginblog',1,'欢迎来到Ginblog，使用前请阅读。','<h2>介绍</h2>\n<p>gin+vue 全栈制作一个博客。</p>\n<p>这是一个分享全栈制作过程的项目，旨在为有兴趣接触 golang web 开发的朋友分享一些制作经验。</p>\n<p>你可以前往&nbsp;<a href=\"https://space.bilibili.com/402177130\" rel=\"nofollow\">B 站(https://space.bilibili.com/402177130)</a>&nbsp;观看全栈的制作过程，你也可以留言分享你的观点，非常乐意与你交流。</p>\n<h2><a id=\"更新进度\" class=\"anchor\" href=\"https://gitee.com/wejectchan/ginblog#%E6%9B%B4%E6%96%B0%E8%BF%9B%E5%BA%A6\"></a>更新进度</h2>\n<h3><a id=\"后端完成\" class=\"anchor\" href=\"https://gitee.com/wejectchan/ginblog#%E5%90%8E%E7%AB%AF%E5%AE%8C%E6%88%90\"></a>后端完成</h3>\n<p><a href=\"https://www.bilibili.com/video/BV1AA411v7e6\" rel=\"nofollow\">第一节 初始化项目+配置参数</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1A5411a7cf\" rel=\"nofollow\">第二节 配置数据库，数据模型</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1oA411e7kM\" rel=\"nofollow\">第三节 构架错误处理模块和路由接口</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1A5411a7qw\" rel=\"nofollow\">第四节 编写用户模块接口，实现初步验证+分页功能</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1AD4y1D7BX\" rel=\"nofollow\">第五节 用户密码加密存储策略介绍及选择</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV19f4y1R7RE\" rel=\"nofollow\">第六节 编写编辑用户信息+删除用户接口</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV16Z4y1T7Nc\" rel=\"nofollow\">第七节 完成博客分类接口编写</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1JD4y1U76f\" rel=\"nofollow\">第八节 编写博客文章接口（新增、编辑、删除）</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1YT4y1j7Co\" rel=\"nofollow\">第九节 完成博客文章接口（文章和分类的关联查询）</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1Mp4y1q76P\" rel=\"nofollow\">第十节 编写登录接口，完成 JWT 中间件</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1cZ4y1M79w\" rel=\"nofollow\">第十一节 完成登录接口</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV17V411z7cW\" rel=\"nofollow\">第十二节 完成上传接口（GIN+七牛对象储存）</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV16v411v7D7\" rel=\"nofollow\">第十三节 处理日志系统（自定义日志、按时间分割日志、软连接最新日志）</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1Hi4y1g7aj\" rel=\"nofollow\">第十四节 后端数据验证、跨域参数配置、增加列表查询的总数返回</a></p>\n<h3><a id=\"前端后台管理页面完成\" class=\"anchor\" href=\"https://gitee.com/wejectchan/ginblog#%E5%89%8D%E7%AB%AF%E5%90%8E%E5%8F%B0%E7%AE%A1%E7%90%86%E9%A1%B5%E9%9D%A2%E5%AE%8C%E6%88%90\"></a>前端后台管理页面完成</h3>\n<p><a href=\"https://www.bilibili.com/video/BV16T4y157JB\" rel=\"nofollow\">第一节 前端初始化，开发环境搭建及相关依赖安装</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1oi4y1u7ZJ\" rel=\"nofollow\">第二节 编写登录页面，实现数据双向绑定和数据验证</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1JK4y1Y7pd\" rel=\"nofollow\">第三节 完成登录页面</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1Ni4y1g7ju\" rel=\"nofollow\">第四节 配置路由导航守卫，搭建后台管理页面框架</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1sC4y187Pc\" rel=\"nofollow\">第五节 完成后台页面菜单栏和页面路由跳转</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV19D4y127U9\" rel=\"nofollow\">第六节 编写用户列表页面</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV19V411U7ud\" rel=\"nofollow\">第七节 用户列表搜索和删除功能</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV19D4y127kb\" rel=\"nofollow\">第八节 完成用户列表新增用户和编辑用户功能</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV19h411d7eF\" rel=\"nofollow\">第九节 修复部分 BUG</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1rv411y7Wm\" rel=\"nofollow\">第十节 编写分类列表和文章列表页面</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV19h41197BB\" rel=\"nofollow\">第十一节 完成新增文章和编辑文章页面</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1Uz4y1f76J\" rel=\"nofollow\">第十二节 自定义封装 tinymce 富文本编辑器，实现编辑器本地上传图片等功能</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV12i4y1M7eD\" rel=\"nofollow\">第十三节 后台页面完结，vue 打包部署</a></p>\n<h3><a id=\"前端展示页面正在更新中\" class=\"anchor\" href=\"https://gitee.com/wejectchan/ginblog#%E5%89%8D%E7%AB%AF%E5%B1%95%E7%A4%BA%E9%A1%B5%E9%9D%A2%E6%AD%A3%E5%9C%A8%E6%9B%B4%E6%96%B0%E4%B8%AD\"></a>前端展示页面（正在更新中）</h3>\n<p><a href=\"https://www.bilibili.com/video/BV1LX4y1u7py\" rel=\"nofollow\">第一节 搭建项目框架</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1EZ4y137qG\" rel=\"nofollow\">第二节 编写主内容区+个人介绍</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV17v411t7Gw\" rel=\"nofollow\">第三节 完成个人简介更新功能</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV17y4y1U7FB\" rel=\"nofollow\">第四节 完成文章列表页面</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1Eo4y1Z7c9\" rel=\"nofollow\">第四节 完成文章详情页面</a></p>\n<h2><a id=\"实现功能\" class=\"anchor\" href=\"https://gitee.com/wejectchan/ginblog#%E5%AE%9E%E7%8E%B0%E5%8A%9F%E8%83%BD\"></a>实现功能</h2>\n<ol>\n<li>简单的用户管理权限设置</li>\n<li>用户密码加密存储</li>\n<li>文章分类自定义</li>\n<li>列表分页</li>\n<li>图片上传七牛云</li>\n<li>JWT 认证</li>\n<li>自定义日志功能</li>\n<li>跨域 cors 设置</li>\n<li>todo 文章评论功能</li>\n</ol>\n<h2><a id=\"技术栈\" class=\"anchor\" href=\"https://gitee.com/wejectchan/ginblog#%E6%8A%80%E6%9C%AF%E6%A0%88\"></a>技术栈</h2>\n<ul>\n<li>golang\n<ul>\n<li>Gin web framework</li>\n<li>gorm(v1 &amp;&amp; v2)</li>\n<li>jwt-go</li>\n<li>scrypt</li>\n<li>logrus</li>\n<li>gin-contrib/cors</li>\n<li>go-playground/validator/v10</li>\n<li>go-ini</li>\n</ul>\n</li>\n<li>JavaScript\n<ul>\n<li>vue</li>\n<li>vue cli</li>\n<li>vue router</li>\n<li>ant design vue</li>\n<li>vuetify</li>\n<li>axios</li>\n<li>tinymce</li>\n<li>moment</li>\n</ul>\n</li>\n<li>MySQL version:8.0.21</li>\n</ul>\n<h2><a id=\"项目预览\" class=\"anchor\" href=\"https://gitee.com/wejectchan/ginblog#%E9%A1%B9%E7%9B%AE%E9%A2%84%E8%A7%88\"></a>项目预览</h2>\n<ul>\n<li>\n<p>前端展示页面&nbsp;<img src=\"https://gitee.com/wejectchan/ginblog/raw/frontDev/upload/front1.png\" alt=\"\" /></p>\n</li>\n<li>\n<p>前端展示页面&nbsp;<img src=\"https://gitee.com/wejectchan/ginblog/raw/frontDev/upload/front2.png\" alt=\"\" /></p>\n</li>\n<li>\n<p>后台登录页面</p>\n<p><img src=\"https://gitee.com/wejectchan/ginblog/raw/master/upload/admin.jpg\" alt=\"\" /></p>\n</li>\n<li>\n<p>后台管理页面</p>\n<p><img src=\"https://gitee.com/wejectchan/ginblog/raw/master/upload/admin2.jpg\" alt=\"\" /></p>\n</li>\n</ul>\n<h2><a id=\"thanks-for-free-jetbrains-open-source-license\" class=\"anchor\" href=\"https://gitee.com/wejectchan/ginblog#thanks-for-free-jetbrains-open-source-license\"></a>Thanks for free JetBrains Open Source license</h2>\n<p>感谢JetBrains免费开源授权</p>\n<p><a href=\"https://www.jetbrains.com/\" target=\"_blank\" rel=\"nofollow noopener\"><img src=\"https://gitee.com/wejectchan/ginblog/raw/master/upload/jet.png\" height=\"200\" /></a></p>','http://test.scjglaw.cn/FgOelQ27qspf1pAE8EIrT7p0AMPl');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Ginblog');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qqchat` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `wechat` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `weibo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bili` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'weject','请输入个人介绍','QQ号码','微信号码','微博地址','B站地址','电子邮箱','http://test.scjglaw.cn/FsdR3jZStpoxJ1652sFmNMtwqiFY','http://test.scjglaw.cn/Fm63wdxiVmW7xN3z2R-czYUdMmLY');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` bigint(20) DEFAULT '2',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL,NULL,NULL,'admin','JNDo6/pbVgBrXw==',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-29 19:04:48
