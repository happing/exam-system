/*
Navicat MySQL Data Transfer

Source Server         : briup
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : exam

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-01-13 09:38:22
*/

use exam;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_exam_choice
-- ----------------------------
DROP TABLE IF EXISTS `tbl_exam_choice`;
CREATE TABLE `tbl_exam_choice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `correct` bit(1) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKA24982C03F8D0CE4` (`subject_id`),
  CONSTRAINT `FKA24982C03F8D0CE4` FOREIGN KEY (`subject_id`) REFERENCES `tbl_exam_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_exam_choice
-- ----------------------------
INSERT INTO `tbl_exam_choice` VALUES ('1', 'byte', '\0', '2');
INSERT INTO `tbl_exam_choice` VALUES ('2', 'short', '\0', '2');
INSERT INTO `tbl_exam_choice` VALUES ('3', 'int', '\0', '2');
INSERT INTO `tbl_exam_choice` VALUES ('4', 'long', '', '2');

-- ----------------------------
-- Table structure for tbl_exam_epartment
-- ----------------------------
DROP TABLE IF EXISTS `tbl_exam_epartment`;
CREATE TABLE `tbl_exam_epartment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_exam_epartment
-- ----------------------------
INSERT INTO `tbl_exam_epartment` VALUES ('1', 'WebUI');
INSERT INTO `tbl_exam_epartment` VALUES ('2', 'JavaEE');
INSERT INTO `tbl_exam_epartment` VALUES ('3', '大数据');
INSERT INTO `tbl_exam_epartment` VALUES ('4', 'Android');
INSERT INTO `tbl_exam_epartment` VALUES ('5', 'PHP');
INSERT INTO `tbl_exam_epartment` VALUES ('6', 'IOS');

-- ----------------------------
-- Table structure for tbl_exam_paper
-- ----------------------------
DROP TABLE IF EXISTS `tbl_exam_paper`;
CREATE TABLE `tbl_exam_paper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `answerQuestionTime` double DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `totalPoints` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK92534C8DF2C32590` (`department_id`),
  KEY `FK92534C8D5CC62F70` (`user_id`),
  CONSTRAINT `FK92534C8D5CC62F70` FOREIGN KEY (`user_id`) REFERENCES `tbl_exam_user` (`id`),
  CONSTRAINT `FK92534C8DF2C32590` FOREIGN KEY (`department_id`) REFERENCES `tbl_exam_epartment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_exam_paper
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_exam_papersubject
-- ----------------------------
DROP TABLE IF EXISTS `tbl_exam_papersubject`;
CREATE TABLE `tbl_exam_papersubject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `score` int(11) DEFAULT NULL,
  `examPaper_id` bigint(20) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK5B4F3FFF3F8D0CE4` (`subject_id`),
  KEY `FK5B4F3FFF9D52EAA4` (`examPaper_id`),
  CONSTRAINT `FK5B4F3FFF9D52EAA4` FOREIGN KEY (`examPaper_id`) REFERENCES `tbl_exam_paper` (`id`),
  CONSTRAINT `FK5B4F3FFF3F8D0CE4` FOREIGN KEY (`subject_id`) REFERENCES `tbl_exam_subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_exam_papersubject
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_exam_subject
-- ----------------------------
DROP TABLE IF EXISTS `tbl_exam_subject`;
CREATE TABLE `tbl_exam_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `analysis` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `checkState` varchar(255) DEFAULT NULL,
  `stem` varchar(255) DEFAULT NULL,
  `uploadTime` datetime DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `subjectLevel_id` bigint(20) DEFAULT NULL,
  `subjectType_id` bigint(20) DEFAULT NULL,
  `topic_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKAC2D3EDD9E4D9C4` (`subjectType_id`),
  KEY `FKAC2D3EDF2C32590` (`department_id`),
  KEY `FKAC2D3ED5CC62F70` (`user_id`),
  KEY `FKAC2D3EDB797230` (`subjectLevel_id`),
  KEY `FKAC2D3ED12BE0C84` (`topic_id`),
  CONSTRAINT `FKAC2D3ED12BE0C84` FOREIGN KEY (`topic_id`) REFERENCES `tbl_exam_topic` (`id`),
  CONSTRAINT `FKAC2D3ED5CC62F70` FOREIGN KEY (`user_id`) REFERENCES `tbl_exam_user` (`id`),
  CONSTRAINT `FKAC2D3EDB797230` FOREIGN KEY (`subjectLevel_id`) REFERENCES `tbl_exam_subjectlevel` (`id`),
  CONSTRAINT `FKAC2D3EDD9E4D9C4` FOREIGN KEY (`subjectType_id`) REFERENCES `tbl_exam_subjecttype` (`id`),
  CONSTRAINT `FKAC2D3EDF2C32590` FOREIGN KEY (`department_id`) REFERENCES `tbl_exam_epartment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_exam_subject
