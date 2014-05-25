/*
Navicat MySQL Data Transfer

Source Server         : 38_stu
Source Server Version : 50504
Source Host           : 10.0.1.38:3306
Source Database       : stuinfo

Target Server Type    : MYSQL
Target Server Version : 50504
File Encoding         : 65001

Date: 2014-05-13 18:30:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sc_general_answerquestion`
-- ----------------------------
DROP TABLE IF EXISTS `sc_general_answerquestion`;
CREATE TABLE `sc_general_answerquestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stuid` bigint(20) NOT NULL COMMENT '学生id',
  `questionid` bigint(20) NOT NULL COMMENT '学校的问卷id',
  `answer` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '问卷的回答',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_general_answerquestion
-- ----------------------------
INSERT INTO `sc_general_answerquestion` VALUES ('77', '75', '1', '是');
INSERT INTO `sc_general_answerquestion` VALUES ('78', '76', '1', '是');

-- ----------------------------
-- Table structure for `sc_general_download`
-- ----------------------------
DROP TABLE IF EXISTS `sc_general_download`;
CREATE TABLE `sc_general_download` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stu_id` bigint(20) DEFAULT NULL,
  `stu_name` varchar(255) DEFAULT NULL,
  `stu_sex` varchar(255) DEFAULT NULL,
  `stu_birthday` date DEFAULT NULL,
  `stu_huji` varchar(255) DEFAULT NULL,
  `stu_addr` varchar(255) DEFAULT NULL,
  `stu_apply` int(255) DEFAULT NULL,
  `stu_ans_id` bigint(20) DEFAULT NULL,
  `stu_scq_id` bigint(20) DEFAULT NULL,
  `stu_question` varchar(255) DEFAULT NULL,
  `stu_answer` varchar(255) DEFAULT NULL,
  `stu_mather` varchar(255) DEFAULT NULL,
  `stu_mcompany` varchar(255) DEFAULT NULL,
  `stu_mjobtitle` varchar(255) DEFAULT NULL,
  `stu_mtel` varchar(255) DEFAULT NULL,
  `stu_father` varchar(255) DEFAULT NULL,
  `stu_fcompany` varchar(255) DEFAULT NULL,
  `stu_fjobtitle` varchar(255) DEFAULT NULL,
  `stu_ftel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_general_download
-- ----------------------------
INSERT INTO `sc_general_download` VALUES ('109', '75', '恰恰', '男', '1999-05-21', '北京', '北京', '1', '77', '1', '是否为阳光新苑校区住户?', '是', '妈妈', '北京', '北京', '13333333333', '爸爸', '北京', '北京', '13333333333');
INSERT INTO `sc_general_download` VALUES ('110', '76', '问问', '女', '2014-05-02', '丰富', '丰富', '1', '78', '1', '是否为阳光新苑校区住户?', '是', 'mama', '上海', '上海', '13555555555', 'baba', 'BJ ', 'BJ', '18666666666');

-- ----------------------------
-- Table structure for `sc_general_parent`
-- ----------------------------
DROP TABLE IF EXISTS `sc_general_parent`;
CREATE TABLE `sc_general_parent` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `relation` int(1) unsigned zerofill NOT NULL DEFAULT '1' COMMENT '关系 1爸爸 2妈妈',
  `stuid` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `company` varchar(50) DEFAULT NULL COMMENT '公司',
  `job_title` varchar(50) DEFAULT NULL COMMENT '职务',
  `telphone` bigint(11) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_general_parent
-- ----------------------------
INSERT INTO `sc_general_parent` VALUES ('149', '3', '75', '爸爸', '北京', '北京', '13333333333');
INSERT INTO `sc_general_parent` VALUES ('150', '3', '75', '妈妈', '北京', '北京', '13333333333');
INSERT INTO `sc_general_parent` VALUES ('151', '3', '76', 'baba', 'BJ ', 'BJ', '18666666666');
INSERT INTO `sc_general_parent` VALUES ('152', '3', '76', 'mama', '上海', '上海', '13555555555');

-- ----------------------------
-- Table structure for `sc_general_schoolquestion`
-- ----------------------------
DROP TABLE IF EXISTS `sc_general_schoolquestion`;
CREATE TABLE `sc_general_schoolquestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` int(1) DEFAULT NULL COMMENT '//状态 0有效 1 无效',
  `dept` int(1) DEFAULT NULL COMMENT '学部 1 小学 2初中 3 高中 4 大学 5幼儿园',
  `quest_type` int(1) DEFAULT NULL COMMENT '问题类型',
  `question` varchar(200) DEFAULT NULL COMMENT '问题',
  `answer` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_general_schoolquestion
-- ----------------------------
INSERT INTO `sc_general_schoolquestion` VALUES ('1', '0', '1', '1', '是否为阳光新苑校区住户?', '1 是;2不是');

-- ----------------------------
-- Table structure for `sc_general_student`
-- ----------------------------
DROP TABLE IF EXISTS `sc_general_student`;
CREATE TABLE `sc_general_student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `sex` int(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `huji_address` varchar(200) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `apply_dept` int(1) DEFAULT NULL COMMENT '和学部对应',
  `stuanswer` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_general_student
-- ----------------------------
INSERT INTO `sc_general_student` VALUES ('75', '恰恰', '1', '1999-05-21', '北京', '北京', '1', '是');
INSERT INTO `sc_general_student` VALUES ('76', '问问', '2', '2014-05-02', '丰富', '丰富', '1', '是');

-- ----------------------------
-- Table structure for `sc_sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sc_sys_user`;
CREATE TABLE `sc_sys_user` (
  `login_name` varchar(200) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_sys_user
-- ----------------------------
INSERT INTO `sc_sys_user` VALUES ('admin', '8c68b82fc9b15410be1f56a700608537', '1', '1');

-- ----------------------------
-- View structure for `stu_list`
-- ----------------------------
DROP VIEW IF EXISTS `stu_list`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stu_list` AS select `sc_general_student`.`name` AS `孩子姓名`,`sc_general_student`.`sex` AS `性别`,`sc_general_student`.`birthday` AS `生日`,`sc_general_student`.`huji_address` AS `户口所在地`,`sc_general_student`.`address` AS `家庭住址`,`sc_general_student`.`stuanswer` AS `是否租住` from `sc_general_student` ;
