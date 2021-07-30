/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : dc_zulin

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-06-03 08:49:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dc_car
-- ----------------------------
DROP TABLE IF EXISTS `dc_car`;
CREATE TABLE `dc_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `classify` varchar(128) DEFAULT NULL,
  `chepai` varchar(128) DEFAULT NULL,
  `money` double(16,0) DEFAULT NULL,
  `paytime` datetime DEFAULT NULL,
  `zhuangkuang` text,
  `biaozhun` double(16,0) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_car
-- ----------------------------
INSERT INTO `dc_car` VALUES ('5', '王总的车', '奔驰', '鲁VG8568', '1000000', '2020-05-27 00:00:00', '良好', '5000', '1590895606', '1590895732');
INSERT INTO `dc_car` VALUES ('7', '小轿车1', '宝马', '粤WE957', 700000, '2020-06-04 00:00:00', '良好', 2000, 1591191488, NULL);
INSERT INTO `dc_car` VALUES ('8', '小轿车2', '大众', '鲁VB7723', 300000, '2005-03-03 00:00:00', '良好', 500, 1591191748, NULL);
INSERT INTO `dc_car` VALUES ('9', '小轿车3', '北京现代', '京ND3245', 400000, '2008-07-10 00:00:00', '良好', 1500, 1591191997, NULL);
-- ----------------------------
-- Table structure for dc_kehu
-- ----------------------------
DROP TABLE IF EXISTS `dc_kehu`;
CREATE TABLE `dc_kehu` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `sfz` varchar(218) DEFAULT NULL,
  `kname` varchar(218) DEFAULT NULL,
  `sex` varchar(128) DEFAULT NULL,
  `date` varchar(128) DEFAULT NULL,
  `address` varchar(218) DEFAULT NULL,
  `phone` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_kehu
-- ----------------------------
INSERT INTO `dc_kehu` VALUES ('3', '111333', '客户1', '男', '1998-05-08', '潍坊', '13746565576');
INSERT INTO `dc_kehu` VALUES ('4', '222444', '客户2', '女', '1997-07-04', '深圳', '13723454467');
-- ----------------------------
-- Table structure for dc_menu
-- ----------------------------
DROP TABLE IF EXISTS `dc_menu`;
CREATE TABLE `dc_menu` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `href` varchar(80) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `pid` smallint(5) DEFAULT '0' COMMENT '父ID',
  `icon` varchar(50) DEFAULT NULL,
  `sort` tinyint(4) DEFAULT '0' COMMENT '排序',
  `spread` tinyint(2) DEFAULT '0' COMMENT '默认展开 0:false   1:true',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_menu
-- ----------------------------
INSERT INTO `dc_menu` VALUES ('1', '', '后台首页', '0', '&#xe68e;', '0', '1');
INSERT INTO `dc_menu` VALUES ('2', '', '系统维护', '0', '&#xe716;', '5', '1');
INSERT INTO `dc_menu` VALUES ('3', '/admin.php/Menu/index', '界面管理', '2', '&#xe653;', '2', '0');
INSERT INTO `dc_menu` VALUES ('4', '/admin.php/Index/main', '后台首页', '1', '&#xe68e;', '0', '1');
INSERT INTO `dc_menu` VALUES ('5', '/admin.php/Index/pwd', '修改密码', '1', '&#xe716;', '1', '0');
INSERT INTO `dc_menu` VALUES ('7', '/admin.php/User/index', '用户管理', '26', '&#xe612;', '0', '0');
INSERT INTO `dc_menu` VALUES ('8', '/admin.php/Role/index', '权限管理', '2', '&#xe716;', '1', '0');
INSERT INTO `dc_menu` VALUES ('30', '/admin.php/Tongji/index', '统计汇总', '27', '&#xe653;', '0', '0');
INSERT INTO `dc_menu` VALUES ('29', '/admin.php/Zulin/index', '车辆租赁', '28', '&#xe653;', '0', '0');
INSERT INTO `dc_menu` VALUES ('26', '', '用户管理', '0', '&#xe612;', '3', '1');
INSERT INTO `dc_menu` VALUES ('27', '', '报表信息', '0', '&#xe653;', '4', '1');
INSERT INTO `dc_menu` VALUES ('28', '', '车辆租赁', '0', '&#xe653;', '2', '1');
INSERT INTO `dc_menu` VALUES ('16', '', '车辆管理', '0', '&#xe653;', '1', '1');
INSERT INTO `dc_menu` VALUES ('25', '/admin.php/Car/index', '车辆管理', '16', '&#xe653;', '2', '0');

-- ----------------------------
-- Table structure for dc_role
-- ----------------------------
DROP TABLE IF EXISTS `dc_role`;
CREATE TABLE `dc_role` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(36) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_role
-- ----------------------------
INSERT INTO `dc_role` VALUES ('3', '司机', '1579252636', '1590890712');
INSERT INTO `dc_role` VALUES ('1', '系统管理员', '1579253528', '1591075553');
INSERT INTO `dc_role` VALUES ('2', '管理员', '1579402607', '1591075591');
INSERT INTO `dc_role` VALUES ('4', '客户', '1590890727', '1590890727');

-- ----------------------------
-- Table structure for dc_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `dc_role_menu`;
CREATE TABLE `dc_role_menu` (
  `rid` int(3) NOT NULL,
  `mid` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_role_menu
-- ----------------------------
INSERT INTO `dc_role_menu` VALUES ('1', '3');
INSERT INTO `dc_role_menu` VALUES ('1', '8');
INSERT INTO `dc_role_menu` VALUES ('1', '2');
INSERT INTO `dc_role_menu` VALUES ('1', '30');
INSERT INTO `dc_role_menu` VALUES ('1', '27');
INSERT INTO `dc_role_menu` VALUES ('1', '7');
INSERT INTO `dc_role_menu` VALUES ('1', '26');
INSERT INTO `dc_role_menu` VALUES ('1', '29');
INSERT INTO `dc_role_menu` VALUES ('2', '1');
INSERT INTO `dc_role_menu` VALUES ('2', '4');
INSERT INTO `dc_role_menu` VALUES ('2', '5');
INSERT INTO `dc_role_menu` VALUES ('2', '16');
INSERT INTO `dc_role_menu` VALUES ('2', '25');
INSERT INTO `dc_role_menu` VALUES ('2', '28');
INSERT INTO `dc_role_menu` VALUES ('2', '29');
INSERT INTO `dc_role_menu` VALUES ('2', '26');
INSERT INTO `dc_role_menu` VALUES ('2', '7');
INSERT INTO `dc_role_menu` VALUES ('2', '27');
INSERT INTO `dc_role_menu` VALUES ('2', '30');
INSERT INTO `dc_role_menu` VALUES ('1', '28');
INSERT INTO `dc_role_menu` VALUES ('1', '25');
INSERT INTO `dc_role_menu` VALUES ('1', '16');
INSERT INTO `dc_role_menu` VALUES ('1', '5');
INSERT INTO `dc_role_menu` VALUES ('1', '4');
INSERT INTO `dc_role_menu` VALUES ('1', '1');
INSERT INTO `dc_role_menu` VALUES ('3', '1');
INSERT INTO `dc_role_menu` VALUES ('3', '4');
INSERT INTO `dc_role_menu` VALUES ('3', '5');
INSERT INTO `dc_role_menu` VALUES ('3', '16');
INSERT INTO `dc_role_menu` VALUES ('3', '25');
INSERT INTO `dc_role_menu` VALUES ('3', '27');
INSERT INTO `dc_role_menu` VALUES ('3', '30');
INSERT INTO `dc_role_menu` VALUES ('4', '1');
INSERT INTO `dc_role_menu` VALUES ('4', '4');
INSERT INTO `dc_role_menu` VALUES ('4', '5');
INSERT INTO `dc_role_menu` VALUES ('4', '28');
INSERT INTO `dc_role_menu` VALUES ('4', '29');

-- ----------------------------
-- Table structure for dc_siji
-- ----------------------------
DROP TABLE IF EXISTS `dc_siji`;
CREATE TABLE `dc_siji` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `sfz` varchar(218) DEFAULT NULL,
  `kname` varchar(218) DEFAULT NULL,
  `sex` varchar(128) DEFAULT NULL,
  `date` varchar(128) DEFAULT NULL,
  `address` varchar(218) DEFAULT NULL,
  `phone` varchar(36) DEFAULT NULL,
  `jiashizheng` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_siji
-- ----------------------------
INSERT INTO `dc_siji` VALUES ('6', '111111', '司机1', '男', '1985-06-05', '北京', '15284756876', '1113733445');
INSERT INTO `dc_siji` VALUES ('7', '222222', '司机2', '男', '1983-09-07', '上海', '13717912567', '2223733886');

-- ----------------------------
-- Table structure for dc_system
-- ----------------------------
DROP TABLE IF EXISTS `dc_system`;
CREATE TABLE `dc_system` (
  `id` varchar(36) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `jane_name` varchar(36) DEFAULT NULL,
  `footer` varchar(128) DEFAULT NULL,
  `footer_url` varchar(218) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_system
-- ----------------------------
INSERT INTO `dc_system` VALUES ('system', '汽车租赁', '汽车租赁', 'Copyright&nbsp;&nbsp;2020&nbsp;&nbsp;某某学校&nbsp;&nbsp;版权所有', 'www.zulin.com:81/admin.php');

-- ----------------------------
-- Table structure for dc_user
-- ----------------------------
DROP TABLE IF EXISTS `dc_user`;
CREATE TABLE `dc_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '名字',
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of dc_user
-- ----------------------------
INSERT INTO `dc_user` VALUES ('1', 'admin', 'z9S3MtbnsMuG5vDb7cmGhEf38_q', '超管', null, '1587814256', '1', null);
INSERT INTO `dc_user` VALUES ('13', 'gl1', 'PYvAeoKLP8pDUPMVJnm3eIooqbF', '管理员1', '1587804929', '1591192413', '2', NULL);
INSERT INTO `dc_user` VALUES ('14', 'kh1', 'vJ5oCiznwBIrqDJzSEYYEUBL7F2', '客户1', '1591073863', '1591192251', '4', '3');
INSERT INTO `dc_user` VALUES ('16', 'kh2', 'NRjLhjYFJkWELRkJOGqa2N2gfZ-', '客户2', '1591192528', NULL,'4', '4');
INSERT INTO `dc_user` VALUES ('15', 'sj1', 'VrxDv5HlaBSnr86ZaQP6Tuo-z3e', '司机1', '1591074596', '1591192188', '3', '6');
INSERT INTO `dc_user` VALUES ('17', 'sj2', '4uuUH5CeonC6h6zmc4uTpEP4-Eb', '司机2', '1591192751', NULL, '3', '7');

-- ----------------------------
-- Table structure for dc_zulin
-- ----------------------------
DROP TABLE IF EXISTS `dc_zulin`;
CREATE TABLE `dc_zulin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT NULL,
  `kid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `kaishi` datetime DEFAULT NULL,
  `jieshu` datetime DEFAULT NULL,
  `money` double(16,0) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '0' COMMENT '退租1  结算2  还车3',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_zulin
-- ----------------------------
INSERT INTO `dc_zulin` VALUES ('3', '15', '14', '5', '2020-06-02 00:00:00', '2020-06-19 00:00:00', '10000', '3');
INSERT INTO `dc_zulin` VALUES ('4', '15', '14', '5', '2020-06-02 00:00:00', '2020-06-26 00:00:00', '2', '1');
INSERT INTO `dc_zulin` VALUES ('7', '17', '16', '9', '2020-04-03 00:00:00', '2020-08-03 00:00:00', '8000', '0');