-- ----------------------------
INSERT INTO `tbl_exam_subject` VALUES ('1', '8种基本数据类型', 'byte,short,int,long,float,double,char,boolean', '未审核', 'Java中的基本数据类型有哪些', '2017-01-13 09:24:52', '1', '1', '3', '1', null);
INSERT INTO `tbl_exam_subject` VALUES ('2', '长整型占8个字节', '', '未审核', '下面哪种数据类型占8个字节', '2017-01-13 09:31:51', '2', '1', '1', '6', null);

-- ----------------------------
-- Table structure for tbl_exam_subjectlevel
-- ----------------------------
DROP TABLE IF EXISTS `tbl_exam_subjectlevel`;
CREATE TABLE `tbl_exam_subjectlevel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_exam_subjectlevel
-- ----------------------------
INSERT INTO `tbl_exam_subjectlevel` VALUES ('1', 'easy', '简单');
INSERT INTO `tbl_exam_subjectlevel` VALUES ('2', 'medium', '中等');
INSERT INTO `tbl_exam_subjectlevel` VALUES ('3', 'difficult', '难');

-- ----------------------------
-- Table structure for tbl_exam_subjecttype
-- ----------------------------
DROP TABLE IF EXISTS `tbl_exam_subjecttype`;
CREATE TABLE `tbl_exam_subjecttype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_exam_subjecttype
-- ----------------------------
INSERT INTO `tbl_exam_subjecttype` VALUES ('1', 'radio', '单选题');
INSERT INTO `tbl_exam_subjecttype` VALUES ('2', 'check', '复选题');
INSERT INTO `tbl_exam_subjecttype` VALUES ('3', 'question', '简答题');

-- ----------------------------
-- Table structure for tbl_exam_topic
-- ----------------------------
DROP TABLE IF EXISTS `tbl_exam_topic`;
CREATE TABLE `tbl_exam_topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK92920830F2C32590` (`department_id`),
  CONSTRAINT `FK92920830F2C32590` FOREIGN KEY (`department_id`) REFERENCES `tbl_exam_epartment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_exam_topic
-- ----------------------------
INSERT INTO `tbl_exam_topic` VALUES ('1', 'HTML', '1');
INSERT INTO `tbl_exam_topic` VALUES ('2', 'JavaScript', '1');
INSERT INTO `tbl_exam_topic` VALUES ('3', 'CSS', '1');
INSERT INTO `tbl_exam_topic` VALUES ('4', 'jQuery', '1');
INSERT INTO `tbl_exam_topic` VALUES ('5', 'Bootstrap', '1');
INSERT INTO `tbl_exam_topic` VALUES ('6', 'CoreJava', '2');
INSERT INTO `tbl_exam_topic` VALUES ('7', 'XML', '2');
INSERT INTO `tbl_exam_topic` VALUES ('8', 'Servlet/JSP', '2');

-- ----------------------------
-- Table structure for tbl_exam_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_exam_user`;
CREATE TABLE `tbl_exam_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK7857CCAAF2C32590` (`department_id`),
  CONSTRAINT `FK7857CCAAF2C32590` FOREIGN KEY (`department_id`) REFERENCES `tbl_exam_epartment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_exam_user
-- ----------------------------
