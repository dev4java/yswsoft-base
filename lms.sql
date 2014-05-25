/*
Navicat MySQL Data Transfer

Source Server         : local_root_1234QWERasdf
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : lms

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-05-25 12:59:34
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `lms_sys_books`
-- ----------------------------
DROP TABLE IF EXISTS `lms_sys_books`;
CREATE TABLE `lms_sys_books` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `type_no` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `press` varchar(255) DEFAULT NULL,
  `duplicate` bigint(20) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  `surplus` bigint(20) DEFAULT NULL,
  `editor` varchar(255) DEFAULT NULL,
  `tota_price` double DEFAULT NULL,
  `pricing` double DEFAULT NULL,
  `exist` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lms_sys_books
-- ----------------------------
INSERT INTO lms_sys_books VALUES ('1', '1', '图书名称', '100.1', '', null, '作者', '出版社', '10', '0', '10', null, '1001', '0', '0');
INSERT INTO lms_sys_books VALUES ('2', '1', '图书2', '1000', '', null, '作者2', '出版社2', '10', '0', '10', null, '10000', '0', '0');
INSERT INTO lms_sys_books VALUES ('3', '1', '图书名称2', '200', '', null, '作者2', '出版社2', '200', '0', '200', null, '40000', '0', '0');
INSERT INTO lms_sys_books VALUES ('4', '1', '图书3', '300', '    备注：', null, '作者3', '出版社3', '300', '0', '300', null, '90000', '0', '0');
INSERT INTO lms_sys_books VALUES ('5', '1', 'fsdf', '11', '', null, 'fsdf', 'fsf', '2', '0', '2', null, '22', '0', '0');
INSERT INTO lms_sys_books VALUES ('6', '1', 'fsdf', '221', 'beizhu', null, 'fef', 'ewr', '1', '0', '1', null, '221', '0', '0');
INSERT INTO lms_sys_books VALUES ('7', '1', 'fdsf', '32', null, null, 'fsdf', 'ds', '1', '0', '1', null, '221', '0', '0');
INSERT INTO lms_sys_books VALUES ('8', '1', 'fdsf', '32', null, null, 'fsdf', 'de', '1', '0', '2', null, '221', '0', '0');
INSERT INTO lms_sys_books VALUES ('9', '1', 'sdfsd', '32', null, null, 'fsd', 'fsd', '1', '0', '3', null, '221', '1', '0');
INSERT INTO lms_sys_books VALUES ('10', '1', 'sfwe', '32', null, null, 'fsd', 'fsd', '1', '0', '3', null, '423', '1', '0');
INSERT INTO lms_sys_books VALUES ('11', '1', 'fsdf', '33', null, null, 'fsd', 'fsd', '1', '0', '2', null, '3423', '1', '0');
INSERT INTO lms_sys_books VALUES ('12', '1', 'fsfsd', '32', null, null, 'fs', 'fsd', '1', '0', '4', null, '342', '1', '0');
INSERT INTO lms_sys_books VALUES ('13', '1', 'fsdf', '32', null, null, 'f', 'fsd', '1', '0', '2', null, '1', '1', '0');
INSERT INTO lms_sys_books VALUES ('14', '1', '21', '32', null, null, 'fs', 'fsd', '1', '0', '2', null, '423', '1', '0');
INSERT INTO lms_sys_books VALUES ('15', '1', 'fsdf', '32', null, null, 'fs', 'fsd', '1', '0', '2', null, '323', '1', '0');
INSERT INTO lms_sys_books VALUES ('16', '1', 'qweq', '32', null, null, 'fs', 'fsd', '1', '0', '2', null, '2', '1', '0');
INSERT INTO lms_sys_books VALUES ('17', '1', 'fsdfsdf', '32', null, null, 'fs', 'fsd', '1', '0', '2', null, '32', '1', '0');
INSERT INTO lms_sys_books VALUES ('18', '1', 'sdf', '32', null, null, 'fs', 'fsd', '1', '0', '3', null, '32', '1', '0');
INSERT INTO lms_sys_books VALUES ('19', '1', 'fsdfsd', '23', null, null, 'fs', 'fsdfsd', '1', '0', '3', null, '32', '1', '0');
INSERT INTO lms_sys_books VALUES ('20', '1', 'fsd', '32', null, null, 'fs', 'fds', '1', '0', '3', null, '32', '1', '0');
INSERT INTO lms_sys_books VALUES ('21', '1', 'fsdf', '32', null, null, 'fsd', 'fds', '1', '0', '3', null, '32', '1', '0');
INSERT INTO lms_sys_books VALUES ('22', '1', 'fsd', '32', null, null, 'fs', 'we', '1', '0', '3', null, '32', '1', '0');
INSERT INTO lms_sys_books VALUES ('23', '1', 'dfs', '23', null, null, 'fss', 'fs', '1', '0', '3', null, '32', '1', '0');
INSERT INTO lms_sys_books VALUES ('24', '1', 'fsdf', '43', null, null, 'ff', 'fsd', '1', '0', '3', null, '32', '1', '0');

-- ----------------------------
-- Table structure for `lms_sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `lms_sys_user`;
CREATE TABLE `lms_sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_number` bigint(20) DEFAULT NULL,
  `login_email` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `level` int(1) DEFAULT NULL COMMENT '借阅级别',
  `status` int(1) DEFAULT '0' COMMENT '用户状态 0有效 1失效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lms_sys_user
-- ----------------------------
INSERT INTO lms_sys_user VALUES ('1', '10010', 'admin', 'yusw', '21232f297a57a5a743894a0e4a801fc3', null, '1', '0');
