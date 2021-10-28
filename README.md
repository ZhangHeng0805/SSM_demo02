# SSM_demo02
基于SSM框架的博客系统
> 核心功能

* 用户登录
* 用户注册
* 查看所有人公开类型的文章
* 查看我的(自己)文章
* 阅读文章
* 添加(编写)文章
* 修改自己的文章
* 删除自己的文章


> 系统做了登录拦截功能，其中阅读文章的页面没有拦截，可以不用登录直接阅读文章。

## 界面展示
### 1.用户登录界面
![image](https://user-images.githubusercontent.com/74289276/139247122-3c1883d8-e96b-42b3-950b-5d8209ffaec9.png)
### 2.用户注册界面
![image](https://user-images.githubusercontent.com/74289276/139247841-ed2f812f-6030-4d4c-9eb4-8bc7f619fc7a.png)
### 3.个人主页界面
![image](https://user-images.githubusercontent.com/74289276/139248062-d88bcb57-1896-4b02-b28b-1f85663dc3db.png)
### 4.阅读文章界面
![image](https://user-images.githubusercontent.com/74289276/139248245-3c5cd93d-f799-4030-8941-030d5c4236ce.png)
### 5.我的文章界面
![image](https://user-images.githubusercontent.com/74289276/139248370-f85b2c1c-c225-410e-92af-5afb54c5fd80.png)
### 6.添加文章界面
![image](https://user-images.githubusercontent.com/74289276/139248602-7e559dfe-5f89-4a24-a508-996cb1ea92d2.png)
### 7.修改文章界面
![image](https://user-images.githubusercontent.com/74289276/139248739-5d6dba5a-7ca8-4cd7-8298-e79986dd29a3.png)

## 数据库
```
/*
Navicat MySQL Data Transfer

Source Server         : 张恒
Source Server Version : 50535
Source Host           : localhost:3306
Source Database       : mybatis

Target Server Type    : MYSQL
Target Server Version : 50535
File Encoding         : 65001

Date: 2021-10-28 19:44:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `author` varchar(15) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `introduce` varchar(100) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `author` (`author`),
  KEY `authorId` (`authorId`),
  CONSTRAINT `t_article_ibfk_1` FOREIGN KEY (`author`) REFERENCES `t_user` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `t_article_ibfk_2` FOREIGN KEY (`authorId`) REFERENCES `t_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `phonenum` varchar(11) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `registrationTime` varchar(20) DEFAULT NULL,
  `modifyTime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`username`,`phonenum`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

```sql
