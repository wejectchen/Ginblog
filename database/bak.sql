/*
 Navicat Premium Data Transfer

 Source Server         : mariaDB
 Source Server Type    : MariaDB
 Source Server Version : 100508
 Source Host           : localhost:3306
 Source Schema         : ginblog

 Target Server Type    : MariaDB
 Target Server Version : 100508
 File Encoding         : 65001

 Date: 09/02/2021 17:06:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cid` bigint(20) UNSIGNED NOT NULL,
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment_count` bigint(20) NOT NULL DEFAULT 0,
  `read_count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_article_deleted_at`(`deleted_at`) USING BTREE,
  INDEX `fk_article_category`(`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 574 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, '2021-01-04 22:47:34.425', '2021-01-04 22:47:34.425', NULL, '欢迎来到Ginblog', 1, '使用前请阅读', '<p>重要更新 2021.1.2 加入注册、登录、评论功能，后台管理加入评论审核功能</p>\n<h2><a id=\"介绍\" class=\"anchor\" href=\"https://gitee.com/wejectchan/ginblog#%E4%BB%8B%E7%BB%8D\"></a>介绍</h2>\n<p>gin+vue 全栈制作一个博客。</p>\n<p>这是一个分享全栈制作过程的项目，旨在为有兴趣接触 golang web 开发的朋友分享一些制作经验。</p>\n<p>你可以前往&nbsp;<a href=\"https://space.bilibili.com/402177130\" rel=\"nofollow\">B 站(https://space.bilibili.com/402177130)</a>&nbsp;观看全栈的制作过程，你也可以留言分享你的观点，非常乐意与你交流。</p>\n<h2><a id=\"目录结构\" class=\"anchor\" href=\"https://gitee.com/wejectchan/ginblog#%E7%9B%AE%E5%BD%95%E7%BB%93%E6%9E%84\"></a>目录结构</h2>\n<div class=\"white\">\n<div class=\"highlight\">\n<pre><span id=\"LC1\" class=\"line\">│  .gitignore</span>\n<span id=\"LC2\" class=\"line\">│  go.mod // 项目依赖</span>\n<span id=\"LC3\" class=\"line\">│  go.sum</span>\n<span id=\"LC4\" class=\"line\">│  latest_log.log</span>\n<span id=\"LC5\" class=\"line\">│  LICENSE</span>\n<span id=\"LC6\" class=\"line\">│  main.go //主程序</span>\n<span id=\"LC7\" class=\"line\">│  README.md</span>\n<span id=\"LC8\" class=\"line\">│  tree.txt</span>\n<span id=\"LC9\" class=\"line\">│          </span>\n<span id=\"LC10\" class=\"line\">├─api         </span>\n<span id=\"LC11\" class=\"line\">├─config // 项目配置入口   </span>\n<span id=\"LC12\" class=\"line\">├─database  // 数据库备份文件（初始化）</span>\n<span id=\"LC13\" class=\"line\">├─log  // 项目日志</span>\n<span id=\"LC14\" class=\"line\">├─middleware  // 中间件</span>\n<span id=\"LC15\" class=\"line\">├─model // 数据模型层</span>\n<span id=\"LC16\" class=\"line\">├─routes</span>\n<span id=\"LC17\" class=\"line\">│      router.go // 路由入口    </span>\n<span id=\"LC18\" class=\"line\">├─static // 打包静态文件</span>\n<span id=\"LC19\" class=\"line\">│  ├─admin  // 后台管理页面              </span>\n<span id=\"LC20\" class=\"line\">│  └─front  // 前端展示页面          </span>\n<span id=\"LC21\" class=\"line\">├─upload   </span>\n<span id=\"LC22\" class=\"line\">├─utils // 项目公用工具库</span>\n<span id=\"LC23\" class=\"line\">│  │  setting.go </span>\n<span id=\"LC24\" class=\"line\">│  ├─errmsg   </span>\n<span id=\"LC25\" class=\"line\">│  └─validator         </span>\n<span id=\"LC26\" class=\"line\">└─web // 前端开发源码（VUECLI项目源文件<span class=\"o\">)</span></span>\n<span id=\"LC27\" class=\"line\">    ├─admin             </span>\n<span id=\"LC28\" class=\"line\">    └─front</span></pre>\n</div>\n</div>\n<h2><a id=\"运行部署\" class=\"anchor\" href=\"https://gitee.com/wejectchan/ginblog#%E8%BF%90%E8%A1%8C%E9%83%A8%E7%BD%B2\"></a>运行&amp;&amp;部署</h2>\n<ol>\n<li>\n<p>克隆项目</p>\n<div class=\"white\">\n<div class=\"highlight\">\n<pre><span id=\"LC1\" class=\"line\">git clone git@gitee.com:wejectchan/ginblog.git</span>\n<span id=\"LC2\" class=\"line\">or</span>\n<span id=\"LC3\" class=\"line\">git clone https://github.com/wejectchen/Ginblog.git</span></pre>\n</div>\n</div>\n</li>\n<li>\n<p>转到下面文件夹下</p>\n<p>cd yourPath/ginbolg</p>\n</li>\n<li>\n<p>安装依赖</p>\n</li>\n</ol>\n<div class=\"white\">\n<div class=\"highlight\">\n<pre><span id=\"LC1\" class=\"line\">go mod tidy</span></pre>\n</div>\n</div>\n<ol start=\"4\">\n<li>初始化项目配置config.ini</li>\n</ol>\n<div class=\"white\">\n<div class=\"highlight\">\n<pre><span id=\"LC1\" class=\"line\"><span class=\"err\">./config/config.ini</span></span>\n<span id=\"LC2\" class=\"line\"></span>\n<span id=\"LC3\" class=\"line\"><span class=\"nn\">[server]</span></span>\n<span id=\"LC4\" class=\"line\"><span class=\"py\">AppMode</span> <span class=\"p\">=</span> <span class=\"s\">debug # debug 开发模式，release 生产模式</span></span>\n<span id=\"LC5\" class=\"line\"><span class=\"py\">HttpPort</span> <span class=\"p\">=</span> <span class=\"s\">:3000 # 项目端口</span></span>\n<span id=\"LC6\" class=\"line\"><span class=\"py\">JwtKey</span> <span class=\"p\">=</span> <span class=\"s\">89js82js72 #JWT密钥，随机字符串即可</span></span>\n<span id=\"LC7\" class=\"line\"></span>\n<span id=\"LC8\" class=\"line\"><span class=\"nn\">[database]</span></span>\n<span id=\"LC9\" class=\"line\"><span class=\"py\">Db</span> <span class=\"p\">=</span> <span class=\"s\">mysql #数据库类型，不能变更为其他形式</span></span>\n<span id=\"LC10\" class=\"line\"><span class=\"py\">DbHost</span> <span class=\"p\">=</span> <span class=\"s\">127.0.0.1 # 数据库地址</span></span>\n<span id=\"LC11\" class=\"line\"><span class=\"py\">DbPort</span> <span class=\"p\">=</span> <span class=\"s\">3306 # 数据库端口</span></span>\n<span id=\"LC12\" class=\"line\"><span class=\"py\">DbUser</span> <span class=\"p\">=</span> <span class=\"s\">ginblog # 数据库用户名</span></span>\n<span id=\"LC13\" class=\"line\"><span class=\"py\">DbPassWord</span> <span class=\"p\">=</span> <span class=\"s\">admin123 # 数据库用户密码</span></span>\n<span id=\"LC14\" class=\"line\"><span class=\"py\">DbName</span> <span class=\"p\">=</span> <span class=\"s\">ginblog # 数据库名</span></span>\n<span id=\"LC15\" class=\"line\"></span>\n<span id=\"LC16\" class=\"line\"><span class=\"nn\">[qiniu]</span></span>\n<span id=\"LC17\" class=\"line\"><span class=\"c\"># 七牛储存信息</span></span>\n<span id=\"LC18\" class=\"line\"><span class=\"py\">AccessKey</span> <span class=\"p\">=</span> <span class=\"c\"># AK</span></span>\n<span id=\"LC19\" class=\"line\"><span class=\"s\">SecretKey = # SK</span></span>\n<span id=\"LC20\" class=\"line\"><span class=\"py\">Bucket</span> <span class=\"p\">=</span> </span>\n<span id=\"LC21\" class=\"line\"><span class=\"s\">QiniuSever =</span></span></pre>\n</div>\n</div>\n<ol start=\"5\">\n<li>\n<p>在database中将sql文件导入数据库</p>\n<p>推荐navicat或者其他sql管理工具导入</p>\n</li>\n<li>\n<p>启动项目</p>\n</li>\n</ol>\n<div class=\"white\">\n<div class=\"highlight\">\n<pre><span id=\"LC1\" class=\"line\"> go run main.go</span></pre>\n</div>\n</div>\n<p>此时，项目启动，你可以访问页面</p>\n<div class=\"white\">\n<div class=\"highlight\">\n<pre><span id=\"LC1\" class=\"line\">首页</span>\n<span id=\"LC2\" class=\"line\">http://localhost:3000</span>\n<span id=\"LC3\" class=\"line\">后台管理页面</span>\n<span id=\"LC4\" class=\"line\">http://localhost:3000/admin</span>\n<span id=\"LC5\" class=\"line\"></span>\n<span id=\"LC6\" class=\"line\">默认管理员:admin  密码:123456</span></pre>\n</div>\n</div>\n<p>enjoy~~~~</p>\n<h4><a id=\"使用二开过程中发现问题或者有功能需求欢迎提交-iusse-或者直接-pr\" class=\"anchor\" href=\"https://gitee.com/wejectchan/ginblog#%E4%BD%BF%E7%94%A8%E4%BA%8C%E5%BC%80%E8%BF%87%E7%A8%8B%E4%B8%AD%E5%8F%91%E7%8E%B0%E9%97%AE%E9%A2%98%E6%88%96%E8%80%85%E6%9C%89%E5%8A%9F%E8%83%BD%E9%9C%80%E6%B1%82%E6%AC%A2%E8%BF%8E%E6%8F%90%E4%BA%A4-iusse-%E6%88%96%E8%80%85%E7%9B%B4%E6%8E%A5-pr\"></a>==使用、二开过程中，发现问题或者有功能需求欢迎提交&nbsp;<code>Iusse</code>&nbsp;或者直接&nbsp;<code>PR</code>==</h4>\n<h2><a id=\"实现功能\" class=\"anchor\" href=\"https://gitee.com/wejectchan/ginblog#%E5%AE%9E%E7%8E%B0%E5%8A%9F%E8%83%BD\"></a>实现功能</h2>\n<ol>\n<li>简单的用户管理权限设置</li>\n<li>用户密码加密存储</li>\n<li>文章分类自定义</li>\n<li>列表分页</li>\n<li>图片上传七牛云</li>\n<li>JWT 认证</li>\n<li>自定义日志功能</li>\n<li>跨域 cors 设置</li>\n<li>[todo] 文章评论功能</li>\n</ol>\n<h2><a id=\"技术栈\" class=\"anchor\" href=\"https://gitee.com/wejectchan/ginblog#%E6%8A%80%E6%9C%AF%E6%A0%88\"></a>技术栈</h2>\n<ul>\n<li>golang\n<ul>\n<li>Gin web framework</li>\n<li>gorm(v1 &amp;&amp; v2)</li>\n<li>jwt-go</li>\n<li>scrypt</li>\n<li>logrus</li>\n<li>gin-contrib/cors</li>\n<li>go-playground/validator/v10</li>\n<li>go-ini</li>\n</ul>\n</li>\n<li>JavaScript\n<ul>\n<li>vue</li>\n<li>vue cli</li>\n<li>vue router</li>\n<li>ant design vue</li>\n<li>vuetify</li>\n<li>axios</li>\n<li>tinymce</li>\n<li>moment</li>\n</ul>\n</li>\n<li>MySQL version:8.0.21</li>\n</ul>\n<h2><a id=\"项目预览\" class=\"anchor\" href=\"https://gitee.com/wejectchan/ginblog#%E9%A1%B9%E7%9B%AE%E9%A2%84%E8%A7%88\"></a>项目预览</h2>\n<ul>\n<li>\n<p>前端展示页面</p>\n</li>\n<li>\n<p>&nbsp;<img src=\"https://gitee.com/wejectchan/ginblog/raw/master/upload/front1.png\" alt=\"\" /></p>\n</li>\n<li>\n<p>前端展示页面</p>\n</li>\n<li>\n<p>&nbsp;<img src=\"https://gitee.com/wejectchan/ginblog/raw/master/upload/front2.png\" alt=\"\" /></p>\n</li>\n<li>\n<p>后台登录页面</p>\n<p><img src=\"https://gitee.com/wejectchan/ginblog/raw/master/upload/admin.jpg\" alt=\"\" /></p>\n</li>\n<li>\n<p>后台管理页面</p>\n<p><img src=\"https://gitee.com/wejectchan/ginblog/raw/master/upload/admin2.jpg\" alt=\"\" /></p>\n</li>\n</ul>\n<h2><a id=\"更新进度制作视频已基本全部更新完毕\" class=\"anchor\" href=\"https://gitee.com/wejectchan/ginblog#%E6%9B%B4%E6%96%B0%E8%BF%9B%E5%BA%A6%E5%88%B6%E4%BD%9C%E8%A7%86%E9%A2%91%E5%B7%B2%E5%9F%BA%E6%9C%AC%E5%85%A8%E9%83%A8%E6%9B%B4%E6%96%B0%E5%AE%8C%E6%AF%95\"></a>更新进度(制作视频已基本全部更新完毕)</h2>\n<h3><a id=\"后端完成\" class=\"anchor\" href=\"https://gitee.com/wejectchan/ginblog#%E5%90%8E%E7%AB%AF%E5%AE%8C%E6%88%90\"></a>后端完成</h3>\n<p><a href=\"https://www.bilibili.com/video/BV1AA411v7e6\" rel=\"nofollow\">第一节 初始化项目+配置参数</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1A5411a7cf\" rel=\"nofollow\">第二节 配置数据库，数据模型</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1oA411e7kM\" rel=\"nofollow\">第三节 构架错误处理模块和路由接口</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1A5411a7qw\" rel=\"nofollow\">第四节 编写用户模块接口，实现初步验证+分页功能</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1AD4y1D7BX\" rel=\"nofollow\">第五节 用户密码加密存储策略介绍及选择</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV19f4y1R7RE\" rel=\"nofollow\">第六节 编写编辑用户信息+删除用户接口</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV16Z4y1T7Nc\" rel=\"nofollow\">第七节 完成博客分类接口编写</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1JD4y1U76f\" rel=\"nofollow\">第八节 编写博客文章接口（新增、编辑、删除）</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1YT4y1j7Co\" rel=\"nofollow\">第九节 完成博客文章接口（文章和分类的关联查询）</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1Mp4y1q76P\" rel=\"nofollow\">第十节 编写登录接口，完成 JWT 中间件</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1cZ4y1M79w\" rel=\"nofollow\">第十一节 完成登录接口</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV17V411z7cW\" rel=\"nofollow\">第十二节 完成上传接口（GIN+七牛对象储存）</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV16v411v7D7\" rel=\"nofollow\">第十三节 处理日志系统（自定义日志、按时间分割日志、软连接最新日志）</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1Hi4y1g7aj\" rel=\"nofollow\">第十四节 后端数据验证、跨域参数配置、增加列表查询的总数返回</a></p>\n<h3><a id=\"前端后台管理页面完成\" class=\"anchor\" href=\"https://gitee.com/wejectchan/ginblog#%E5%89%8D%E7%AB%AF%E5%90%8E%E5%8F%B0%E7%AE%A1%E7%90%86%E9%A1%B5%E9%9D%A2%E5%AE%8C%E6%88%90\"></a>前端后台管理页面完成</h3>\n<p><a href=\"https://www.bilibili.com/video/BV16T4y157JB\" rel=\"nofollow\">第一节 前端初始化，开发环境搭建及相关依赖安装</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1oi4y1u7ZJ\" rel=\"nofollow\">第二节 编写登录页面，实现数据双向绑定和数据验证</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1JK4y1Y7pd\" rel=\"nofollow\">第三节 完成登录页面</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1Ni4y1g7ju\" rel=\"nofollow\">第四节 配置路由导航守卫，搭建后台管理页面框架</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1sC4y187Pc\" rel=\"nofollow\">第五节 完成后台页面菜单栏和页面路由跳转</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV19D4y127U9\" rel=\"nofollow\">第六节 编写用户列表页面</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV19V411U7ud\" rel=\"nofollow\">第七节 用户列表搜索和删除功能</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV19D4y127kb\" rel=\"nofollow\">第八节 完成用户列表新增用户和编辑用户功能</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV19h411d7eF\" rel=\"nofollow\">第九节 修复部分 BUG</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1rv411y7Wm\" rel=\"nofollow\">第十节 编写分类列表和文章列表页面</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV19h41197BB\" rel=\"nofollow\">第十一节 完成新增文章和编辑文章页面</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1Uz4y1f76J\" rel=\"nofollow\">第十二节 自定义封装 tinymce 富文本编辑器，实现编辑器本地上传图片等功能</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV12i4y1M7eD\" rel=\"nofollow\">第十三节 后台页面完结，vue 打包部署</a></p>\n<h3><a id=\"前端展示页面正在更新中\" class=\"anchor\" href=\"https://gitee.com/wejectchan/ginblog#%E5%89%8D%E7%AB%AF%E5%B1%95%E7%A4%BA%E9%A1%B5%E9%9D%A2%E6%AD%A3%E5%9C%A8%E6%9B%B4%E6%96%B0%E4%B8%AD\"></a>前端展示页面（正在更新中）</h3>\n<p><a href=\"https://www.bilibili.com/video/BV1LX4y1u7py\" rel=\"nofollow\">第一节 搭建项目框架</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1EZ4y137qG\" rel=\"nofollow\">第二节 编写主内容区+个人介绍</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV17v411t7Gw\" rel=\"nofollow\">第三节 完成个人简介更新功能</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV17y4y1U7FB\" rel=\"nofollow\">第四节 完成文章列表页面</a></p>\n<p><a href=\"https://www.bilibili.com/video/BV1Eo4y1Z7c9\" rel=\"nofollow\">第五节 完成文章详情页面</a></p>\n<h2><a id=\"thanks-for-free-jetbrains-open-source-license\" class=\"anchor\" href=\"https://gitee.com/wejectchan/ginblog#thanks-for-free-jetbrains-open-source-license\"></a>Thanks for free JetBrains Open Source license</h2>\n<p>感谢JetBrains免费开源授权</p>\n<p><a href=\"https://www.jetbrains.com/\" target=\"_blank\" rel=\"nofollow noopener\"><img src=\"https://gitee.com/wejectchan/ginblog/raw/master/upload/jet.png\" height=\"200\" /></a></p>', 'http://test.scjglaw.cn/FhYPOILPGojxSkaJHcyXHnwd9QWA', 2, 9);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Ginblog');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `article_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) NULL DEFAULT 2,
  `article_title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `username` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_comment_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, '2021-01-04 22:47:58.055', '2021-01-04 22:48:24.617', NULL, 1, 1, '测试测试~~~', 1, NULL, 'admin', '');
INSERT INTO `comment` VALUES (2, '2021-01-04 22:49:04.785', '2021-01-04 22:49:12.046', NULL, 2, 1, '测试测试', 1, NULL, 'weject', '');

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qqchat` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wechat` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weibo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bili` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 574 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES (1, 'weject', '请输入个人介绍', 'QQ号码', '微信号码', '微博地址', 'B站地址', '电子邮箱', 'http://test.scjglaw.cn/FsdR3jZStpoxJ1652sFmNMtwqiFY', 'http://test.scjglaw.cn/Fm63wdxiVmW7xN3z2R-czYUdMmLY');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NULL DEFAULT NULL,
  `updated_at` datetime(3) NULL DEFAULT NULL,
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` bigint(20) NULL DEFAULT 2,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '2021-02-09 17:05:14.764', '2021-02-09 17:05:14.764', NULL, 'admin', '$2a$10$YGL5a9z7ykG6BWOo.XhJU.h8r98BD5IvAmLISBB9rFIefbDzrv58O', 1);

SET FOREIGN_KEY_CHECKS = 1;
