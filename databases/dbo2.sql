/*
Navicat MySQL Data Transfer

Source Server         : demo
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : mem

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-03-26 22:29:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sysdiagrams
-- ----------------------------
DROP TABLE IF EXISTS `sysdiagrams`;
CREATE TABLE `sysdiagrams` (
  `name` varchar(128) DEFAULT NULL,
  `principal_id` int(11) DEFAULT NULL,
  `diagram_id` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `definition` longblob
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysdiagrams
-- ----------------------------

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AdminCode` varchar(50) DEFAULT NULL,
  `NickName` varchar(50) DEFAULT NULL,
  `L1Pwd` varchar(32) DEFAULT NULL,
  `L2Pwd` varchar(255) DEFAULT NULL,
  `L3Pwd` varchar(255) DEFAULT NULL,
  `IsLock` tinyint(4) DEFAULT NULL,
  `LastLoginIp` int(10) DEFAULT NULL,
  `LastLoginTime` int(10) DEFAULT NULL,
  `Mobile` varchar(11) DEFAULT NULL,
  `UpdateTime` int(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(2:无效,1:有效)',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', null, 'admin', '21232f297a57a5a743894a0e4a801fc3', null, '', null, '2130706433', '1522040291', '', '1521899271', '1');
INSERT INTO `t_admin` VALUES ('2', null, 'test', '202cb962ac59075b964b07152d234b70', null, null, null, null, null, '', '1521897319', '1');

-- ----------------------------
-- Table structure for t_adminrolelink
-- ----------------------------
DROP TABLE IF EXISTS `t_adminrolelink`;
CREATE TABLE `t_adminrolelink` (
  `Id` longtext,
  `AdminId` longtext,
  `RoleId` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_adminrolelink
-- ----------------------------

-- ----------------------------
-- Table structure for t_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_group`;
CREATE TABLE `t_admin_group` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `Rules` varchar(500) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  `ListOrder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `UpdateTime` int(10) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_admin_group
-- ----------------------------
INSERT INTO `t_admin_group` VALUES ('1', '工作', '测试', '3,4,9', '1', '1521900254');

-- ----------------------------
-- Table structure for t_admin_group_access
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_group_access`;
CREATE TABLE `t_admin_group_access` (
  `UId` int(11) NOT NULL,
  `GroupId` mediumint(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_admin_group_access
-- ----------------------------

-- ----------------------------
-- Table structure for t_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_log`;
CREATE TABLE `t_admin_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `M` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `C` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `A` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `QueryString` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `UserId` mediumint(8) NOT NULL,
  `NickName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Ip` int(10) NOT NULL,
  `Time` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=622 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_admin_log
-- ----------------------------
INSERT INTO `t_admin_log` VALUES ('1', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1521884271');
INSERT INTO `t_admin_log` VALUES ('2', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1521884496');
INSERT INTO `t_admin_log` VALUES ('3', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1521884590');
INSERT INTO `t_admin_log` VALUES ('4', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1521884719');
INSERT INTO `t_admin_log` VALUES ('5', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1521884729');
INSERT INTO `t_admin_log` VALUES ('6', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1521884816');
INSERT INTO `t_admin_log` VALUES ('7', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1521884832');
INSERT INTO `t_admin_log` VALUES ('8', 'admin', 'Admin', 'favicon.ico', '?/admin/Admin/favicon.ico', '1', 'admin', '2130706433', '1521884834');
INSERT INTO `t_admin_log` VALUES ('9', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1521884873');
INSERT INTO `t_admin_log` VALUES ('10', 'admin', 'Index', 'favicon.ico', '?/admin/index/favicon.ico', '1', 'admin', '2130706433', '1521884909');
INSERT INTO `t_admin_log` VALUES ('11', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1521884910');
INSERT INTO `t_admin_log` VALUES ('12', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1521884926');
INSERT INTO `t_admin_log` VALUES ('13', 'admin', 'Group', 'favicon.ico', '?/admin/Group/favicon.ico', '1', 'admin', '2130706433', '1521884928');
INSERT INTO `t_admin_log` VALUES ('14', 'admin', 'Group', 'info', '?/admin/Group/info', '1', 'admin', '2130706433', '1521884930');
INSERT INTO `t_admin_log` VALUES ('15', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1521884933');
INSERT INTO `t_admin_log` VALUES ('16', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1521884934');
INSERT INTO `t_admin_log` VALUES ('17', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1521884937');
INSERT INTO `t_admin_log` VALUES ('18', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1521885149');
INSERT INTO `t_admin_log` VALUES ('19', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1521885271');
INSERT INTO `t_admin_log` VALUES ('20', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1521885281');
INSERT INTO `t_admin_log` VALUES ('21', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1521885290');
INSERT INTO `t_admin_log` VALUES ('22', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1521885300');
INSERT INTO `t_admin_log` VALUES ('23', 'admin', 'Admin', 'index', '?/admin/Admin', '1', 'admin', '2130706433', '1521885328');
INSERT INTO `t_admin_log` VALUES ('24', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1521885487');
INSERT INTO `t_admin_log` VALUES ('25', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1521885489');
INSERT INTO `t_admin_log` VALUES ('26', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1521885554');
INSERT INTO `t_admin_log` VALUES ('27', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1521885563');
INSERT INTO `t_admin_log` VALUES ('28', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1521885628');
INSERT INTO `t_admin_log` VALUES ('29', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1521885669');
INSERT INTO `t_admin_log` VALUES ('30', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1521885681');
INSERT INTO `t_admin_log` VALUES ('31', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1521885746');
INSERT INTO `t_admin_log` VALUES ('32', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1521885783');
INSERT INTO `t_admin_log` VALUES ('33', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1521885791');
INSERT INTO `t_admin_log` VALUES ('34', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1521885806');
INSERT INTO `t_admin_log` VALUES ('35', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1521885815');
INSERT INTO `t_admin_log` VALUES ('36', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1521885855');
INSERT INTO `t_admin_log` VALUES ('37', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1521885998');
INSERT INTO `t_admin_log` VALUES ('38', 'admin', 'Admin', 'add', '?/admin/Admin/add', '1', 'admin', '2130706433', '1521886185');
INSERT INTO `t_admin_log` VALUES ('39', 'admin', 'Admin', 'add', '?/admin/Admin/add', '1', 'admin', '2130706433', '1521886239');
INSERT INTO `t_admin_log` VALUES ('40', 'admin', 'Admin', 'index', '?/admin/admin/index.html', '1', 'admin', '2130706433', '1521886240');
INSERT INTO `t_admin_log` VALUES ('41', 'admin', 'Admin', 'favicon.ico', '?/admin/admin/favicon.ico', '1', 'admin', '2130706433', '1521886242');
INSERT INTO `t_admin_log` VALUES ('42', 'admin', 'Admin', 'info', '?/admin/admin/info/id/2.html', '1', 'admin', '2130706433', '1521886249');
INSERT INTO `t_admin_log` VALUES ('43', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521886251');
INSERT INTO `t_admin_log` VALUES ('44', 'admin', 'Admin', 'info', '?/admin/admin/info/id/edit', '1', 'admin', '2130706433', '1521886261');
INSERT INTO `t_admin_log` VALUES ('45', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521886262');
INSERT INTO `t_admin_log` VALUES ('46', 'admin', 'Admin', 'info', '?/admin/admin/info/id/index', '1', 'admin', '2130706433', '1521886264');
INSERT INTO `t_admin_log` VALUES ('47', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521886264');
INSERT INTO `t_admin_log` VALUES ('48', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1521886266');
INSERT INTO `t_admin_log` VALUES ('49', 'admin', 'Admin', 'info', '?/admin/admin/info/id/2.html', '1', 'admin', '2130706433', '1521886574');
INSERT INTO `t_admin_log` VALUES ('50', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521886576');
INSERT INTO `t_admin_log` VALUES ('51', 'admin', 'Admin', 'info', '?/admin/admin/info/id/index', '1', 'admin', '2130706433', '1521886628');
INSERT INTO `t_admin_log` VALUES ('52', 'admin', 'Admin', 'info', '?/admin/admin/info/id/index', '1', 'admin', '2130706433', '1521886629');
INSERT INTO `t_admin_log` VALUES ('53', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521886630');
INSERT INTO `t_admin_log` VALUES ('54', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521886630');
INSERT INTO `t_admin_log` VALUES ('55', 'admin', 'Admin', 'info', '?/admin/admin/info/id/index', '1', 'admin', '2130706433', '1521886633');
INSERT INTO `t_admin_log` VALUES ('56', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521886634');
INSERT INTO `t_admin_log` VALUES ('57', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1521886636');
INSERT INTO `t_admin_log` VALUES ('58', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1521886638');
INSERT INTO `t_admin_log` VALUES ('59', 'admin', 'Admin', 'info', '?/admin/admin/info/id/2.html', '1', 'admin', '2130706433', '1521886640');
INSERT INTO `t_admin_log` VALUES ('60', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521886642');
INSERT INTO `t_admin_log` VALUES ('61', 'admin', 'Admin', 'info', '?/admin/admin/info/id/edit', '1', 'admin', '2130706433', '1521886647');
INSERT INTO `t_admin_log` VALUES ('62', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521886648');
INSERT INTO `t_admin_log` VALUES ('63', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1521886650');
INSERT INTO `t_admin_log` VALUES ('64', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1521886795');
INSERT INTO `t_admin_log` VALUES ('65', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1521886908');
INSERT INTO `t_admin_log` VALUES ('66', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1521886911');
INSERT INTO `t_admin_log` VALUES ('67', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1521886951');
INSERT INTO `t_admin_log` VALUES ('68', 'admin', 'Admin', 'info', '?/admin/admin/info/id/2.html', '1', 'admin', '2130706433', '1521886952');
INSERT INTO `t_admin_log` VALUES ('69', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521886952');
INSERT INTO `t_admin_log` VALUES ('70', 'admin', 'Admin', 'info', '?/admin/admin/info/id/edit', '1', 'admin', '2130706433', '1521886972');
INSERT INTO `t_admin_log` VALUES ('71', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521886973');
INSERT INTO `t_admin_log` VALUES ('72', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1521886976');
INSERT INTO `t_admin_log` VALUES ('73', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1521886977');
INSERT INTO `t_admin_log` VALUES ('74', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1521887006');
INSERT INTO `t_admin_log` VALUES ('75', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1521887008');
INSERT INTO `t_admin_log` VALUES ('76', 'admin', 'Admin', 'info', '?/admin/admin/info/id/2.html', '1', 'admin', '2130706433', '1521896491');
INSERT INTO `t_admin_log` VALUES ('77', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521896493');
INSERT INTO `t_admin_log` VALUES ('78', 'admin', 'Admin', 'info', '?/admin/admin/info/id/index', '1', 'admin', '2130706433', '1521896577');
INSERT INTO `t_admin_log` VALUES ('79', 'admin', 'Admin', 'info', '?/admin/admin/info/id/index', '1', 'admin', '2130706433', '1521896578');
INSERT INTO `t_admin_log` VALUES ('80', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521896578');
INSERT INTO `t_admin_log` VALUES ('81', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521896579');
INSERT INTO `t_admin_log` VALUES ('82', 'admin', 'Admin', 'info', '?/admin/admin/info/id/index', '1', 'admin', '2130706433', '1521896580');
INSERT INTO `t_admin_log` VALUES ('83', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521896580');
INSERT INTO `t_admin_log` VALUES ('84', 'admin', 'Admin', 'info', '?/admin/admin/info/id/index', '1', 'admin', '2130706433', '1521896589');
INSERT INTO `t_admin_log` VALUES ('85', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521896589');
INSERT INTO `t_admin_log` VALUES ('86', 'admin', 'Admin', 'info', '?/admin/admin/info/id/index', '1', 'admin', '2130706433', '1521896590');
INSERT INTO `t_admin_log` VALUES ('87', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521896591');
INSERT INTO `t_admin_log` VALUES ('88', 'admin', 'Admin', 'info', '?/admin/admin/info/', '1', 'admin', '2130706433', '1521896595');
INSERT INTO `t_admin_log` VALUES ('89', 'admin', 'Admin', 'info', '?/admin/admin/info/favicon.ico', '1', 'admin', '2130706433', '1521896595');
INSERT INTO `t_admin_log` VALUES ('90', 'admin', 'Admin', 'info', '?/admin/admin/info/index', '1', 'admin', '2130706433', '1521896596');
INSERT INTO `t_admin_log` VALUES ('91', 'admin', 'Admin', 'info', '?/admin/admin/info/favicon.ico', '1', 'admin', '2130706433', '1521896597');
INSERT INTO `t_admin_log` VALUES ('92', 'admin', 'Admin', 'info', '?/admin/admin/info/', '1', 'admin', '2130706433', '1521896599');
INSERT INTO `t_admin_log` VALUES ('93', 'admin', 'Admin', 'info', '?/admin/admin/info/favicon.ico', '1', 'admin', '2130706433', '1521896599');
INSERT INTO `t_admin_log` VALUES ('94', 'admin', 'Admin', 'info', '?/admin/admin/info/', '1', 'admin', '2130706433', '1521896738');
INSERT INTO `t_admin_log` VALUES ('95', 'admin', 'Admin', 'info', '?/admin/admin/info/favicon.ico', '1', 'admin', '2130706433', '1521896738');
INSERT INTO `t_admin_log` VALUES ('96', 'admin', 'Admin', 'index', '?/admin/admin/index.html', '1', 'admin', '2130706433', '1521896739');
INSERT INTO `t_admin_log` VALUES ('97', 'admin', 'Admin', 'info', '?/admin/admin/info/id/2.html', '1', 'admin', '2130706433', '1521896747');
INSERT INTO `t_admin_log` VALUES ('98', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521896748');
INSERT INTO `t_admin_log` VALUES ('99', 'admin', 'Admin', 'info', '?/admin/admin/info/id/edit', '1', 'admin', '2130706433', '1521896758');
INSERT INTO `t_admin_log` VALUES ('100', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521896759');
INSERT INTO `t_admin_log` VALUES ('101', 'admin', 'Admin', 'index', '?/admin/admin/index.html', '1', 'admin', '2130706433', '1521896761');
INSERT INTO `t_admin_log` VALUES ('102', 'admin', 'Admin', 'info', '?/admin/admin/info/id/2.html', '1', 'admin', '2130706433', '1521896811');
INSERT INTO `t_admin_log` VALUES ('103', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521896811');
INSERT INTO `t_admin_log` VALUES ('104', 'admin', 'Admin', 'info', '?/admin/admin/info/id/edit', '1', 'admin', '2130706433', '1521896813');
INSERT INTO `t_admin_log` VALUES ('105', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521896813');
INSERT INTO `t_admin_log` VALUES ('106', 'admin', 'Admin', 'info', '?/admin/admin/info/id/edit', '1', 'admin', '2130706433', '1521896907');
INSERT INTO `t_admin_log` VALUES ('107', 'admin', 'Admin', 'info', '?/admin/admin/info/id/edit', '1', 'admin', '2130706433', '1521896937');
INSERT INTO `t_admin_log` VALUES ('108', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521896938');
INSERT INTO `t_admin_log` VALUES ('109', 'admin', 'Admin', 'edit', '?/admin/admin/edit.html', '1', 'admin', '2130706433', '1521896955');
INSERT INTO `t_admin_log` VALUES ('110', 'admin', 'Admin', 'index', '?/admin/admin', '1', 'admin', '2130706433', '1521896961');
INSERT INTO `t_admin_log` VALUES ('111', 'admin', 'Admin', 'info', '?/admin/admin/info/id/2.html', '1', 'admin', '2130706433', '1521896963');
INSERT INTO `t_admin_log` VALUES ('112', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521896965');
INSERT INTO `t_admin_log` VALUES ('113', 'admin', 'Admin', 'edit', '?/admin/admin/edit.html', '1', 'admin', '2130706433', '1521896968');
INSERT INTO `t_admin_log` VALUES ('114', 'admin', 'Admin', 'info', '?/admin/admin/info/id/2.html', '1', 'admin', '2130706433', '1521896970');
INSERT INTO `t_admin_log` VALUES ('115', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521896971');
INSERT INTO `t_admin_log` VALUES ('116', 'admin', 'Admin', 'index', '?/admin/admin/index.html', '1', 'admin', '2130706433', '1521897013');
INSERT INTO `t_admin_log` VALUES ('117', 'admin', 'Admin', 'info', '?/admin/admin/info/id/2.html', '1', 'admin', '2130706433', '1521897016');
INSERT INTO `t_admin_log` VALUES ('118', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521897016');
INSERT INTO `t_admin_log` VALUES ('119', 'admin', 'Admin', 'edit', '?/admin/admin/edit.html', '1', 'admin', '2130706433', '1521897021');
INSERT INTO `t_admin_log` VALUES ('120', 'admin', 'Admin', 'info', '?/admin/admin/info/id/2.html', '1', 'admin', '2130706433', '1521897022');
INSERT INTO `t_admin_log` VALUES ('121', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521897024');
INSERT INTO `t_admin_log` VALUES ('122', 'admin', 'Admin', 'info', '?/admin/admin/info/id/2.html', '1', 'admin', '2130706433', '1521897028');
INSERT INTO `t_admin_log` VALUES ('123', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521897030');
INSERT INTO `t_admin_log` VALUES ('124', 'admin', 'Admin', 'edit', '?/admin/admin/edit.html', '1', 'admin', '2130706433', '1521897032');
INSERT INTO `t_admin_log` VALUES ('125', 'admin', 'Admin', 'info', '?/admin/admin/info/id/2.html', '1', 'admin', '2130706433', '1521897034');
INSERT INTO `t_admin_log` VALUES ('126', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521897035');
INSERT INTO `t_admin_log` VALUES ('127', 'admin', 'Admin', 'edit', '?/admin/admin/edit.html', '1', 'admin', '2130706433', '1521897050');
INSERT INTO `t_admin_log` VALUES ('128', 'admin', 'Admin', 'info', '?/admin/admin/info/id/2.html', '1', 'admin', '2130706433', '1521897052');
INSERT INTO `t_admin_log` VALUES ('129', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521897054');
INSERT INTO `t_admin_log` VALUES ('130', 'admin', 'Admin', 'edit', '?/admin/admin/edit.html', '1', 'admin', '2130706433', '1521897071');
INSERT INTO `t_admin_log` VALUES ('131', 'admin', 'Admin', 'info', '?/admin/admin/info/id/2.html', '1', 'admin', '2130706433', '1521897072');
INSERT INTO `t_admin_log` VALUES ('132', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521897073');
INSERT INTO `t_admin_log` VALUES ('133', 'admin', 'Admin', 'edit', '?/admin/admin/edit.html', '1', 'admin', '2130706433', '1521897075');
INSERT INTO `t_admin_log` VALUES ('134', 'admin', 'Admin', 'info', '?/admin/admin/info/id/2.html', '1', 'admin', '2130706433', '1521897094');
INSERT INTO `t_admin_log` VALUES ('135', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521897096');
INSERT INTO `t_admin_log` VALUES ('136', 'admin', 'Admin', 'edit', '?/admin/admin/edit.html', '1', 'admin', '2130706433', '1521897102');
INSERT INTO `t_admin_log` VALUES ('137', 'admin', 'Admin', 'edit', '?/admin/admin/edit.html', '1', 'admin', '2130706433', '1521897168');
INSERT INTO `t_admin_log` VALUES ('138', 'admin', 'Admin', 'edit', '?/admin/admin/edit.html', '1', 'admin', '2130706433', '1521897179');
INSERT INTO `t_admin_log` VALUES ('139', 'admin', 'Admin', 'edit', '?/admin/admin/edit.html', '1', 'admin', '2130706433', '1521897181');
INSERT INTO `t_admin_log` VALUES ('140', 'admin', 'Admin', 'index', '?/admin/admin', '1', 'admin', '2130706433', '1521897183');
INSERT INTO `t_admin_log` VALUES ('141', 'admin', 'Admin', 'info', '?/admin/admin/info/id/2.html', '1', 'admin', '2130706433', '1521897185');
INSERT INTO `t_admin_log` VALUES ('142', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521897187');
INSERT INTO `t_admin_log` VALUES ('143', 'admin', 'Admin', 'info', '?/admin/admin/info/id/2.html', '1', 'admin', '2130706433', '1521897239');
INSERT INTO `t_admin_log` VALUES ('144', 'admin', 'Admin', 'info', '?/admin/admin/info/id/2.html', '1', 'admin', '2130706433', '1521897251');
INSERT INTO `t_admin_log` VALUES ('145', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521897253');
INSERT INTO `t_admin_log` VALUES ('146', 'admin', 'Admin', 'info', '?/admin/admin/info/id/2.html', '1', 'admin', '2130706433', '1521897309');
INSERT INTO `t_admin_log` VALUES ('147', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521897311');
INSERT INTO `t_admin_log` VALUES ('148', 'admin', 'Admin', 'edit', '?/admin/admin/edit.html', '1', 'admin', '2130706433', '1521897319');
INSERT INTO `t_admin_log` VALUES ('149', 'admin', 'Admin', 'info', '?/admin/admin/info/id/2.html', '1', 'admin', '2130706433', '1521897321');
INSERT INTO `t_admin_log` VALUES ('150', 'admin', 'Admin', 'index', '?/admin/admin/index.html', '1', 'admin', '2130706433', '1521897322');
INSERT INTO `t_admin_log` VALUES ('151', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521897322');
INSERT INTO `t_admin_log` VALUES ('152', 'admin', 'Admin', 'info', '?/admin/admin/info', '1', 'admin', '2130706433', '1521897424');
INSERT INTO `t_admin_log` VALUES ('153', 'admin', 'Admin', 'edit', '?/admin/admin/edit.html', '1', 'admin', '2130706433', '1521897434');
INSERT INTO `t_admin_log` VALUES ('154', 'admin', 'Admin', 'info', '?/admin/admin/info', '1', 'admin', '2130706433', '1521897437');
INSERT INTO `t_admin_log` VALUES ('155', 'admin', 'Admin', 'edit', '?/admin/admin/edit.html', '1', 'admin', '2130706433', '1521897454');
INSERT INTO `t_admin_log` VALUES ('156', 'admin', 'Admin', 'info', '?/admin/admin/info', '1', 'admin', '2130706433', '1521897455');
INSERT INTO `t_admin_log` VALUES ('157', 'admin', 'Admin', 'edit', '?/admin/admin/edit.html', '1', 'admin', '2130706433', '1521897482');
INSERT INTO `t_admin_log` VALUES ('158', 'admin', 'Admin', 'info', '?/admin/admin/info', '1', 'admin', '2130706433', '1521897485');
INSERT INTO `t_admin_log` VALUES ('159', 'admin', 'Admin', 'info', '?/admin/admin/info', '1', 'admin', '2130706433', '1521897567');
INSERT INTO `t_admin_log` VALUES ('160', 'admin', 'Admin', 'info', '?/admin/admin/info', '1', 'admin', '2130706433', '1521897610');
INSERT INTO `t_admin_log` VALUES ('161', 'admin', 'Admin', 'info', '?/admin/admin/info', '1', 'admin', '2130706433', '1521897669');
INSERT INTO `t_admin_log` VALUES ('162', 'admin', 'Admin', 'info', '?/admin/admin/info', '1', 'admin', '2130706433', '1521897721');
INSERT INTO `t_admin_log` VALUES ('163', 'admin', 'Admin', 'info', '?/admin/admin/info', '1', 'admin', '2130706433', '1521897889');
INSERT INTO `t_admin_log` VALUES ('164', 'admin', 'Admin', 'index', '?/admin/admin/index.html', '1', 'admin', '2130706433', '1521897919');
INSERT INTO `t_admin_log` VALUES ('165', 'admin', 'Admin', 'info', '?/admin/admin/info/id/2.html', '1', 'admin', '2130706433', '1521897923');
INSERT INTO `t_admin_log` VALUES ('166', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521897925');
INSERT INTO `t_admin_log` VALUES ('167', 'admin', 'Admin', 'info', '?/admin/admin/info/id/2.html', '1', 'admin', '2130706433', '1521897998');
INSERT INTO `t_admin_log` VALUES ('168', 'admin', 'Admin', 'info', '?/admin/admin/info/id/favicon.ico', '1', 'admin', '2130706433', '1521897999');
INSERT INTO `t_admin_log` VALUES ('169', 'admin', 'Admin', 'index', '?/admin/admin/index.html', '1', 'admin', '2130706433', '1521898004');
INSERT INTO `t_admin_log` VALUES ('170', 'admin', 'Admin', 'info', '?/admin/admin/info', '1', 'admin', '2130706433', '1521898008');
INSERT INTO `t_admin_log` VALUES ('171', 'admin', 'Admin', 'add', '?/admin/admin/add.html', '1', 'admin', '2130706433', '1521898012');
INSERT INTO `t_admin_log` VALUES ('172', 'admin', 'Admin', 'add', '?/admin/admin/add.html', '1', 'admin', '2130706433', '1521898020');
INSERT INTO `t_admin_log` VALUES ('173', 'admin', 'Admin', 'index', '?/admin/admin/index.html', '1', 'admin', '2130706433', '1521898022');
INSERT INTO `t_admin_log` VALUES ('174', 'admin', 'Admin', 'index', '?/admin/admin/index.html', '1', 'admin', '2130706433', '1521898088');
INSERT INTO `t_admin_log` VALUES ('175', 'admin', 'Admin', 'index', '?/admin/admin/index.html', '1', 'admin', '2130706433', '1521898274');
INSERT INTO `t_admin_log` VALUES ('176', 'admin', 'Admin', 'index', '?/admin/admin/index.html', '1', 'admin', '2130706433', '1521898302');
INSERT INTO `t_admin_log` VALUES ('177', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '1', 'admin', '2130706433', '1521898377');
INSERT INTO `t_admin_log` VALUES ('178', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1521898378');
INSERT INTO `t_admin_log` VALUES ('179', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1521898380');
INSERT INTO `t_admin_log` VALUES ('180', 'admin', 'Group', 'info', '?/admin/Group/info', '1', 'admin', '2130706433', '1521898387');
INSERT INTO `t_admin_log` VALUES ('181', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1521898394');
INSERT INTO `t_admin_log` VALUES ('182', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1521898397');
INSERT INTO `t_admin_log` VALUES ('183', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1521898399');
INSERT INTO `t_admin_log` VALUES ('184', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1521898401');
INSERT INTO `t_admin_log` VALUES ('185', 'admin', 'Group', 'info', '?/admin/Group/info', '1', 'admin', '2130706433', '1521898404');
INSERT INTO `t_admin_log` VALUES ('186', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1521898411');
INSERT INTO `t_admin_log` VALUES ('187', 'admin', 'Group', 'info', '?/admin/Group/info', '1', 'admin', '2130706433', '1521898413');
INSERT INTO `t_admin_log` VALUES ('188', 'admin', 'Group', 'info', '?/admin/Group/info', '1', 'admin', '2130706433', '1521898589');
INSERT INTO `t_admin_log` VALUES ('189', 'admin', 'Group', 'add', '?/admin/Group/add', '1', 'admin', '2130706433', '1521898602');
INSERT INTO `t_admin_log` VALUES ('190', 'admin', 'Group', 'index', '?/admin/group/index.html', '1', 'admin', '2130706433', '1521898604');
INSERT INTO `t_admin_log` VALUES ('191', 'admin', 'Group', 'favicon.ico', '?/admin/group/favicon.ico', '1', 'admin', '2130706433', '1521898605');
INSERT INTO `t_admin_log` VALUES ('192', 'admin', 'Group', 'info', '?/admin/group/info', '1', 'admin', '2130706433', '1521898607');
INSERT INTO `t_admin_log` VALUES ('193', 'admin', 'Group', 'add', '?/admin/group/add', '1', 'admin', '2130706433', '1521898616');
INSERT INTO `t_admin_log` VALUES ('194', 'admin', 'Group', 'index', '?/admin/group/index.html', '1', 'admin', '2130706433', '1521898617');
INSERT INTO `t_admin_log` VALUES ('195', 'admin', 'Group', 'info', '?/admin/group/info/id/2.html', '1', 'admin', '2130706433', '1521898620');
INSERT INTO `t_admin_log` VALUES ('196', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521898621');
INSERT INTO `t_admin_log` VALUES ('197', 'admin', 'Group', 'info', '?/admin/group/info/id/edit', '1', 'admin', '2130706433', '1521898621');
INSERT INTO `t_admin_log` VALUES ('198', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521898623');
INSERT INTO `t_admin_log` VALUES ('199', 'admin', 'Group', 'info', '?/admin/group/info/id/index', '1', 'admin', '2130706433', '1521898624');
INSERT INTO `t_admin_log` VALUES ('200', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521898625');
INSERT INTO `t_admin_log` VALUES ('201', 'admin', 'Group', 'info', '?/admin/group/info/id/index', '1', 'admin', '2130706433', '1521898625');
INSERT INTO `t_admin_log` VALUES ('202', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521898627');
INSERT INTO `t_admin_log` VALUES ('203', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1521898630');
INSERT INTO `t_admin_log` VALUES ('204', 'admin', 'Group', 'info', '?/admin/group/info/id/2.html', '1', 'admin', '2130706433', '1521898654');
INSERT INTO `t_admin_log` VALUES ('205', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521898655');
INSERT INTO `t_admin_log` VALUES ('206', 'admin', 'Group', 'info', '?/admin/group/info/id/index', '1', 'admin', '2130706433', '1521898664');
INSERT INTO `t_admin_log` VALUES ('207', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521898664');
INSERT INTO `t_admin_log` VALUES ('208', 'admin', 'Group', 'info', '?/admin/group/info/id/index', '1', 'admin', '2130706433', '1521898692');
INSERT INTO `t_admin_log` VALUES ('209', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521898692');
INSERT INTO `t_admin_log` VALUES ('210', 'admin', 'Group', 'index', '?/admin/group/index.html', '1', 'admin', '2130706433', '1521898693');
INSERT INTO `t_admin_log` VALUES ('211', 'admin', 'Group', 'info', '?/admin/group/info/id/2.html', '1', 'admin', '2130706433', '1521898697');
INSERT INTO `t_admin_log` VALUES ('212', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521898698');
INSERT INTO `t_admin_log` VALUES ('213', 'admin', 'Group', 'info', '?/admin/group/info/id/edit', '1', 'admin', '2130706433', '1521898700');
INSERT INTO `t_admin_log` VALUES ('214', 'admin', 'Group', 'index', '?/admin/group/index.html', '1', 'admin', '2130706433', '1521898701');
INSERT INTO `t_admin_log` VALUES ('215', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521898701');
INSERT INTO `t_admin_log` VALUES ('216', 'admin', 'Group', 'info', '?/admin/group/info/id/2.html', '1', 'admin', '2130706433', '1521898704');
INSERT INTO `t_admin_log` VALUES ('217', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521898705');
INSERT INTO `t_admin_log` VALUES ('218', 'admin', 'Group', 'info', '?/admin/group/info/id/edit', '1', 'admin', '2130706433', '1521898755');
INSERT INTO `t_admin_log` VALUES ('219', 'admin', 'Group', 'index', '?/admin/group/index.html', '1', 'admin', '2130706433', '1521898757');
INSERT INTO `t_admin_log` VALUES ('220', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521898757');
INSERT INTO `t_admin_log` VALUES ('221', 'admin', 'Group', 'info', '?/admin/group/info/id/2.html', '1', 'admin', '2130706433', '1521898758');
INSERT INTO `t_admin_log` VALUES ('222', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521898760');
INSERT INTO `t_admin_log` VALUES ('223', 'admin', 'Group', 'info', '?/admin/group/info/id/edit', '1', 'admin', '2130706433', '1521898777');
INSERT INTO `t_admin_log` VALUES ('224', 'admin', 'Group', 'index', '?/admin/group/index.html', '1', 'admin', '2130706433', '1521898778');
INSERT INTO `t_admin_log` VALUES ('225', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521898778');
INSERT INTO `t_admin_log` VALUES ('226', 'admin', 'Group', 'info', '?/admin/group/info/id/2.html', '1', 'admin', '2130706433', '1521898780');
INSERT INTO `t_admin_log` VALUES ('227', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521898782');
INSERT INTO `t_admin_log` VALUES ('228', 'admin', 'Group', 'info', '?/admin/group/info/id/edit', '1', 'admin', '2130706433', '1521898826');
INSERT INTO `t_admin_log` VALUES ('229', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521898827');
INSERT INTO `t_admin_log` VALUES ('230', 'admin', 'Group', 'info', '?/admin/group/info/id/edit', '1', 'admin', '2130706433', '1521898828');
INSERT INTO `t_admin_log` VALUES ('231', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521898829');
INSERT INTO `t_admin_log` VALUES ('232', 'admin', 'Group', 'index', '?/admin/group/index.html', '1', 'admin', '2130706433', '1521898830');
INSERT INTO `t_admin_log` VALUES ('233', 'admin', 'Group', 'info', '?/admin/group/info/id/2.html', '1', 'admin', '2130706433', '1521898831');
INSERT INTO `t_admin_log` VALUES ('234', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521898833');
INSERT INTO `t_admin_log` VALUES ('235', 'admin', 'Group', 'info', '?/admin/group/info/id/edit', '1', 'admin', '2130706433', '1521898836');
INSERT INTO `t_admin_log` VALUES ('236', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521898837');
INSERT INTO `t_admin_log` VALUES ('237', 'admin', 'Group', 'index', '?/admin/group/index.html', '1', 'admin', '2130706433', '1521898840');
INSERT INTO `t_admin_log` VALUES ('238', 'admin', 'Group', 'info', '?/admin/group/info/id/2.html', '1', 'admin', '2130706433', '1521898842');
INSERT INTO `t_admin_log` VALUES ('239', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521898843');
INSERT INTO `t_admin_log` VALUES ('240', 'admin', 'Group', 'info', '?/admin/group/info/id/edit', '1', 'admin', '2130706433', '1521898862');
INSERT INTO `t_admin_log` VALUES ('241', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521898864');
INSERT INTO `t_admin_log` VALUES ('242', 'admin', 'Group', 'index', '?/admin/group/index.html', '1', 'admin', '2130706433', '1521898948');
INSERT INTO `t_admin_log` VALUES ('243', 'admin', 'Group', 'info', '?/admin/group/info/id/2.html', '1', 'admin', '2130706433', '1521898951');
INSERT INTO `t_admin_log` VALUES ('244', 'admin', 'Group', 'info', '?/admin/group/info/id/2.html', '1', 'admin', '2130706433', '1521899000');
INSERT INTO `t_admin_log` VALUES ('245', 'admin', 'Group', 'info', '?/admin/group/info/id/2.html', '1', 'admin', '2130706433', '1521899036');
INSERT INTO `t_admin_log` VALUES ('246', 'admin', 'Group', 'info', '?/admin/group/info/id/2.html', '1', 'admin', '2130706433', '1521899050');
INSERT INTO `t_admin_log` VALUES ('247', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521899050');
INSERT INTO `t_admin_log` VALUES ('248', 'admin', 'Group', 'info', '?/admin/group/info/id/edit', '1', 'admin', '2130706433', '1521899059');
INSERT INTO `t_admin_log` VALUES ('249', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521899059');
INSERT INTO `t_admin_log` VALUES ('250', 'admin', 'Group', 'index', '?/admin/group/index.html', '1', 'admin', '2130706433', '1521899061');
INSERT INTO `t_admin_log` VALUES ('251', 'admin', 'Group', 'info', '?/admin/group/info/id/2.html', '1', 'admin', '2130706433', '1521899078');
INSERT INTO `t_admin_log` VALUES ('252', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521899080');
INSERT INTO `t_admin_log` VALUES ('253', 'admin', 'Group', 'edit', '?/admin/group/edit.html', '1', 'admin', '2130706433', '1521899081');
INSERT INTO `t_admin_log` VALUES ('254', 'admin', 'Group', 'edit', '?/admin/group/edit.html', '1', 'admin', '2130706433', '1521899097');
INSERT INTO `t_admin_log` VALUES ('255', 'admin', 'Group', 'index', '?/admin/group/index.html', '1', 'admin', '2130706433', '1521899099');
INSERT INTO `t_admin_log` VALUES ('256', 'admin', 'Group', 'info', '?/admin/group/info/id/2.html', '1', 'admin', '2130706433', '1521899101');
INSERT INTO `t_admin_log` VALUES ('257', 'admin', 'Group', 'info', '?/admin/group/info/id/favicon.ico', '1', 'admin', '2130706433', '1521899102');
INSERT INTO `t_admin_log` VALUES ('258', 'admin', 'Group', 'edit', '?/admin/group/edit.html', '1', 'admin', '2130706433', '1521899105');
INSERT INTO `t_admin_log` VALUES ('259', 'admin', 'Group', 'index', '?/admin/group/index.html', '1', 'admin', '2130706433', '1521899106');
INSERT INTO `t_admin_log` VALUES ('260', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '1', 'admin', '2130706433', '1521899113');
INSERT INTO `t_admin_log` VALUES ('261', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '1', 'admin', '2130706433', '1521899171');
INSERT INTO `t_admin_log` VALUES ('262', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '1', 'admin', '2130706433', '1521899182');
INSERT INTO `t_admin_log` VALUES ('263', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '1', 'admin', '2130706433', '1521899192');
INSERT INTO `t_admin_log` VALUES ('264', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '1', 'admin', '2130706433', '1521899271');
INSERT INTO `t_admin_log` VALUES ('265', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '1', 'admin', '2130706433', '1521899272');
INSERT INTO `t_admin_log` VALUES ('266', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1521899279');
INSERT INTO `t_admin_log` VALUES ('267', 'admin', 'Group', 'del', '?/admin/group/del/id/2.html', '1', 'admin', '2130706433', '1521899327');
INSERT INTO `t_admin_log` VALUES ('268', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1521899357');
INSERT INTO `t_admin_log` VALUES ('269', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1521899359');
INSERT INTO `t_admin_log` VALUES ('270', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1521899360');
INSERT INTO `t_admin_log` VALUES ('271', 'admin', 'Group', 'info', '?/admin/Group/info', '1', 'admin', '2130706433', '1521899362');
INSERT INTO `t_admin_log` VALUES ('272', 'admin', 'Group', 'add', '?/admin/group/add.html', '1', 'admin', '2130706433', '1521899367');
INSERT INTO `t_admin_log` VALUES ('273', 'admin', 'Group', 'index', '?/admin/group/index.html', '1', 'admin', '2130706433', '1521899369');
INSERT INTO `t_admin_log` VALUES ('274', 'admin', 'Group', 'del', '?/admin/group/del/id/3.html', '1', 'admin', '2130706433', '1521899371');
INSERT INTO `t_admin_log` VALUES ('275', 'admin', 'Group', 'index', '?/admin/group/index.html', '1', 'admin', '2130706433', '1521899372');
INSERT INTO `t_admin_log` VALUES ('276', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1521899390');
INSERT INTO `t_admin_log` VALUES ('277', 'admin', 'Admin', 'del', '?/admin/admin/del/id/3.html', '1', 'admin', '2130706433', '1521899394');
INSERT INTO `t_admin_log` VALUES ('278', 'admin', 'Admin', 'index', '?/admin/admin/index.html', '1', 'admin', '2130706433', '1521899395');
INSERT INTO `t_admin_log` VALUES ('279', 'admin', 'Log', 'favicon.ico', '?/admin/Log/favicon.ico', '1', 'admin', '2130706433', '1521899433');
INSERT INTO `t_admin_log` VALUES ('280', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1521899599');
INSERT INTO `t_admin_log` VALUES ('281', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1521899602');
INSERT INTO `t_admin_log` VALUES ('282', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1521899621');
INSERT INTO `t_admin_log` VALUES ('283', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/1.html', '1', 'admin', '2130706433', '1521899622');
INSERT INTO `t_admin_log` VALUES ('284', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521899624');
INSERT INTO `t_admin_log` VALUES ('285', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/1.html', '1', 'admin', '2130706433', '1521899676');
INSERT INTO `t_admin_log` VALUES ('286', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521899678');
INSERT INTO `t_admin_log` VALUES ('287', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/1.html', '1', 'admin', '2130706433', '1521899781');
INSERT INTO `t_admin_log` VALUES ('288', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521899782');
INSERT INTO `t_admin_log` VALUES ('289', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/1.html', '1', 'admin', '2130706433', '1521899846');
INSERT INTO `t_admin_log` VALUES ('290', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521899848');
INSERT INTO `t_admin_log` VALUES ('291', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/1.html', '1', 'admin', '2130706433', '1521899853');
INSERT INTO `t_admin_log` VALUES ('292', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521899854');
INSERT INTO `t_admin_log` VALUES ('293', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/1.html', '1', 'admin', '2130706433', '1521899914');
INSERT INTO `t_admin_log` VALUES ('294', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521899916');
INSERT INTO `t_admin_log` VALUES ('295', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/1.html', '1', 'admin', '2130706433', '1521900003');
INSERT INTO `t_admin_log` VALUES ('296', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521900005');
INSERT INTO `t_admin_log` VALUES ('297', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/editRule', '1', 'admin', '2130706433', '1521900014');
INSERT INTO `t_admin_log` VALUES ('298', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521900016');
INSERT INTO `t_admin_log` VALUES ('299', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/index', '1', 'admin', '2130706433', '1521900016');
INSERT INTO `t_admin_log` VALUES ('300', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521900018');
INSERT INTO `t_admin_log` VALUES ('301', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/index', '1', 'admin', '2130706433', '1521900019');
INSERT INTO `t_admin_log` VALUES ('302', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521900020');
INSERT INTO `t_admin_log` VALUES ('303', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1521900021');
INSERT INTO `t_admin_log` VALUES ('304', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/1.html', '1', 'admin', '2130706433', '1521900023');
INSERT INTO `t_admin_log` VALUES ('305', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521900025');
INSERT INTO `t_admin_log` VALUES ('306', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1521900071');
INSERT INTO `t_admin_log` VALUES ('307', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1521900074');
INSERT INTO `t_admin_log` VALUES ('308', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/1.html', '1', 'admin', '2130706433', '1521900089');
INSERT INTO `t_admin_log` VALUES ('309', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521900090');
INSERT INTO `t_admin_log` VALUES ('310', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/1.html', '1', 'admin', '2130706433', '1521900117');
INSERT INTO `t_admin_log` VALUES ('311', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521900119');
INSERT INTO `t_admin_log` VALUES ('312', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/editRule', '1', 'admin', '2130706433', '1521900122');
INSERT INTO `t_admin_log` VALUES ('313', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521900123');
INSERT INTO `t_admin_log` VALUES ('314', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/editRule', '1', 'admin', '2130706433', '1521900169');
INSERT INTO `t_admin_log` VALUES ('315', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521900170');
INSERT INTO `t_admin_log` VALUES ('316', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/index', '1', 'admin', '2130706433', '1521900174');
INSERT INTO `t_admin_log` VALUES ('317', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521900176');
INSERT INTO `t_admin_log` VALUES ('318', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/index', '1', 'admin', '2130706433', '1521900197');
INSERT INTO `t_admin_log` VALUES ('319', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521900198');
INSERT INTO `t_admin_log` VALUES ('320', 'admin', 'Group', 'index', '?/admin/group/index.html', '1', 'admin', '2130706433', '1521900199');
INSERT INTO `t_admin_log` VALUES ('321', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/1.html', '1', 'admin', '2130706433', '1521900200');
INSERT INTO `t_admin_log` VALUES ('322', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521900201');
INSERT INTO `t_admin_log` VALUES ('323', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/editRule', '1', 'admin', '2130706433', '1521900226');
INSERT INTO `t_admin_log` VALUES ('324', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521900227');
INSERT INTO `t_admin_log` VALUES ('325', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/editRule', '1', 'admin', '2130706433', '1521900228');
INSERT INTO `t_admin_log` VALUES ('326', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521900230');
INSERT INTO `t_admin_log` VALUES ('327', 'admin', 'Group', 'editrule', '?/admin/group/editrule.html', '1', 'admin', '2130706433', '1521900230');
INSERT INTO `t_admin_log` VALUES ('328', 'admin', 'Group', 'editrule', '?/admin/group/editrule.html', '1', 'admin', '2130706433', '1521900243');
INSERT INTO `t_admin_log` VALUES ('329', 'admin', 'Group', 'index', '?/admin/group/', '1', 'admin', '2130706433', '1521900248');
INSERT INTO `t_admin_log` VALUES ('330', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/1.html', '1', 'admin', '2130706433', '1521900250');
INSERT INTO `t_admin_log` VALUES ('331', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521900252');
INSERT INTO `t_admin_log` VALUES ('332', 'admin', 'Group', 'editrule', '?/admin/group/editrule.html', '1', 'admin', '2130706433', '1521900254');
INSERT INTO `t_admin_log` VALUES ('333', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/1.html', '1', 'admin', '2130706433', '1521900256');
INSERT INTO `t_admin_log` VALUES ('334', 'admin', 'Group', 'index', '?/admin/group/index.html', '1', 'admin', '2130706433', '1521900258');
INSERT INTO `t_admin_log` VALUES ('335', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521900258');
INSERT INTO `t_admin_log` VALUES ('336', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/1.html', '1', 'admin', '2130706433', '1521900259');
INSERT INTO `t_admin_log` VALUES ('337', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521900261');
INSERT INTO `t_admin_log` VALUES ('338', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/1.html', '1', 'admin', '2130706433', '1521900367');
INSERT INTO `t_admin_log` VALUES ('339', 'admin', 'Group', 'rule', '?/admin/group/rule/gid/favicon.ico', '1', 'admin', '2130706433', '1521900368');
INSERT INTO `t_admin_log` VALUES ('340', 'admin', 'Group', 'index', '?/admin/group/index.html', '1', 'admin', '2130706433', '1521900371');
INSERT INTO `t_admin_log` VALUES ('341', 'admin', 'Index', 'favicon.ico', '?/admin/Index/favicon.ico', '1', 'admin', '2130706433', '1521900375');
INSERT INTO `t_admin_log` VALUES ('342', 'admin', 'Menu', 'favicon.ico', '?/admin/Menu/favicon.ico', '1', 'admin', '2130706433', '1521900378');
INSERT INTO `t_admin_log` VALUES ('343', 'admin', 'Menu', 'setlistorder', '?/admin/Menu/setListorder', '1', 'admin', '2130706433', '1521900793');
INSERT INTO `t_admin_log` VALUES ('344', 'admin', 'Menu', 'info', '?/admin/Menu/info', '1', 'admin', '2130706433', '1521901023');
INSERT INTO `t_admin_log` VALUES ('345', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/22.html', '1', 'admin', '2130706433', '1521901028');
INSERT INTO `t_admin_log` VALUES ('346', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/index', '1', 'admin', '2130706433', '1521901029');
INSERT INTO `t_admin_log` VALUES ('347', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1521901030');
INSERT INTO `t_admin_log` VALUES ('348', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1521901030');
INSERT INTO `t_admin_log` VALUES ('349', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/index', '1', 'admin', '2130706433', '1521901036');
INSERT INTO `t_admin_log` VALUES ('350', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1521901037');
INSERT INTO `t_admin_log` VALUES ('351', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/index', '1', 'admin', '2130706433', '1521901039');
INSERT INTO `t_admin_log` VALUES ('352', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1521901039');
INSERT INTO `t_admin_log` VALUES ('353', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/index', '1', 'admin', '2130706433', '1521901043');
INSERT INTO `t_admin_log` VALUES ('354', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1521901043');
INSERT INTO `t_admin_log` VALUES ('355', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/index', '1', 'admin', '2130706433', '1521901044');
INSERT INTO `t_admin_log` VALUES ('356', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1521901045');
INSERT INTO `t_admin_log` VALUES ('357', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/index', '1', 'admin', '2130706433', '1521901077');
INSERT INTO `t_admin_log` VALUES ('358', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1521901078');
INSERT INTO `t_admin_log` VALUES ('359', 'admin', 'Menu', 'favicon.ico', '?/admin/menu/favicon.ico', '1', 'admin', '2130706433', '1521901080');
INSERT INTO `t_admin_log` VALUES ('360', 'admin', 'Menu', 'info', '?/admin/menu/info', '1', 'admin', '2130706433', '1521901082');
INSERT INTO `t_admin_log` VALUES ('361', 'admin', 'Menu', 'add', '?/admin/menu/add', '1', 'admin', '2130706433', '1521901193');
INSERT INTO `t_admin_log` VALUES ('362', 'admin', 'Menu', 'info', '?/admin/menu/info/id/23.html', '1', 'admin', '2130706433', '1521901396');
INSERT INTO `t_admin_log` VALUES ('363', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1521901396');
INSERT INTO `t_admin_log` VALUES ('364', 'admin', 'Menu', 'info', '?/admin/menu/info/id/edit', '1', 'admin', '2130706433', '1521901442');
INSERT INTO `t_admin_log` VALUES ('365', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1521901442');
INSERT INTO `t_admin_log` VALUES ('366', 'admin', 'Menu', 'info', '?/admin/menu/info/id/23.html', '1', 'admin', '2130706433', '1521901449');
INSERT INTO `t_admin_log` VALUES ('367', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1521901451');
INSERT INTO `t_admin_log` VALUES ('368', 'admin', 'Menu', 'info', '?/admin/menu/info/id/23.html', '1', 'admin', '2130706433', '1521901513');
INSERT INTO `t_admin_log` VALUES ('369', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1521901514');
INSERT INTO `t_admin_log` VALUES ('370', 'admin', 'Menu', 'edit', '?/admin/menu/edit.html', '1', 'admin', '2130706433', '1521901528');
INSERT INTO `t_admin_log` VALUES ('371', 'admin', 'Menu', 'info', '?/admin/menu/info/id/23.html', '1', 'admin', '2130706433', '1521901533');
INSERT INTO `t_admin_log` VALUES ('372', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1521901534');
INSERT INTO `t_admin_log` VALUES ('373', 'admin', 'Menu', 'edit', '?/admin/menu/edit.html', '1', 'admin', '2130706433', '1521901564');
INSERT INTO `t_admin_log` VALUES ('374', 'admin', 'Menu', 'info', '?/admin/menu/info/id/23.html', '1', 'admin', '2130706433', '1521901574');
INSERT INTO `t_admin_log` VALUES ('375', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1521901575');
INSERT INTO `t_admin_log` VALUES ('376', 'admin', 'Menu', 'info', '?/admin/menu/info/id/23.html', '1', 'admin', '2130706433', '1521901599');
INSERT INTO `t_admin_log` VALUES ('377', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1521901601');
INSERT INTO `t_admin_log` VALUES ('378', 'admin', 'Menu', 'edit', '?/admin/menu/edit.html', '1', 'admin', '2130706433', '1521901606');
INSERT INTO `t_admin_log` VALUES ('379', 'admin', 'Menu', 'edit', '?/admin/menu/edit.html', '1', 'admin', '2130706433', '1521901614');
INSERT INTO `t_admin_log` VALUES ('380', 'admin', 'Menu', 'info', '?/admin/menu/info/id/23.html', '1', 'admin', '2130706433', '1521901681');
INSERT INTO `t_admin_log` VALUES ('381', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1521901682');
INSERT INTO `t_admin_log` VALUES ('382', 'admin', 'Menu', 'info', '?/admin/menu/info/id/23.html', '1', 'admin', '2130706433', '1521901684');
INSERT INTO `t_admin_log` VALUES ('383', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1521901685');
INSERT INTO `t_admin_log` VALUES ('384', 'admin', 'Menu', 'info', '?/admin/menu/info/id/23.html', '1', 'admin', '2130706433', '1521901702');
INSERT INTO `t_admin_log` VALUES ('385', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1521901703');
INSERT INTO `t_admin_log` VALUES ('386', 'admin', 'Menu', 'edit', '?/admin/menu/edit.html', '1', 'admin', '2130706433', '1521901731');
INSERT INTO `t_admin_log` VALUES ('387', 'admin', 'Menu', 'edit', '?/admin/menu/edit.html', '1', 'admin', '2130706433', '1521901736');
INSERT INTO `t_admin_log` VALUES ('388', 'admin', 'Menu', 'info', '?/admin/menu/info/id/23.html', '1', 'admin', '2130706433', '1521901742');
INSERT INTO `t_admin_log` VALUES ('389', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1521901742');
INSERT INTO `t_admin_log` VALUES ('390', 'admin', 'Menu', 'edit', '?/admin/menu/edit.html', '1', 'admin', '2130706433', '1521901749');
INSERT INTO `t_admin_log` VALUES ('391', 'admin', 'Menu', 'info', '?/admin/menu/info/id/23.html', '1', 'admin', '2130706433', '1521901770');
INSERT INTO `t_admin_log` VALUES ('392', 'admin', 'Menu', 'info', '?/admin/menu/info/id/23.html', '1', 'admin', '2130706433', '1521901771');
INSERT INTO `t_admin_log` VALUES ('393', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1521901772');
INSERT INTO `t_admin_log` VALUES ('394', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1521901772');
INSERT INTO `t_admin_log` VALUES ('395', 'admin', 'Menu', 'edit', '?/admin/menu/edit.html', '1', 'admin', '2130706433', '1521901883');
INSERT INTO `t_admin_log` VALUES ('396', 'admin', 'Menu', 'info', '?/admin/menu/info/id/23.html', '1', 'admin', '2130706433', '1521901895');
INSERT INTO `t_admin_log` VALUES ('397', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1521901897');
INSERT INTO `t_admin_log` VALUES ('398', 'admin', 'Menu', 'edit', '?/admin/menu/edit.html', '1', 'admin', '2130706433', '1521901901');
INSERT INTO `t_admin_log` VALUES ('399', 'admin', 'Menu', 'del', '?/admin/menu/del/id/23.html', '1', 'admin', '2130706433', '1521901912');
INSERT INTO `t_admin_log` VALUES ('400', 'admin', 'Menu', 'info', '?/admin/menu/info', '1', 'admin', '2130706433', '1521901918');
INSERT INTO `t_admin_log` VALUES ('401', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1521901958');
INSERT INTO `t_admin_log` VALUES ('402', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/24.html', '1', 'admin', '2130706433', '1521901964');
INSERT INTO `t_admin_log` VALUES ('403', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1521901966');
INSERT INTO `t_admin_log` VALUES ('404', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1521901992');
INSERT INTO `t_admin_log` VALUES ('405', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/25.html', '1', 'admin', '2130706433', '1521901997');
INSERT INTO `t_admin_log` VALUES ('406', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1521901998');
INSERT INTO `t_admin_log` VALUES ('407', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/25.html', '1', 'admin', '2130706433', '1521902002');
INSERT INTO `t_admin_log` VALUES ('408', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1521902004');
INSERT INTO `t_admin_log` VALUES ('409', 'admin', 'Menu', 'info', '?/admin/menu/info/id/25.html', '1', 'admin', '2130706433', '1521902007');
INSERT INTO `t_admin_log` VALUES ('410', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1521902008');
INSERT INTO `t_admin_log` VALUES ('411', 'admin', 'Menu', 'del', '?/admin/menu/del/id/25.html', '1', 'admin', '2130706433', '1521902019');
INSERT INTO `t_admin_log` VALUES ('412', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/24.html', '1', 'admin', '2130706433', '1521902024');
INSERT INTO `t_admin_log` VALUES ('413', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1521902025');
INSERT INTO `t_admin_log` VALUES ('414', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1521902055');
INSERT INTO `t_admin_log` VALUES ('415', 'admin', 'Menu', 'del', '?/admin/menu/del/id/26.html', '1', 'admin', '2130706433', '1521902071');
INSERT INTO `t_admin_log` VALUES ('416', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/24.html', '1', 'admin', '2130706433', '1521902076');
INSERT INTO `t_admin_log` VALUES ('417', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1521902078');
INSERT INTO `t_admin_log` VALUES ('418', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1521902109');
INSERT INTO `t_admin_log` VALUES ('419', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1521902127');
INSERT INTO `t_admin_log` VALUES ('420', 'admin', 'Menu', 'info', '?/admin/menu/info/id/27.html', '1', 'admin', '2130706433', '1521902139');
INSERT INTO `t_admin_log` VALUES ('421', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1521902141');
INSERT INTO `t_admin_log` VALUES ('422', 'admin', 'Menu', 'info', '?/admin/menu/info/id/27.html', '1', 'admin', '2130706433', '1521902159');
INSERT INTO `t_admin_log` VALUES ('423', 'admin', 'Menu', 'info', '?/admin/menu/info/id/27.html', '1', 'admin', '2130706433', '1521902201');
INSERT INTO `t_admin_log` VALUES ('424', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1521902202');
INSERT INTO `t_admin_log` VALUES ('425', 'admin', 'Menu', 'edit', '?/admin/menu/edit.html', '1', 'admin', '2130706433', '1521902204');
INSERT INTO `t_admin_log` VALUES ('426', 'admin', 'Menu', 'info', '?/admin/menu/info/id/27.html', '1', 'admin', '2130706433', '1521902239');
INSERT INTO `t_admin_log` VALUES ('427', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1521902240');
INSERT INTO `t_admin_log` VALUES ('428', 'admin', 'Menu', 'info', '?/admin/menu/info/id/27.html', '1', 'admin', '2130706433', '1521902240');
INSERT INTO `t_admin_log` VALUES ('429', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1521902242');
INSERT INTO `t_admin_log` VALUES ('430', 'admin', 'Menu', 'edit', '?/admin/menu/edit.html', '1', 'admin', '2130706433', '1521902243');
INSERT INTO `t_admin_log` VALUES ('431', 'admin', 'Menu', 'edit', '?/admin/menu/edit.html', '1', 'admin', '2130706433', '1521902252');
INSERT INTO `t_admin_log` VALUES ('432', 'admin', 'Menu', 'info', '?/admin/menu/info/id/24.html', '1', 'admin', '2130706433', '1521902287');
INSERT INTO `t_admin_log` VALUES ('433', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1521902288');
INSERT INTO `t_admin_log` VALUES ('434', 'admin', 'Menu', 'info', '?/admin/menu/info/id/24.html', '1', 'admin', '2130706433', '1521902430');
INSERT INTO `t_admin_log` VALUES ('435', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1521902432');
INSERT INTO `t_admin_log` VALUES ('436', 'admin', 'Menu', 'info', '?/admin/menu/info/id/24.html', '1', 'admin', '2130706433', '1521902439');
INSERT INTO `t_admin_log` VALUES ('437', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1521902440');
INSERT INTO `t_admin_log` VALUES ('438', 'admin', 'Menu', 'setlistorder', '?/admin/menu/setListorder', '1', 'admin', '2130706433', '1521902830');
INSERT INTO `t_admin_log` VALUES ('439', 'admin', 'Menu', 'setlistorder', '?/admin/menu/setListorder', '1', 'admin', '2130706433', '1521902881');
INSERT INTO `t_admin_log` VALUES ('440', 'admin', 'Menu', 'setlistorder', '?/admin/menu/setListorder', '1', 'admin', '2130706433', '1521902889');
INSERT INTO `t_admin_log` VALUES ('441', 'admin', 'Menu', 'setlistorder', '?/admin/menu/setListorder', '1', 'admin', '2130706433', '1521902897');
INSERT INTO `t_admin_log` VALUES ('442', 'admin', 'Menu', 'setlistorder', '?/admin/menu/setListorder', '1', 'admin', '2130706433', '1521902940');
INSERT INTO `t_admin_log` VALUES ('443', 'admin', 'Menu', 'setlistorder', '?/admin/menu/setListorder', '1', 'admin', '2130706433', '1521902965');
INSERT INTO `t_admin_log` VALUES ('444', 'admin', 'Menu', 'setlistorder', '?/admin/menu/setListorder', '1', 'admin', '2130706433', '1521902974');
INSERT INTO `t_admin_log` VALUES ('445', 'admin', 'Menu', 'setlistorder', '?/admin/menu/setListorder', '1', 'admin', '2130706433', '1521902981');
INSERT INTO `t_admin_log` VALUES ('446', 'admin', 'Menu', 'setlistorder', '?/admin/menu/setListorder', '1', 'admin', '2130706433', '1521902995');
INSERT INTO `t_admin_log` VALUES ('447', 'admin', 'Menu', 'setlistorder', '?/admin/menu/setListorder', '1', 'admin', '2130706433', '1521903016');
INSERT INTO `t_admin_log` VALUES ('448', 'admin', 'Menu', 'info', '?/admin/menu/info/id/24.html', '1', 'admin', '2130706433', '1521903970');
INSERT INTO `t_admin_log` VALUES ('449', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1521903972');
INSERT INTO `t_admin_log` VALUES ('450', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/24.html', '1', 'admin', '2130706433', '1521903977');
INSERT INTO `t_admin_log` VALUES ('451', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1521903978');
INSERT INTO `t_admin_log` VALUES ('452', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1521904042');
INSERT INTO `t_admin_log` VALUES ('453', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/24.html', '1', 'admin', '2130706433', '1521904045');
INSERT INTO `t_admin_log` VALUES ('454', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1521904046');
INSERT INTO `t_admin_log` VALUES ('455', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1521904052');
INSERT INTO `t_admin_log` VALUES ('456', 'admin', 'Menu', 'del', '?/admin/menu/del/id/28.html', '1', 'admin', '2130706433', '1521904089');
INSERT INTO `t_admin_log` VALUES ('457', 'admin', 'Index', 'favicon.ico', '?/admin/index/favicon.ico', '1', 'admin', '2130706433', '1522033759');
INSERT INTO `t_admin_log` VALUES ('458', 'admin', 'Index', 'favicon.ico', '?/admin/Index/favicon.ico', '1', 'admin', '2130706433', '1522034691');
INSERT INTO `t_admin_log` VALUES ('459', 'admin', 'Member', 'center', '?/admin/Member/center', '1', 'admin', '2130706433', '1522034790');
INSERT INTO `t_admin_log` VALUES ('460', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1522034804');
INSERT INTO `t_admin_log` VALUES ('461', 'admin', 'Admin', 'favicon.ico', '?/admin/Admin/favicon.ico', '1', 'admin', '2130706433', '1522034805');
INSERT INTO `t_admin_log` VALUES ('462', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '1', 'admin', '2130706433', '1522034806');
INSERT INTO `t_admin_log` VALUES ('463', 'admin', 'Menu', 'favicon.ico', '?/admin/Menu/favicon.ico', '1', 'admin', '2130706433', '1522034809');
INSERT INTO `t_admin_log` VALUES ('464', 'admin', 'Log', 'favicon.ico', '?/admin/Log/favicon.ico', '1', 'admin', '2130706433', '1522034811');
INSERT INTO `t_admin_log` VALUES ('465', 'admin', 'Menu', 'info', '?/admin/menu/info/id/27.html', '1', 'admin', '2130706433', '1522034814');
INSERT INTO `t_admin_log` VALUES ('466', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1522034814');
INSERT INTO `t_admin_log` VALUES ('467', 'admin', 'Menu', 'edit', '?/admin/menu/edit.html', '1', 'admin', '2130706433', '1522034830');
INSERT INTO `t_admin_log` VALUES ('468', 'admin', 'Menu', 'favicon.ico', '?/admin/menu/favicon.ico', '1', 'admin', '2130706433', '1522034832');
INSERT INTO `t_admin_log` VALUES ('469', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522034834');
INSERT INTO `t_admin_log` VALUES ('470', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '1', 'admin', '2130706433', '1522034866');
INSERT INTO `t_admin_log` VALUES ('471', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1522034867');
INSERT INTO `t_admin_log` VALUES ('472', 'admin', 'Group', 'favicon.ico', '?/admin/Group/favicon.ico', '1', 'admin', '2130706433', '1522034867');
INSERT INTO `t_admin_log` VALUES ('473', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1522034941');
INSERT INTO `t_admin_log` VALUES ('474', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522034942');
INSERT INTO `t_admin_log` VALUES ('475', 'admin', 'Member', 'favicon.ico', '?/admin/Member/favicon.ico', '1', 'admin', '2130706433', '1522034942');
INSERT INTO `t_admin_log` VALUES ('476', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522034999');
INSERT INTO `t_admin_log` VALUES ('477', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522035260');
INSERT INTO `t_admin_log` VALUES ('478', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522035269');
INSERT INTO `t_admin_log` VALUES ('479', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522036907');
INSERT INTO `t_admin_log` VALUES ('480', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522036942');
INSERT INTO `t_admin_log` VALUES ('481', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522036957');
INSERT INTO `t_admin_log` VALUES ('482', 'admin', 'Member', 'index', '?/admin/Member/index&page=2', '1', 'admin', '2130706433', '1522036960');
INSERT INTO `t_admin_log` VALUES ('483', 'admin', 'Member', 'index', '?/admin/Member/index&page=3', '1', 'admin', '2130706433', '1522036961');
INSERT INTO `t_admin_log` VALUES ('484', 'admin', 'Member', 'index', '?/admin/Member/index&page=5', '1', 'admin', '2130706433', '1522036961');
INSERT INTO `t_admin_log` VALUES ('485', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522036963');
INSERT INTO `t_admin_log` VALUES ('486', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522037087');
INSERT INTO `t_admin_log` VALUES ('487', 'admin', 'Admin', 'index', '?/admin/admin/index/group_id/1.html', '1', 'admin', '2130706433', '1522037123');
INSERT INTO `t_admin_log` VALUES ('488', 'admin', 'Admin', 'index', '?/admin/admin/index/group_id/favicon.ico', '1', 'admin', '2130706433', '1522037123');
INSERT INTO `t_admin_log` VALUES ('489', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522037142');
INSERT INTO `t_admin_log` VALUES ('490', 'admin', 'Member', 'index', '?/admin/Member/index&page=2', '1', 'admin', '2130706433', '1522037147');
INSERT INTO `t_admin_log` VALUES ('491', 'admin', 'Member', 'index', '?/admin/Member/index&page=4', '1', 'admin', '2130706433', '1522037148');
INSERT INTO `t_admin_log` VALUES ('492', 'admin', 'Member', 'index', '?/admin/Member/index&page=2', '1', 'admin', '2130706433', '1522037149');
INSERT INTO `t_admin_log` VALUES ('493', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522037150');
INSERT INTO `t_admin_log` VALUES ('494', 'admin', 'Index', 'favicon.ico', '?/admin/index/favicon.ico', '1', 'admin', '2130706433', '1522040294');
INSERT INTO `t_admin_log` VALUES ('495', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522042984');
INSERT INTO `t_admin_log` VALUES ('496', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522044778');
INSERT INTO `t_admin_log` VALUES ('497', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522045230');
INSERT INTO `t_admin_log` VALUES ('498', 'admin', 'Member', 'favicon.ico', '?/admin/Member/favicon.ico', '1', 'admin', '2130706433', '1522045230');
INSERT INTO `t_admin_log` VALUES ('499', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522045256');
INSERT INTO `t_admin_log` VALUES ('500', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522045291');
INSERT INTO `t_admin_log` VALUES ('501', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522045303');
INSERT INTO `t_admin_log` VALUES ('502', 'admin', 'Member', 'index', '?/admin/Member/index&page=14', '1', 'admin', '2130706433', '1522045306');
INSERT INTO `t_admin_log` VALUES ('503', 'admin', 'Member', 'index', '?/admin/Member/index&page=14', '1', 'admin', '2130706433', '1522046685');
INSERT INTO `t_admin_log` VALUES ('504', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522046687');
INSERT INTO `t_admin_log` VALUES ('505', 'admin', 'Member', 'index', '?/admin/Member/index&page=3', '1', 'admin', '2130706433', '1522046689');
INSERT INTO `t_admin_log` VALUES ('506', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522046691');
INSERT INTO `t_admin_log` VALUES ('507', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522046725');
INSERT INTO `t_admin_log` VALUES ('508', 'admin', 'Member', 'index', '?/admin/Member/index&page=3', '1', 'admin', '2130706433', '1522046729');
INSERT INTO `t_admin_log` VALUES ('509', 'admin', 'Member', 'index', '?/admin/Member/index&page=2', '1', 'admin', '2130706433', '1522046730');
INSERT INTO `t_admin_log` VALUES ('510', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522046731');
INSERT INTO `t_admin_log` VALUES ('511', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522046752');
INSERT INTO `t_admin_log` VALUES ('512', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522046808');
INSERT INTO `t_admin_log` VALUES ('513', 'admin', 'Member', 'index', '?/admin/Member/index&page=2', '1', 'admin', '2130706433', '1522046815');
INSERT INTO `t_admin_log` VALUES ('514', 'admin', 'Member', 'index', '?/admin/Member/index&page=3', '1', 'admin', '2130706433', '1522046815');
INSERT INTO `t_admin_log` VALUES ('515', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522046817');
INSERT INTO `t_admin_log` VALUES ('516', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522046951');
INSERT INTO `t_admin_log` VALUES ('517', 'admin', 'Member', 'info', '?/admin/Member/info', '1', 'admin', '2130706433', '1522046952');
INSERT INTO `t_admin_log` VALUES ('518', 'admin', 'Member', 'info', '?/admin/Member/info', '1', 'admin', '2130706433', '1522047100');
INSERT INTO `t_admin_log` VALUES ('519', 'admin', 'Member', 'info', '?/admin/Member/info', '1', 'admin', '2130706433', '1522047200');
INSERT INTO `t_admin_log` VALUES ('520', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522047219');
INSERT INTO `t_admin_log` VALUES ('521', 'admin', 'Member', 'info', '?/admin/Member/info', '1', 'admin', '2130706433', '1522047280');
INSERT INTO `t_admin_log` VALUES ('522', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522048473');
INSERT INTO `t_admin_log` VALUES ('523', 'admin', 'Menu', 'favicon.ico', '?/admin/Menu/favicon.ico', '1', 'admin', '2130706433', '1522048482');
INSERT INTO `t_admin_log` VALUES ('524', 'admin', 'Menu', 'info', '?/admin/menu/info/id/24.html', '1', 'admin', '2130706433', '1522048485');
INSERT INTO `t_admin_log` VALUES ('525', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1522048485');
INSERT INTO `t_admin_log` VALUES ('526', 'admin', 'Menu', 'info', '?/admin/menu/info/id/22.html', '1', 'admin', '2130706433', '1522048494');
INSERT INTO `t_admin_log` VALUES ('527', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1522048494');
INSERT INTO `t_admin_log` VALUES ('528', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522048521');
INSERT INTO `t_admin_log` VALUES ('529', 'admin', 'Menu', 'info', '?/admin/menu/info/id/24.html', '1', 'admin', '2130706433', '1522048528');
INSERT INTO `t_admin_log` VALUES ('530', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1522048528');
INSERT INTO `t_admin_log` VALUES ('531', 'admin', 'Menu', 'edit', '?/admin/menu/edit.html', '1', 'admin', '2130706433', '1522048536');
INSERT INTO `t_admin_log` VALUES ('532', 'admin', 'Menu', 'favicon.ico', '?/admin/menu/favicon.ico', '1', 'admin', '2130706433', '1522048537');
INSERT INTO `t_admin_log` VALUES ('533', 'admin', 'Menu', 'info', '?/admin/Menu/info', '1', 'admin', '2130706433', '1522048550');
INSERT INTO `t_admin_log` VALUES ('534', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1522048597');
INSERT INTO `t_admin_log` VALUES ('535', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522048600');
INSERT INTO `t_admin_log` VALUES ('536', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/30.html', '1', 'admin', '2130706433', '1522048608');
INSERT INTO `t_admin_log` VALUES ('537', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1522048608');
INSERT INTO `t_admin_log` VALUES ('538', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1522048699');
INSERT INTO `t_admin_log` VALUES ('539', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/30.html', '1', 'admin', '2130706433', '1522048706');
INSERT INTO `t_admin_log` VALUES ('540', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1522048706');
INSERT INTO `t_admin_log` VALUES ('541', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1522048747');
INSERT INTO `t_admin_log` VALUES ('542', 'admin', 'Menu', 'info', '?/admin/menu/info', '1', 'admin', '2130706433', '1522048783');
INSERT INTO `t_admin_log` VALUES ('543', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1522048824');
INSERT INTO `t_admin_log` VALUES ('544', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522048827');
INSERT INTO `t_admin_log` VALUES ('545', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522048828');
INSERT INTO `t_admin_log` VALUES ('546', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522048830');
INSERT INTO `t_admin_log` VALUES ('547', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/30.html', '1', 'admin', '2130706433', '1522049504');
INSERT INTO `t_admin_log` VALUES ('548', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1522049504');
INSERT INTO `t_admin_log` VALUES ('549', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1522049532');
INSERT INTO `t_admin_log` VALUES ('550', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/30.html', '1', 'admin', '2130706433', '1522049539');
INSERT INTO `t_admin_log` VALUES ('551', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1522049539');
INSERT INTO `t_admin_log` VALUES ('552', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1522049576');
INSERT INTO `t_admin_log` VALUES ('553', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/30.html', '1', 'admin', '2130706433', '1522049583');
INSERT INTO `t_admin_log` VALUES ('554', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1522049583');
INSERT INTO `t_admin_log` VALUES ('555', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1522049605');
INSERT INTO `t_admin_log` VALUES ('556', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/30.html', '1', 'admin', '2130706433', '1522049611');
INSERT INTO `t_admin_log` VALUES ('557', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1522049611');
INSERT INTO `t_admin_log` VALUES ('558', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1522049629');
INSERT INTO `t_admin_log` VALUES ('559', 'admin', 'Menu', 'info', '?/admin/menu/info', '1', 'admin', '2130706433', '1522049641');
INSERT INTO `t_admin_log` VALUES ('560', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1522049673');
INSERT INTO `t_admin_log` VALUES ('561', 'admin', 'Menu', 'info', '?/admin/menu/info/id/24.html', '1', 'admin', '2130706433', '1522049688');
INSERT INTO `t_admin_log` VALUES ('562', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1522049689');
INSERT INTO `t_admin_log` VALUES ('563', 'admin', 'Menu', 'edit', '?/admin/menu/edit.html', '1', 'admin', '2130706433', '1522049692');
INSERT INTO `t_admin_log` VALUES ('564', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522049809');
INSERT INTO `t_admin_log` VALUES ('565', 'admin', 'Menu', 'info', '?/admin/menu/info/id/27.html', '1', 'admin', '2130706433', '1522049829');
INSERT INTO `t_admin_log` VALUES ('566', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1522049830');
INSERT INTO `t_admin_log` VALUES ('567', 'admin', 'Menu', 'edit', '?/admin/menu/edit.html', '1', 'admin', '2130706433', '1522049841');
INSERT INTO `t_admin_log` VALUES ('568', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/24.html', '1', 'admin', '2130706433', '1522049849');
INSERT INTO `t_admin_log` VALUES ('569', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1522049849');
INSERT INTO `t_admin_log` VALUES ('570', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1522049884');
INSERT INTO `t_admin_log` VALUES ('571', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/24.html', '1', 'admin', '2130706433', '1522049922');
INSERT INTO `t_admin_log` VALUES ('572', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1522049923');
INSERT INTO `t_admin_log` VALUES ('573', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1522049970');
INSERT INTO `t_admin_log` VALUES ('574', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522049986');
INSERT INTO `t_admin_log` VALUES ('575', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522050034');
INSERT INTO `t_admin_log` VALUES ('576', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522050106');
INSERT INTO `t_admin_log` VALUES ('577', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522050123');
INSERT INTO `t_admin_log` VALUES ('578', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522050131');
INSERT INTO `t_admin_log` VALUES ('579', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522050153');
INSERT INTO `t_admin_log` VALUES ('580', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522050159');
INSERT INTO `t_admin_log` VALUES ('581', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522050194');
INSERT INTO `t_admin_log` VALUES ('582', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522050365');
INSERT INTO `t_admin_log` VALUES ('583', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522050954');
INSERT INTO `t_admin_log` VALUES ('584', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055387');
INSERT INTO `t_admin_log` VALUES ('585', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055481');
INSERT INTO `t_admin_log` VALUES ('586', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055508');
INSERT INTO `t_admin_log` VALUES ('587', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055597');
INSERT INTO `t_admin_log` VALUES ('588', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055632');
INSERT INTO `t_admin_log` VALUES ('589', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055662');
INSERT INTO `t_admin_log` VALUES ('590', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055719');
INSERT INTO `t_admin_log` VALUES ('591', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055721');
INSERT INTO `t_admin_log` VALUES ('592', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055724');
INSERT INTO `t_admin_log` VALUES ('593', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055725');
INSERT INTO `t_admin_log` VALUES ('594', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055726');
INSERT INTO `t_admin_log` VALUES ('595', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055727');
INSERT INTO `t_admin_log` VALUES ('596', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055737');
INSERT INTO `t_admin_log` VALUES ('597', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055743');
INSERT INTO `t_admin_log` VALUES ('598', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055762');
INSERT INTO `t_admin_log` VALUES ('599', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055768');
INSERT INTO `t_admin_log` VALUES ('600', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055820');
INSERT INTO `t_admin_log` VALUES ('601', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055841');
INSERT INTO `t_admin_log` VALUES ('602', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055869');
INSERT INTO `t_admin_log` VALUES ('603', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055900');
INSERT INTO `t_admin_log` VALUES ('604', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055925');
INSERT INTO `t_admin_log` VALUES ('605', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055932');
INSERT INTO `t_admin_log` VALUES ('606', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055937');
INSERT INTO `t_admin_log` VALUES ('607', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522055961');
INSERT INTO `t_admin_log` VALUES ('608', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522056019');
INSERT INTO `t_admin_log` VALUES ('609', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522056025');
INSERT INTO `t_admin_log` VALUES ('610', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522056082');
INSERT INTO `t_admin_log` VALUES ('611', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522056175');
INSERT INTO `t_admin_log` VALUES ('612', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522056194');
INSERT INTO `t_admin_log` VALUES ('613', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522056201');
INSERT INTO `t_admin_log` VALUES ('614', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522056224');
INSERT INTO `t_admin_log` VALUES ('615', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522056254');
INSERT INTO `t_admin_log` VALUES ('616', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522056982');
INSERT INTO `t_admin_log` VALUES ('617', 'admin', 'Member', 'excleexport', '?/admin/Member/excleExport', '1', 'admin', '2130706433', '1522056983');
INSERT INTO `t_admin_log` VALUES ('618', 'admin', 'Member', 'excleexport', '?/admin/Member/excleExport', '1', 'admin', '2130706433', '1522057015');
INSERT INTO `t_admin_log` VALUES ('619', 'admin', 'Member', 'excleexport', '?/admin/Member/excleExport', '1', 'admin', '2130706433', '1522057037');
INSERT INTO `t_admin_log` VALUES ('620', 'admin', 'Member', 'index', '?/admin/Member/', '1', 'admin', '2130706433', '1522057047');
INSERT INTO `t_admin_log` VALUES ('621', 'admin', 'Member', 'excleexport', '?/admin/Member/excleExport', '1', 'admin', '2130706433', '1522057049');

-- ----------------------------
-- Table structure for t_authorize
-- ----------------------------
DROP TABLE IF EXISTS `t_authorize`;
CREATE TABLE `t_authorize` (
  `Id` longtext,
  `RoleId` longtext,
  `MenuActionId` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_authorize
-- ----------------------------

-- ----------------------------
-- Table structure for t_balance
-- ----------------------------
DROP TABLE IF EXISTS `t_balance`;
CREATE TABLE `t_balance` (
  `Id` longtext,
  `Type` int(11) DEFAULT NULL,
  `Issue` int(11) DEFAULT NULL,
  `MinDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MaxDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `CreateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Status` int(11) DEFAULT NULL,
  `LastRunDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Archived` tinyint(4) DEFAULT NULL,
  `TimeStamp` tinyblob
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_balance
-- ----------------------------

-- ----------------------------
-- Table structure for t_cash
-- ----------------------------
DROP TABLE IF EXISTS `t_cash`;
CREATE TABLE `t_cash` (
  `Id` longtext,
  `UserId` longtext,
  `UserCode` varchar(50) DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CheckedDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UserBankAccount` varchar(200) DEFAULT NULL,
  `RealCurrencyId` int(11) DEFAULT NULL,
  `RealAmount` double DEFAULT NULL,
  `BLText` varchar(50) DEFAULT NULL,
  `CurrencyId` int(11) DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `ServiceFee` double DEFAULT NULL,
  `Status` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cash
-- ----------------------------

-- ----------------------------
-- Table structure for t_cashxlbirecord
-- ----------------------------
DROP TABLE IF EXISTS `t_cashxlbirecord`;
CREATE TABLE `t_cashxlbirecord` (
  `Id` longtext,
  `UserId` longtext,
  `UserCode` longtext,
  `Amount` double DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `JieKouId` longtext,
  `WalletAddress` longtext,
  `UserWalletAddress` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cashxlbirecord
-- ----------------------------

-- ----------------------------
-- Table structure for t_changelevel
-- ----------------------------
DROP TABLE IF EXISTS `t_changelevel`;
CREATE TABLE `t_changelevel` (
  `Id` longtext,
  `UserId` longtext,
  `UserCode` varchar(50) DEFAULT NULL,
  `BeforeLevelId` int(11) DEFAULT NULL,
  `AfterLevelId` int(11) DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CheckedDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Status` int(11) DEFAULT NULL,
  `CurrencyId` int(11) DEFAULT NULL,
  `Koukuan` double DEFAULT NULL,
  `Pv` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_changelevel
-- ----------------------------

-- ----------------------------
-- Table structure for t_charge
-- ----------------------------
DROP TABLE IF EXISTS `t_charge`;
CREATE TABLE `t_charge` (
  `Id` longtext,
  `UserId` longtext,
  `UserCode` varchar(50) DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CurrencyId` int(11) DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `CheckedDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Status` int(11) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_charge
-- ----------------------------

-- ----------------------------
-- Table structure for t_config
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `k` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `v` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_config
-- ----------------------------

-- ----------------------------
-- Table structure for t_currencychange
-- ----------------------------
DROP TABLE IF EXISTS `t_currencychange`;
CREATE TABLE `t_currencychange` (
  `Id` longtext,
  `UserId` longtext,
  `UserCode` varchar(50) DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FromCurrencyId` int(11) DEFAULT NULL,
  `ToCurrencyId` int(11) DEFAULT NULL,
  `BLText` varchar(50) DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `NLTotal` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_currencychange
-- ----------------------------

-- ----------------------------
-- Table structure for t_deliveryaddress
-- ----------------------------
DROP TABLE IF EXISTS `t_deliveryaddress`;
CREATE TABLE `t_deliveryaddress` (
  `Id` longtext,
  `UserId` longtext,
  `Address` longtext,
  `Mobile` varchar(200) DEFAULT NULL,
  `Recipient` varchar(200) DEFAULT NULL,
  `ZipCode` varchar(200) DEFAULT NULL,
  `IsDefault` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_deliveryaddress
-- ----------------------------

-- ----------------------------
-- Table structure for t_duipenggrade
-- ----------------------------
DROP TABLE IF EXISTS `t_duipenggrade`;
CREATE TABLE `t_duipenggrade` (
  `Id` longtext,
  `UserId` longtext,
  `UserCode` longtext,
  `BalanceId` longtext,
  `LeftAdd` double DEFAULT NULL,
  `RightAdd` double DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `LeftRest` double DEFAULT NULL,
  `RightRest` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_duipenggrade
-- ----------------------------

-- ----------------------------
-- Table structure for t_financialdetail
-- ----------------------------
DROP TABLE IF EXISTS `t_financialdetail`;
CREATE TABLE `t_financialdetail` (
  `Id` longtext,
  `UserId` longtext,
  `UserCode` longtext,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FinancialId` int(11) DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `BeforeWalletAmount` double DEFAULT NULL,
  `AfterWalletAmount` double DEFAULT NULL,
  `CurrencyId` int(11) DEFAULT NULL,
  `Description` longtext,
  `IsCompanyIncome` tinyint(4) DEFAULT NULL,
  `EventCid` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_financialdetail
-- ----------------------------

-- ----------------------------
-- Table structure for t_financialsummary
-- ----------------------------
DROP TABLE IF EXISTS `t_financialsummary`;
CREATE TABLE `t_financialsummary` (
  `UserId` longtext,
  `UserCode` varchar(50) DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Field_1` double DEFAULT NULL,
  `Field_2` double DEFAULT NULL,
  `Field_3` double DEFAULT NULL,
  `Field_4` double DEFAULT NULL,
  `Field_5` double DEFAULT NULL,
  `Field_6` double DEFAULT NULL,
  `Field_7` double DEFAULT NULL,
  `Field_8` double DEFAULT NULL,
  `Field_9` double DEFAULT NULL,
  `Field_10` double DEFAULT NULL,
  `Field_11` double DEFAULT NULL,
  `Field_12` double DEFAULT NULL,
  `Field_13` double DEFAULT NULL,
  `Field_14` double DEFAULT NULL,
  `Field_15` double DEFAULT NULL,
  `Field_16` double DEFAULT NULL,
  `Field_17` double DEFAULT NULL,
  `Field_18` double DEFAULT NULL,
  `Field_19` double DEFAULT NULL,
  `Field_20` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_financialsummary
-- ----------------------------

-- ----------------------------
-- Table structure for t_gradedetail
-- ----------------------------
DROP TABLE IF EXISTS `t_gradedetail`;
CREATE TABLE `t_gradedetail` (
  `Id` longtext,
  `UserId` longtext,
  `Amount` double DEFAULT NULL,
  `Type` int(11) DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gradedetail
-- ----------------------------

-- ----------------------------
-- Table structure for t_language
-- ----------------------------
DROP TABLE IF EXISTS `t_language`;
CREATE TABLE `t_language` (
  `Id` longtext,
  `Name` varchar(50) DEFAULT NULL,
  `Culture` varchar(50) DEFAULT NULL,
  `Enable` tinyint(4) DEFAULT NULL,
  `SequenceNum` int(11) DEFAULT NULL,
  `BDCulture` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_language
-- ----------------------------

-- ----------------------------
-- Table structure for t_localestringresource
-- ----------------------------
DROP TABLE IF EXISTS `t_localestringresource`;
CREATE TABLE `t_localestringresource` (
  `Id` longtext,
  `LanguageId` longtext,
  `ResourceName` varchar(50) DEFAULT NULL,
  `ResourceValue` longtext,
  `LastModifyDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_localestringresource
-- ----------------------------

-- ----------------------------
-- Table structure for t_logistics
-- ----------------------------
DROP TABLE IF EXISTS `t_logistics`;
CREATE TABLE `t_logistics` (
  `Id` longtext,
  `Name` varchar(200) DEFAULT NULL,
  `Tel` varchar(200) DEFAULT NULL,
  `Contacter` varchar(200) DEFAULT NULL,
  `Url` varchar(255) DEFAULT NULL,
  `IsDeleted` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_logistics
-- ----------------------------

-- ----------------------------
-- Table structure for t_mallrecharge
-- ----------------------------
DROP TABLE IF EXISTS `t_mallrecharge`;
CREATE TABLE `t_mallrecharge` (
  `Id` longtext,
  `UserId` longtext,
  `UserCode` longtext,
  `Amount` double DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MalluserCode` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mallrecharge
-- ----------------------------

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `MenuName` varchar(50) DEFAULT NULL,
  `MenuUrl` varchar(255) DEFAULT NULL,
  `ParentId` smallint(6) DEFAULT NULL,
  `MenuIcon` varchar(50) DEFAULT NULL,
  `MenuTypeId` longtext,
  `MenuSequenceNum` int(11) DEFAULT NULL,
  `C` varchar(20) DEFAULT NULL,
  `A` varchar(20) DEFAULT NULL,
  `Data` varchar(50) DEFAULT NULL,
  `Tip` varchar(255) DEFAULT NULL,
  `Group` varchar(50) DEFAULT NULL,
  `ListOrder` smallint(6) NOT NULL DEFAULT '999',
  `Display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示(1:显示,2:不显示)',
  `UpdateTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', '管理设置', '', '0', 'fa-users', null, null, 'Admin', 'admin', null, null, null, '1', '1', '1521903016');
INSERT INTO `t_menu` VALUES ('2', '管理员管理', null, '1', null, null, null, 'Admin', 'index', null, null, null, '0', '1', '1521903016');
INSERT INTO `t_menu` VALUES ('3', '详情', null, '2', null, null, null, 'Admin', 'info', null, null, null, '0', '2', '1521903016');
INSERT INTO `t_menu` VALUES ('4', '添加', null, '2', null, null, null, 'Admin', 'add', null, null, null, '0', '2', '1521903016');
INSERT INTO `t_menu` VALUES ('5', '修改', null, '2', null, null, null, 'Admin', 'edit', null, null, null, '0', '2', '1521903016');
INSERT INTO `t_menu` VALUES ('6', '删除', null, '2', null, null, null, 'Admin', 'del', null, null, null, '0', '2', '1521903016');
INSERT INTO `t_menu` VALUES ('7', '分组管理', null, '1', null, null, null, 'Group', 'index', null, null, null, '0', '1', '1521903016');
INSERT INTO `t_menu` VALUES ('8', '详情', null, '7', null, null, null, 'Group', 'info', null, null, null, '0', '2', '1521903016');
INSERT INTO `t_menu` VALUES ('9', '添加', null, '7', null, null, null, 'Group', 'add', null, null, null, '0', '2', '1521903016');
INSERT INTO `t_menu` VALUES ('10', '修改', null, '7', null, null, null, 'Group', 'edit', null, null, null, '0', '2', '1521903016');
INSERT INTO `t_menu` VALUES ('11', '删除', null, '7', null, null, null, 'Group', 'del', null, null, null, '0', '2', '1521903016');
INSERT INTO `t_menu` VALUES ('12', '菜单管理', null, '18', null, null, null, 'Menu', 'index', null, null, null, '0', '1', '1521903016');
INSERT INTO `t_menu` VALUES ('13', '查看', null, '12', null, null, null, 'Menu', 'info', null, null, null, '0', '2', '1521903016');
INSERT INTO `t_menu` VALUES ('14', '添加', null, '12', null, null, null, 'Menu', 'add', null, null, null, '0', '2', '1521903016');
INSERT INTO `t_menu` VALUES ('15', '修改', null, '12', null, null, null, 'Menu', 'edit', null, null, null, '0', '2', '1521903016');
INSERT INTO `t_menu` VALUES ('16', '删除', null, '12', null, null, null, 'Menu', 'del', null, null, null, '0', '2', '1521903016');
INSERT INTO `t_menu` VALUES ('18', '系统设置', null, '0', 'fa-cogs', null, null, 'Menu', 'index', null, null, null, '2', '1', '1521903016');
INSERT INTO `t_menu` VALUES ('19', '权限设置', null, '2', null, null, null, 'Group', 'rule', null, null, null, '999', '2', '1521903016');
INSERT INTO `t_menu` VALUES ('20', '个人设置', null, '1', null, null, null, 'Admin', 'public_edit_info', null, null, null, '999', '1', '1521903016');
INSERT INTO `t_menu` VALUES ('21', '日志管理', null, '18', null, null, null, 'Log', 'index', null, null, null, '999', '1', '1521903016');
INSERT INTO `t_menu` VALUES ('22', '系统首页', null, '0', 'fa-bank', null, null, 'Index', 'index', null, null, null, '0', '1', '1521903016');
INSERT INTO `t_menu` VALUES ('24', '会员管理', null, '0', '', null, null, 'Member', 'index', '', null, null, '2', '1', '1522049692');
INSERT INTO `t_menu` VALUES ('27', '会员列表', null, '24', '', null, null, 'Member', 'index', '', null, null, '999', '1', '1522049841');
INSERT INTO `t_menu` VALUES ('39', '注册会员', null, '24', '', null, null, 'Member', 'register', '', null, null, '999', '1', null);
INSERT INTO `t_menu` VALUES ('30', '财务管理', null, '0', '', null, null, 'Current', '', '', null, null, '999', '1', null);
INSERT INTO `t_menu` VALUES ('31', '手工充值扣款', null, '30', '', null, null, 'Current', 'operation', '', null, null, '999', '1', null);
INSERT INTO `t_menu` VALUES ('32', '货币管理', null, '30', '', null, null, 'Current', 'manager', '', null, null, '999', '1', null);
INSERT INTO `t_menu` VALUES ('33', '奖金管理', null, '0', '', null, null, 'bonus', '', '', null, null, '999', '1', null);
INSERT INTO `t_menu` VALUES ('34', '离线发送', null, '30', '', null, null, 'Current', 'send', '', null, null, '999', '1', null);
INSERT INTO `t_menu` VALUES ('35', '货币兑换', null, '30', '', null, null, 'Current', 'exchanage', '', null, null, '999', '1', null);
INSERT INTO `t_menu` VALUES ('36', '财务明细', null, '30', '', null, null, 'Current', 'info', '', null, null, '999', '1', null);
INSERT INTO `t_menu` VALUES ('37', '财务报表', null, '30', '', null, null, 'Current', 'table', '', null, null, '999', '1', null);
INSERT INTO `t_menu` VALUES ('38', '公告管理', null, '0', '', null, null, 'Notice', '', '', null, null, '999', '1', null);
INSERT INTO `t_menu` VALUES ('40', '待激活会员', null, '24', '', null, null, 'Member', 'activation', '', null, null, '999', '1', null);

-- ----------------------------
-- Table structure for t_menuaction
-- ----------------------------
DROP TABLE IF EXISTS `t_menuaction`;
CREATE TABLE `t_menuaction` (
  `Id` longtext,
  `MenuId` longtext,
  `MenuActionName` varchar(50) DEFAULT NULL,
  `MenuActionCode` varchar(255) DEFAULT NULL,
  `T_Role_Id` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menuaction
-- ----------------------------

-- ----------------------------
-- Table structure for t_menutype
-- ----------------------------
DROP TABLE IF EXISTS `t_menutype`;
CREATE TABLE `t_menutype` (
  `Id` longtext,
  `MenuTypeName` varchar(50) DEFAULT NULL,
  `MenuTypeSequenceNum` int(11) DEFAULT NULL,
  `IsSystem` tinyint(4) DEFAULT NULL,
  `IsLock` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menutype
-- ----------------------------

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `Id` longtext,
  `MainTitle` varchar(200) DEFAULT NULL,
  `SubTitle` varchar(200) DEFAULT NULL,
  `SenderId` longtext,
  `SenderDisplayName` varchar(50) DEFAULT NULL,
  `ReceiverId` longtext,
  `ReceiverDisplayName` varchar(200) DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModifyDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `IsRead` tinyint(4) DEFAULT NULL,
  `LastModifyMemberId` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_message
-- ----------------------------

-- ----------------------------
-- Table structure for t_messagebody
-- ----------------------------
DROP TABLE IF EXISTS `t_messagebody`;
CREATE TABLE `t_messagebody` (
  `Id` longtext,
  `MessageId` longtext,
  `Content` longtext,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MemberType` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_messagebody
-- ----------------------------

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `Id` longtext,
  `Title` varchar(200) DEFAULT NULL,
  `Content` longtext,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModifyDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Type` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------

-- ----------------------------
-- Table structure for t_obtainxiliangbi
-- ----------------------------
DROP TABLE IF EXISTS `t_obtainxiliangbi`;
CREATE TABLE `t_obtainxiliangbi` (
  `Id` longtext,
  `Amount` double DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TXId` longtext,
  `UserId` longtext,
  `UserCode` longtext,
  `address` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_obtainxiliangbi
-- ----------------------------

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `Id` longtext,
  `SerialNumber` bigint(20) DEFAULT NULL,
  `UserId` longtext,
  `UserCode` varchar(50) DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `ZheKou` double DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DeliveryAddress` varchar(255) DEFAULT NULL,
  `LogisticsId` longtext,
  `TrackingNO` longtext,
  `Status` int(11) DEFAULT NULL,
  `Type` int(11) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `t_orderdetail`;
CREATE TABLE `t_orderdetail` (
  `Id` longtext,
  `OrderId` longtext,
  `Product` varchar(255) DEFAULT NULL,
  `Count` int(11) DEFAULT NULL,
  `Price` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderdetail
-- ----------------------------

-- ----------------------------
-- Table structure for t_pcc
-- ----------------------------
DROP TABLE IF EXISTS `t_pcc`;
CREATE TABLE `t_pcc` (
  `Id` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pcc
-- ----------------------------

-- ----------------------------
-- Table structure for t_prizedetail
-- ----------------------------
DROP TABLE IF EXISTS `t_prizedetail`;
CREATE TABLE `t_prizedetail` (
  `Id` longtext,
  `BalanceId` longtext,
  `UserId` longtext,
  `UserCode` varchar(50) DEFAULT NULL,
  `Field` varchar(50) DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Currency_1` double DEFAULT NULL,
  `Currency_2` double DEFAULT NULL,
  `Currency_3` double DEFAULT NULL,
  `Currency_4` double DEFAULT NULL,
  `Currency_5` double DEFAULT NULL,
  `Currency_6` double DEFAULT NULL,
  `Currency_7` double DEFAULT NULL,
  `Currency_8` double DEFAULT NULL,
  `Currency_9` double DEFAULT NULL,
  `Currency_10` double DEFAULT NULL,
  `Item_1` double DEFAULT NULL,
  `Item_2` double DEFAULT NULL,
  `Item_3` double DEFAULT NULL,
  `Item_4` double DEFAULT NULL,
  `Item_5` double DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_prizedetail
-- ----------------------------

-- ----------------------------
-- Table structure for t_prizesummary
-- ----------------------------
DROP TABLE IF EXISTS `t_prizesummary`;
CREATE TABLE `t_prizesummary` (
  `UserId` longtext,
  `UserCode` varchar(50) DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Field_1` double DEFAULT NULL,
  `Field_2` double DEFAULT NULL,
  `Field_3` double DEFAULT NULL,
  `Field_4` double DEFAULT NULL,
  `Field_5` double DEFAULT NULL,
  `Field_6` double DEFAULT NULL,
  `Field_7` double DEFAULT NULL,
  `Field_8` double DEFAULT NULL,
  `Field_9` double DEFAULT NULL,
  `Field_10` double DEFAULT NULL,
  `Field_11` double DEFAULT NULL,
  `Field_12` double DEFAULT NULL,
  `Field_13` double DEFAULT NULL,
  `Field_14` double DEFAULT NULL,
  `Field_15` double DEFAULT NULL,
  `Currency_1` double DEFAULT NULL,
  `Currency_2` double DEFAULT NULL,
  `Currency_3` double DEFAULT NULL,
  `Currency_4` double DEFAULT NULL,
  `Currency_5` double DEFAULT NULL,
  `Currency_6` double DEFAULT NULL,
  `Currency_7` double DEFAULT NULL,
  `Currency_8` double DEFAULT NULL,
  `Currency_9` double DEFAULT NULL,
  `Currency_10` double DEFAULT NULL,
  `Item_1` double DEFAULT NULL,
  `Item_2` double DEFAULT NULL,
  `Item_3` double DEFAULT NULL,
  `Item_4` double DEFAULT NULL,
  `Item_5` double DEFAULT NULL,
  `Total` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_prizesummary
-- ----------------------------

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `Id` longtext,
  `ProductCode` varchar(200) DEFAULT NULL,
  `ProductName` varchar(200) DEFAULT NULL,
  `ProductTypeId` longtext,
  `Price` double DEFAULT NULL,
  `GuiGe` varchar(200) DEFAULT NULL,
  `Description` longtext,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModifyDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ImageUrl` varchar(200) DEFAULT NULL,
  `IsDeleted` tinyint(4) DEFAULT NULL,
  `IsLock` tinyint(4) DEFAULT NULL,
  `EnableRegister` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------

-- ----------------------------
-- Table structure for t_producttype
-- ----------------------------
DROP TABLE IF EXISTS `t_producttype`;
CREATE TABLE `t_producttype` (
  `Id` longtext,
  `Name` varchar(255) DEFAULT NULL,
  `SequenceNum` int(11) DEFAULT NULL,
  `ParentId` longtext,
  `Level` int(11) DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LeftValue` int(11) DEFAULT NULL,
  `RightValue` int(11) DEFAULT NULL,
  `GroupId` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_producttype
-- ----------------------------

-- ----------------------------
-- Table structure for t_remittance
-- ----------------------------
DROP TABLE IF EXISTS `t_remittance`;
CREATE TABLE `t_remittance` (
  `Id` longtext,
  `UserId` longtext,
  `UserCode` varchar(50) DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `RealCurrencyId` int(11) DEFAULT NULL,
  `RealAmount` double DEFAULT NULL,
  `BLText` varchar(50) DEFAULT NULL,
  `CurrencyId` int(11) DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `CheckedDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SysBankAccount` varchar(200) DEFAULT NULL,
  `PostBankAccount` varchar(200) DEFAULT NULL,
  `PostDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_remittance
-- ----------------------------

-- ----------------------------
-- Table structure for t_reportcenterrecord
-- ----------------------------
DROP TABLE IF EXISTS `t_reportcenterrecord`;
CREATE TABLE `t_reportcenterrecord` (
  `Id` longtext,
  `UserId` longtext,
  `UserCode` varchar(50) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CheckDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ReportCenterLevelId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_reportcenterrecord
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `Id` longtext,
  `RoleName` varchar(50) DEFAULT NULL,
  `Description` longtext,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_screcharge
-- ----------------------------
DROP TABLE IF EXISTS `t_screcharge`;
CREATE TABLE `t_screcharge` (
  `Id` longtext,
  `UserId` longtext,
  `UserCode` longtext,
  `Amount` double DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MalluserCode` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_screcharge
-- ----------------------------

-- ----------------------------
-- Table structure for t_shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `t_shoppingcart`;
CREATE TABLE `t_shoppingcart` (
  `Id` longtext,
  `ProductId` longtext,
  `Count` int(11) DEFAULT NULL,
  `UserId` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shoppingcart
-- ----------------------------

-- ----------------------------
-- Table structure for t_smslist
-- ----------------------------
DROP TABLE IF EXISTS `t_smslist`;
CREATE TABLE `t_smslist` (
  `Id` longtext,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Content` longtext,
  `Mobile` longtext,
  `UserId` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_smslist
-- ----------------------------

-- ----------------------------
-- Table structure for t_sysbankaccount
-- ----------------------------
DROP TABLE IF EXISTS `t_sysbankaccount`;
CREATE TABLE `t_sysbankaccount` (
  `Id` longtext,
  `Bank` varchar(200) DEFAULT NULL,
  `CardCode` varchar(200) DEFAULT NULL,
  `CardUserName` varchar(200) DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sysbankaccount
-- ----------------------------

-- ----------------------------
-- Table structure for t_syslog
-- ----------------------------
DROP TABLE IF EXISTS `t_syslog`;
CREATE TABLE `t_syslog` (
  `Id` longtext,
  `MemberId` longtext,
  `MemberName` varchar(50) DEFAULT NULL,
  `ActionId` int(11) DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IP` varchar(50) DEFAULT NULL,
  `Description` longtext,
  `DisplayDescription` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_syslog
-- ----------------------------

-- ----------------------------
-- Table structure for t_tradelist
-- ----------------------------
DROP TABLE IF EXISTS `t_tradelist`;
CREATE TABLE `t_tradelist` (
  `Id` longtext,
  `UserId` longtext,
  `UserCode` longtext,
  `Type` int(11) DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `Rest` double DEFAULT NULL,
  `CurrencyId` int(11) DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TradeDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Status` int(11) DEFAULT NULL,
  `TimeStamp` tinyblob,
  `Price` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tradelist
-- ----------------------------

-- ----------------------------
-- Table structure for t_traderiserecord
-- ----------------------------
DROP TABLE IF EXISTS `t_traderiserecord`;
CREATE TABLE `t_traderiserecord` (
  `Id` longtext,
  `NewPrice` double DEFAULT NULL,
  `OldPrice` double DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_traderiserecord
-- ----------------------------

-- ----------------------------
-- Table structure for t_tradeuser
-- ----------------------------
DROP TABLE IF EXISTS `t_tradeuser`;
CREATE TABLE `t_tradeuser` (
  `Id` longtext,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `HuikuanDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ShoukuanDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Status` int(11) DEFAULT NULL,
  `LastStatus` int(11) DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `SerialNumber` bigint(20) DEFAULT NULL,
  `BuyId` longtext,
  `BuyUserId` longtext,
  `BuyUserCode` longtext,
  `ImgPath` longtext,
  `SellId` longtext,
  `SellUserId` longtext,
  `SellUserCode` longtext,
  `TimeStamp` tinyblob,
  `T_TradeList_Id` longtext,
  `T_TradeList_Id1` longtext,
  `DaKuanAmount` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tradeuser
-- ----------------------------

-- ----------------------------
-- Table structure for t_transfer
-- ----------------------------
DROP TABLE IF EXISTS `t_transfer`;
CREATE TABLE `t_transfer` (
  `Id` longtext,
  `FromUserId` longtext,
  `FromUserCode` varchar(50) DEFAULT NULL,
  `ToUserId` longtext,
  `ToUserCode` varchar(50) DEFAULT NULL,
  `CurrencyId` int(11) DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `ServiceFee` double DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `WalletAddress` varchar(50) DEFAULT NULL,
  `ToWalletAddress` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_transfer
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `UserCode` varchar(50) DEFAULT NULL,
  `NickName` varchar(50) DEFAULT NULL,
  `L1Pwd` longtext,
  `L2Pwd` longtext,
  `L3Pwd` longtext,
  `CurrentLevelId` int(11) DEFAULT NULL,
  `RegisterLevelId` int(11) DEFAULT NULL,
  `TJUserId` longtext,
  `TJUserCode` varchar(50) DEFAULT NULL,
  `TJUserNickName` varchar(50) DEFAULT NULL,
  `TJPosition` int(11) DEFAULT NULL,
  `TJLevel` int(11) DEFAULT NULL,
  `TJLeftValue` int(11) DEFAULT NULL,
  `TJRightValue` int(11) DEFAULT NULL,
  `JDUserId` longtext,
  `JDUserCode` varchar(50) DEFAULT NULL,
  `JDUserNickName` varchar(50) DEFAULT NULL,
  `JDPosition` int(11) DEFAULT NULL,
  `JDLevel` int(11) DEFAULT NULL,
  `JDLeftValue` int(11) DEFAULT NULL,
  `JDRightValue` int(11) DEFAULT NULL,
  `ReportCenterLevelId` int(11) DEFAULT NULL,
  `ReportCenterUserId` longtext,
  `ReportCenterUserCode` varchar(50) DEFAULT NULL,
  `ReportCenterNickName` varchar(50) DEFAULT NULL,
  `ProvinceId` int(11) DEFAULT NULL,
  `ProvinceName` varchar(50) DEFAULT NULL,
  `CityId` int(11) DEFAULT NULL,
  `CityName` varchar(50) DEFAULT NULL,
  `CountyId` int(11) DEFAULT NULL,
  `CountyName` varchar(50) DEFAULT NULL,
  `Investment` double DEFAULT NULL,
  `IsVirtual` tinyint(4) DEFAULT NULL,
  `RegisterMemberType` int(11) DEFAULT NULL,
  `RegisterMemberId` longtext,
  `RegisterDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `JiHuoMemberType` tinyint(1) DEFAULT '0',
  `JiHuoMemberId` longtext,
  `JiHuoDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `JiHuoKouKuanId` int(11) DEFAULT NULL,
  `IsValid` tinyint(4) DEFAULT '0' COMMENT '0未激活',
  `IsLock` tinyint(4) DEFAULT '0',
  `SecretSecurityId` int(11) DEFAULT NULL,
  `SecretSecurityMatchText` varchar(255) DEFAULT NULL,
  `TimeStamp` tinyblob,
  `ID_Number` varchar(50) DEFAULT NULL,
  `Mobile` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Isjiaoyi` tinyint(4) DEFAULT NULL,
  `WalletAddress` longtext NOT NULL,
  `Titleid` int(11) DEFAULT NULL,
  `isDOUT` tinyint(4) DEFAULT NULL,
  `ImageUrl` varchar(200) DEFAULT NULL,
  `WallImageUrl` varchar(200) DEFAULT NULL COMMENT '推荐码',
  `WallImageUrlapp` varchar(200) DEFAULT NULL,
  `TJtoken` varchar(8) NOT NULL,
  `IsFull` tinyint(1) NOT NULL DEFAULT '0',
  `Ranks` text,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '123', '123', '123', null, null, null, '1', '', null, null, null, null, '16', '17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-26 13:41:21', null, null, '0000-00-00 00:00:00', null, null, null, null, null, null, null, '15283827970', null, null, '', null, null, null, null, null, '123', '3', '0,2,3,11,14,16,17,18,19,20,23,24,26,27,28,29');
INSERT INTO `t_user` VALUES ('2', '3', '33', '44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-26 13:33:20', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, null, null, null, '', null, null, null, null, null, '', '3', '0,3,26');
INSERT INTO `t_user` VALUES ('3', '32', '42', '234', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 11:29:12', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, null, null, null, '', null, null, null, null, null, '', '3', null);
INSERT INTO `t_user` VALUES ('4', null, '123', '45431598ccd1e9cf2fc678d423b89c9e', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-26 13:41:21', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '', null, null, '', null, null, null, null, null, '633c6e6', '0', '0,11,14,16,17,18,19,20,23,24,26,27,28,29');
INSERT INTO `t_user` VALUES ('5', null, '', '3a9d933c8d8ab6338805d7f1d843cb89', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 12:01:41', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '', null, null, '', null, null, null, null, null, 'fc5f3e9', '0', null);
INSERT INTO `t_user` VALUES ('6', null, '', 'bb1224976d44d1db64d9b2a0db7991f1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-26 13:41:21', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '', null, null, '', null, null, null, null, null, '', '0', '0,11,14,16,17,18,19,20,23,24,26,27,28,29');
INSERT INTO `t_user` VALUES ('7', null, '', '2c777e5b6dfd2504b66fb77488e8ca70', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 12:02:57', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '', null, null, '', null, null, null, null, null, '48e0089c', '0', null);
INSERT INTO `t_user` VALUES ('8', null, '213', '3c15e4d9a10af58056c91af6d6433cb9', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 12:04:08', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '', null, null, '', null, null, null, null, null, 'bd9ccc0e', '0', null);
INSERT INTO `t_user` VALUES ('9', null, '2343', 'a886a6f93ce544ad6689e33fb576e47e', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 12:05:14', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '', null, null, '', null, null, null, null, null, '35d20189', '0', null);
INSERT INTO `t_user` VALUES ('11', null, '带我去', 'a829fbf65466441a0ab78d24cd947827', null, null, null, null, null, null, null, null, null, '18', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-26 13:41:21', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '', null, null, '', null, null, null, null, null, '3d46091', '0', '0,2,3,11,14,16,17,18,19,20,23,24,26,27,28,29');
INSERT INTO `t_user` VALUES ('12', null, '要的', 'd0fadd6d5559c85e2e368eb4ba88ab4a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 22:55:26', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '15283827971', null, null, '', null, null, null, null, null, '47058379', '0', '0');
INSERT INTO `t_user` VALUES ('13', null, '要的', 'f5860d7420c1968893391e450bd86a32', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 22:55:28', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '15283827971', null, null, '', null, null, null, null, null, 'b4752064', '0', '0');
INSERT INTO `t_user` VALUES ('14', null, '要的', '58f6969f979f1919ab12c17d9e8651de', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 22:55:30', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '15283827971', null, null, '', null, null, null, null, null, '938daa24', '0', '0');
INSERT INTO `t_user` VALUES ('15', null, '带我去分', '856dd2c9bcb118ef4b31fbd04338f1e0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 22:55:32', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '15283827971', null, null, '', null, null, null, null, null, 'f245df41', '0', '0');
INSERT INTO `t_user` VALUES ('16', null, 'ewfew', '8b1318d0f63162b6ed94c6bc23e416ce', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 22:55:34', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '15283827971', null, null, '', null, null, null, null, null, 'd2c0baa7', '0', '0');
INSERT INTO `t_user` VALUES ('17', null, '我确定', '7ab3aebd195c631d6d68c165b0894c56', null, null, null, null, null, null, null, null, null, '19', '20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-26 13:41:21', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '15283827971', null, null, '', null, null, null, null, null, '7f70e2be', '3', '0,19,20,23,24,26,27,28,29');
INSERT INTO `t_user` VALUES ('18', null, '微服务', 'a88b110ae47749c373f3f0b4c288f2c7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 22:55:38', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '15283827971', null, null, '', null, null, null, null, null, 'ebd5004a', '0', '0');
INSERT INTO `t_user` VALUES ('19', null, '啊', '0ea3bb52ae3ff75f5a70e614414b1738', null, null, null, '5', null, null, null, null, null, '23', '28', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-26 13:41:21', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '15283827971', null, null, '', null, null, null, null, null, 'e1bd8752', '3', '0,23,26,28,29');
INSERT INTO `t_user` VALUES ('20', null, '的', '60239b0d74aaef50dafe47354827cbfe', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 22:55:42', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '15283827971', null, null, '', null, null, null, null, null, '2c63214e', '0', '0');
INSERT INTO `t_user` VALUES ('21', null, '收到', 'bace5401a4ca10d53bd6b5a7b3a75ff1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 22:56:01', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '15283827970', null, null, '', null, null, null, null, null, 'e6ae13c6', '0', '0');
INSERT INTO `t_user` VALUES ('22', null, '打算', 'b1c539da656f93c112c5343ae6a3d74e', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 23:03:27', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '15283827970', null, null, '', null, null, null, null, null, 'd3494509', '0', '0');
INSERT INTO `t_user` VALUES ('23', null, 'ad打算', 'e4f978c1db70a224c27bfce6f4ea1d61', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '29', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-26 13:41:21', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '15283827970', null, null, '', null, null, null, null, null, '86af651a', '2', '0,29');
INSERT INTO `t_user` VALUES ('24', null, '较大', '0727459fcfd3a5d59d7c02ee17d88fb7', null, null, null, '1', '19', null, '啊', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-26 13:28:00', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '15283827970', null, null, '', null, null, null, null, null, '4cd61485', '0', '0');
INSERT INTO `t_user` VALUES ('26', null, '较大2', '1f73d42a1b4872d86abb56eaec8e3902', null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-26 13:33:20', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '15283827970', null, null, '', null, null, null, null, null, '39a9cc3a', '0', '0');
INSERT INTO `t_user` VALUES ('27', null, 'qw十大', 'a46d6372ec286b1957ccd0d32d90dcb7', null, null, null, '6', '19', null, '啊', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-26 13:37:30', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '15283827970', null, null, '', null, null, null, null, null, 'c0b7c83b', '0', '0');
INSERT INTO `t_user` VALUES ('28', null, '123wer', '6c76e95072a0031088efcfc6370a62b9', null, null, null, '6', '19', null, '啊', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-26 13:40:16', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '15283827970', null, null, '', null, null, null, null, null, '31712362', '0', '0');
INSERT INTO `t_user` VALUES ('29', null, 'sadas的', '7fdb5acc6d0b30408f426f540aca3e4e', null, null, null, '6', '19', null, '啊', null, null, null, null, '23', null, 'ad打算', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-26 13:41:21', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, '15283827970', null, null, '', null, null, null, null, null, '7d9adbbf', '0', '0');

-- ----------------------------
-- Table structure for t_userbankaccount
-- ----------------------------
DROP TABLE IF EXISTS `t_userbankaccount`;
CREATE TABLE `t_userbankaccount` (
  `Id` longtext,
  `UserId` longtext,
  `UserCode` longtext,
  `Bank` varchar(200) DEFAULT NULL,
  `CardCode` varchar(200) DEFAULT NULL,
  `CardUserName` varchar(200) DEFAULT NULL,
  `IsDefault` tinyint(4) DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userbankaccount
-- ----------------------------

-- ----------------------------
-- Table structure for t_wallet
-- ----------------------------
DROP TABLE IF EXISTS `t_wallet`;
CREATE TABLE `t_wallet` (
  `Id` longtext,
  `UserId` longtext,
  `CurrencyId` int(11) DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `Gas` double DEFAULT '0',
  `release` double DEFAULT '0',
  `TimeStamp` tinyblob
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wallet
-- ----------------------------

-- ----------------------------
-- Table structure for __migrationhistory
-- ----------------------------
DROP TABLE IF EXISTS `__migrationhistory`;
CREATE TABLE `__migrationhistory` (
  `MigrationId` varchar(150) DEFAULT NULL,
  `ContextKey` varchar(255) DEFAULT NULL,
  `Model` longblob,
  `ProductVersion` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __migrationhistory
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
