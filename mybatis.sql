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
