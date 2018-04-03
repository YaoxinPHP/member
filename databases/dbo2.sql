/*
Navicat MySQL Data Transfer

Source Server         : demo
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : mem

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-04-03 15:09:51
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', null, 'admin', '21232f297a57a5a743894a0e4a801fc3', null, '', null, '2130706433', '1522340653', '', '1521899271', '1');
INSERT INTO `t_admin` VALUES ('2', null, 'test', '202cb962ac59075b964b07152d234b70', null, null, null, null, null, '', '1521897319', '1');

-- ----------------------------
-- Table structure for t_adminrolelink
-- ----------------------------
DROP TABLE IF EXISTS `t_adminrolelink`;
CREATE TABLE `t_adminrolelink` (
  `Id` longtext,
  `AdminId` longtext,
  `RoleId` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=1257 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
INSERT INTO `t_admin_log` VALUES ('622', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522114053');
INSERT INTO `t_admin_log` VALUES ('623', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522114438');
INSERT INTO `t_admin_log` VALUES ('624', 'admin', 'Member', 'opreation', '?/admin/member/opreation/lock/29.html', '1', 'admin', '2130706433', '1522114441');
INSERT INTO `t_admin_log` VALUES ('625', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522114460');
INSERT INTO `t_admin_log` VALUES ('626', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522114504');
INSERT INTO `t_admin_log` VALUES ('627', 'admin', 'Member', 'opreation', '?/admin/member/opreation/lock/29.html', '1', 'admin', '2130706433', '1522114508');
INSERT INTO `t_admin_log` VALUES ('628', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522114510');
INSERT INTO `t_admin_log` VALUES ('629', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522114821');
INSERT INTO `t_admin_log` VALUES ('630', 'admin', 'Member', 'opreation', '?/admin/member/opreation/lock/29.html', '1', 'admin', '2130706433', '1522114827');
INSERT INTO `t_admin_log` VALUES ('631', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522114829');
INSERT INTO `t_admin_log` VALUES ('632', 'admin', 'Member', 'opreation', '?/admin/member/opreation/lock/29.html', '1', 'admin', '2130706433', '1522114868');
INSERT INTO `t_admin_log` VALUES ('633', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522114870');
INSERT INTO `t_admin_log` VALUES ('634', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522114871');
INSERT INTO `t_admin_log` VALUES ('635', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522114874');
INSERT INTO `t_admin_log` VALUES ('636', 'admin', 'Member', 'index', '?/admin/Member/', '1', 'admin', '2130706433', '1522114893');
INSERT INTO `t_admin_log` VALUES ('637', 'admin', 'Member', 'index', '?/admin/Member/', '1', 'admin', '2130706433', '1522114912');
INSERT INTO `t_admin_log` VALUES ('638', 'admin', 'Member', 'index', '?/admin/Member/', '1', 'admin', '2130706433', '1522114936');
INSERT INTO `t_admin_log` VALUES ('639', 'admin', 'Member', 'index', '?/admin/Member/', '1', 'admin', '2130706433', '1522114945');
INSERT INTO `t_admin_log` VALUES ('640', 'admin', 'Member', 'index', '?/admin/Member/', '1', 'admin', '2130706433', '1522114979');
INSERT INTO `t_admin_log` VALUES ('641', 'admin', 'Member', 'opreation', '?/admin/member/opreation/lock/29.html', '1', 'admin', '2130706433', '1522114980');
INSERT INTO `t_admin_log` VALUES ('642', 'admin', 'Member', 'index', '?/admin/Member/', '1', 'admin', '2130706433', '1522115359');
INSERT INTO `t_admin_log` VALUES ('643', 'admin', 'Member', 'index', '?/admin/Member/', '1', 'admin', '2130706433', '1522115395');
INSERT INTO `t_admin_log` VALUES ('644', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/24.html', '1', 'admin', '2130706433', '1522115409');
INSERT INTO `t_admin_log` VALUES ('645', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1522115411');
INSERT INTO `t_admin_log` VALUES ('646', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/24.html', '1', 'admin', '2130706433', '1522115463');
INSERT INTO `t_admin_log` VALUES ('647', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1522115465');
INSERT INTO `t_admin_log` VALUES ('648', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1522115487');
INSERT INTO `t_admin_log` VALUES ('649', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/24.html', '1', 'admin', '2130706433', '1522115496');
INSERT INTO `t_admin_log` VALUES ('650', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1522115498');
INSERT INTO `t_admin_log` VALUES ('651', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1522115511');
INSERT INTO `t_admin_log` VALUES ('652', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/24.html', '1', 'admin', '2130706433', '1522115518');
INSERT INTO `t_admin_log` VALUES ('653', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1522115520');
INSERT INTO `t_admin_log` VALUES ('654', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1522115632');
INSERT INTO `t_admin_log` VALUES ('655', 'admin', 'Menu', 'info', '?/admin/menu/info/id/41.html', '1', 'admin', '2130706433', '1522115645');
INSERT INTO `t_admin_log` VALUES ('656', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1522115647');
INSERT INTO `t_admin_log` VALUES ('657', 'admin', 'Menu', 'edit', '?/admin/menu/edit.html', '1', 'admin', '2130706433', '1522115649');
INSERT INTO `t_admin_log` VALUES ('658', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/24.html', '1', 'admin', '2130706433', '1522115655');
INSERT INTO `t_admin_log` VALUES ('659', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1522115657');
INSERT INTO `t_admin_log` VALUES ('660', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1522115677');
INSERT INTO `t_admin_log` VALUES ('661', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/24.html', '1', 'admin', '2130706433', '1522115684');
INSERT INTO `t_admin_log` VALUES ('662', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1522115685');
INSERT INTO `t_admin_log` VALUES ('663', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1522115719');
INSERT INTO `t_admin_log` VALUES ('664', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522115728');
INSERT INTO `t_admin_log` VALUES ('665', 'admin', 'Member', 'index', '?/admin/Member/index&%E6%9F%A5%E8%AF%A2=%E6%8F%90%E4%BA%A4', '1', 'admin', '2130706433', '1522115804');
INSERT INTO `t_admin_log` VALUES ('666', 'admin', 'Member', 'index', '?/admin/Member/index&%E6%9F%A5%E8%AF%A2=%E6%8F%90%E4%BA%A4', '1', 'admin', '2130706433', '1522115810');
INSERT INTO `t_admin_log` VALUES ('667', 'admin', 'Member', 'index', '?/admin/Member/index&%E6%9F%A5%E8%AF%A2=%E6%8F%90%E4%BA%A4', '1', 'admin', '2130706433', '1522115824');
INSERT INTO `t_admin_log` VALUES ('668', 'admin', 'Member', 'index', '?/admin/Member/index&%E6%9F%A5%E8%AF%A2=%E6%8F%90%E4%BA%A4', '1', 'admin', '2130706433', '1522115828');
INSERT INTO `t_admin_log` VALUES ('669', 'admin', 'Member', 'index', '?/admin/Member/index&%E6%9F%A5%E8%AF%A2=%E6%8F%90%E4%BA%A4', '1', 'admin', '2130706433', '1522115882');
INSERT INTO `t_admin_log` VALUES ('670', 'admin', 'Member', 'index', '?/admin/Member/index&%E6%9F%A5%E8%AF%A2=%E6%8F%90%E4%BA%A4', '1', 'admin', '2130706433', '1522115893');
INSERT INTO `t_admin_log` VALUES ('671', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522116717');
INSERT INTO `t_admin_log` VALUES ('672', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522116726');
INSERT INTO `t_admin_log` VALUES ('673', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522117132');
INSERT INTO `t_admin_log` VALUES ('674', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522117143');
INSERT INTO `t_admin_log` VALUES ('675', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522117171');
INSERT INTO `t_admin_log` VALUES ('676', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522117204');
INSERT INTO `t_admin_log` VALUES ('677', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522117315');
INSERT INTO `t_admin_log` VALUES ('678', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522117358');
INSERT INTO `t_admin_log` VALUES ('679', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522117390');
INSERT INTO `t_admin_log` VALUES ('680', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522118009');
INSERT INTO `t_admin_log` VALUES ('681', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522118026');
INSERT INTO `t_admin_log` VALUES ('682', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522118049');
INSERT INTO `t_admin_log` VALUES ('683', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522118092');
INSERT INTO `t_admin_log` VALUES ('684', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522118116');
INSERT INTO `t_admin_log` VALUES ('685', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522118129');
INSERT INTO `t_admin_log` VALUES ('686', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522118196');
INSERT INTO `t_admin_log` VALUES ('687', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522118288');
INSERT INTO `t_admin_log` VALUES ('688', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522118327');
INSERT INTO `t_admin_log` VALUES ('689', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522118934');
INSERT INTO `t_admin_log` VALUES ('690', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522118943');
INSERT INTO `t_admin_log` VALUES ('691', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522118975');
INSERT INTO `t_admin_log` VALUES ('692', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522118983');
INSERT INTO `t_admin_log` VALUES ('693', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522119002');
INSERT INTO `t_admin_log` VALUES ('694', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522119054');
INSERT INTO `t_admin_log` VALUES ('695', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522119072');
INSERT INTO `t_admin_log` VALUES ('696', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522119078');
INSERT INTO `t_admin_log` VALUES ('697', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522119099');
INSERT INTO `t_admin_log` VALUES ('698', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522119163');
INSERT INTO `t_admin_log` VALUES ('699', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522119178');
INSERT INTO `t_admin_log` VALUES ('700', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522119189');
INSERT INTO `t_admin_log` VALUES ('701', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522119219');
INSERT INTO `t_admin_log` VALUES ('702', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522119312');
INSERT INTO `t_admin_log` VALUES ('703', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522119318');
INSERT INTO `t_admin_log` VALUES ('704', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522119322');
INSERT INTO `t_admin_log` VALUES ('705', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522119714');
INSERT INTO `t_admin_log` VALUES ('706', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522119715');
INSERT INTO `t_admin_log` VALUES ('707', 'admin', 'Member', 'index', '?/admin/member/index/export/favicon.ico', '1', 'admin', '2130706433', '1522119716');
INSERT INTO `t_admin_log` VALUES ('708', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522119748');
INSERT INTO `t_admin_log` VALUES ('709', 'admin', 'Member', 'index', '?/admin/member/index/export/favicon.ico', '1', 'admin', '2130706433', '1522119749');
INSERT INTO `t_admin_log` VALUES ('710', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522119765');
INSERT INTO `t_admin_log` VALUES ('711', 'admin', 'Member', 'index', '?/admin/member/index/export/favicon.ico', '1', 'admin', '2130706433', '1522119766');
INSERT INTO `t_admin_log` VALUES ('712', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522119772');
INSERT INTO `t_admin_log` VALUES ('713', 'admin', 'Member', 'index', '?/admin/member/index/export/favicon.ico', '1', 'admin', '2130706433', '1522119773');
INSERT INTO `t_admin_log` VALUES ('714', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522119784');
INSERT INTO `t_admin_log` VALUES ('715', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522119797');
INSERT INTO `t_admin_log` VALUES ('716', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522119809');
INSERT INTO `t_admin_log` VALUES ('717', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522119828');
INSERT INTO `t_admin_log` VALUES ('718', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522119839');
INSERT INTO `t_admin_log` VALUES ('719', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522119849');
INSERT INTO `t_admin_log` VALUES ('720', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522119855');
INSERT INTO `t_admin_log` VALUES ('721', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522119872');
INSERT INTO `t_admin_log` VALUES ('722', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522119877');
INSERT INTO `t_admin_log` VALUES ('723', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522119898');
INSERT INTO `t_admin_log` VALUES ('724', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522119950');
INSERT INTO `t_admin_log` VALUES ('725', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522119954');
INSERT INTO `t_admin_log` VALUES ('726', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522119957');
INSERT INTO `t_admin_log` VALUES ('727', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522119963');
INSERT INTO `t_admin_log` VALUES ('728', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522119974');
INSERT INTO `t_admin_log` VALUES ('729', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522120019');
INSERT INTO `t_admin_log` VALUES ('730', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522120104');
INSERT INTO `t_admin_log` VALUES ('731', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522120116');
INSERT INTO `t_admin_log` VALUES ('732', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522120147');
INSERT INTO `t_admin_log` VALUES ('733', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522120172');
INSERT INTO `t_admin_log` VALUES ('734', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522120213');
INSERT INTO `t_admin_log` VALUES ('735', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522120227');
INSERT INTO `t_admin_log` VALUES ('736', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522120254');
INSERT INTO `t_admin_log` VALUES ('737', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522120316');
INSERT INTO `t_admin_log` VALUES ('738', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522120363');
INSERT INTO `t_admin_log` VALUES ('739', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522120376');
INSERT INTO `t_admin_log` VALUES ('740', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522120438');
INSERT INTO `t_admin_log` VALUES ('741', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522120469');
INSERT INTO `t_admin_log` VALUES ('742', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522120545');
INSERT INTO `t_admin_log` VALUES ('743', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522121042');
INSERT INTO `t_admin_log` VALUES ('744', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522121080');
INSERT INTO `t_admin_log` VALUES ('745', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522121083');
INSERT INTO `t_admin_log` VALUES ('746', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522121104');
INSERT INTO `t_admin_log` VALUES ('747', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522121160');
INSERT INTO `t_admin_log` VALUES ('748', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522121199');
INSERT INTO `t_admin_log` VALUES ('749', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522121225');
INSERT INTO `t_admin_log` VALUES ('750', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522121236');
INSERT INTO `t_admin_log` VALUES ('751', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522121276');
INSERT INTO `t_admin_log` VALUES ('752', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522121292');
INSERT INTO `t_admin_log` VALUES ('753', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522121428');
INSERT INTO `t_admin_log` VALUES ('754', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522121540');
INSERT INTO `t_admin_log` VALUES ('755', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522121550');
INSERT INTO `t_admin_log` VALUES ('756', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522121586');
INSERT INTO `t_admin_log` VALUES ('757', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522121593');
INSERT INTO `t_admin_log` VALUES ('758', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522121593');
INSERT INTO `t_admin_log` VALUES ('759', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522121613');
INSERT INTO `t_admin_log` VALUES ('760', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522121728');
INSERT INTO `t_admin_log` VALUES ('761', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522121813');
INSERT INTO `t_admin_log` VALUES ('762', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522121831');
INSERT INTO `t_admin_log` VALUES ('763', 'admin', 'Member', 'index', '?/admin/member/index/export/1.html', '1', 'admin', '2130706433', '1522121849');
INSERT INTO `t_admin_log` VALUES ('764', 'admin', 'Member', 'index', '?/admin/Member/', '1', 'admin', '2130706433', '1522121873');
INSERT INTO `t_admin_log` VALUES ('765', 'admin', 'Member', 'info', '?/admin/Member/info', '1', 'admin', '2130706433', '1522121888');
INSERT INTO `t_admin_log` VALUES ('766', 'admin', 'Member', 'info', '?/admin/Member/info', '1', 'admin', '2130706433', '1522122027');
INSERT INTO `t_admin_log` VALUES ('767', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522122137');
INSERT INTO `t_admin_log` VALUES ('768', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522122249');
INSERT INTO `t_admin_log` VALUES ('769', 'admin', 'Member', 'opreation', '?/admin/member/opreation/lock/29.html', '1', 'admin', '2130706433', '1522122250');
INSERT INTO `t_admin_log` VALUES ('770', 'admin', 'Member', 'opreation', '?/admin/member/opreation/lock/29.html', '1', 'admin', '2130706433', '1522122304');
INSERT INTO `t_admin_log` VALUES ('771', 'admin', 'Member', 'opreation', '?/admin/member/opreation/lock/29.html', '1', 'admin', '2130706433', '1522122766');
INSERT INTO `t_admin_log` VALUES ('772', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522122769');
INSERT INTO `t_admin_log` VALUES ('773', 'admin', 'Member', 'opreation', '?/admin/member/opreation/lock/29.html', '1', 'admin', '2130706433', '1522122774');
INSERT INTO `t_admin_log` VALUES ('774', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522122775');
INSERT INTO `t_admin_log` VALUES ('775', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522122791');
INSERT INTO `t_admin_log` VALUES ('776', 'admin', 'Member', 'opreation', '?/admin/member/opreation/lock/29.html', '1', 'admin', '2130706433', '1522122793');
INSERT INTO `t_admin_log` VALUES ('777', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522122794');
INSERT INTO `t_admin_log` VALUES ('778', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522122816');
INSERT INTO `t_admin_log` VALUES ('779', 'admin', 'Member', 'opreation', '?/admin/member/opreation/lock/29.html', '1', 'admin', '2130706433', '1522122818');
INSERT INTO `t_admin_log` VALUES ('780', 'admin', 'Member', 'opreation', '?/admin/member/opreation/lock/29.html', '1', 'admin', '2130706433', '1522122882');
INSERT INTO `t_admin_log` VALUES ('781', 'admin', 'Member', 'opreation', '?/admin/member/opreation/lock/29.html', '1', 'admin', '2130706433', '1522122902');
INSERT INTO `t_admin_log` VALUES ('782', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522122904');
INSERT INTO `t_admin_log` VALUES ('783', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522122932');
INSERT INTO `t_admin_log` VALUES ('784', 'admin', 'Member', 'opreation', '?/admin/member/opreation/trade/29.html', '1', 'admin', '2130706433', '1522122936');
INSERT INTO `t_admin_log` VALUES ('785', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522122938');
INSERT INTO `t_admin_log` VALUES ('786', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522123190');
INSERT INTO `t_admin_log` VALUES ('787', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522123394');
INSERT INTO `t_admin_log` VALUES ('788', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522123398');
INSERT INTO `t_admin_log` VALUES ('789', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522123425');
INSERT INTO `t_admin_log` VALUES ('790', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522123431');
INSERT INTO `t_admin_log` VALUES ('791', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522123447');
INSERT INTO `t_admin_log` VALUES ('792', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522123526');
INSERT INTO `t_admin_log` VALUES ('793', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522123543');
INSERT INTO `t_admin_log` VALUES ('794', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522123726');
INSERT INTO `t_admin_log` VALUES ('795', 'admin', 'Member', 'opreation', '?/admin/member/opreation/lock/29/type/0.html', '1', 'admin', '2130706433', '1522123728');
INSERT INTO `t_admin_log` VALUES ('796', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522123729');
INSERT INTO `t_admin_log` VALUES ('797', 'admin', 'Member', 'opreation', '?/admin/member/opreation/trade/29/type/0.html', '1', 'admin', '2130706433', '1522123731');
INSERT INTO `t_admin_log` VALUES ('798', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522123732');
INSERT INTO `t_admin_log` VALUES ('799', 'admin', 'Member', 'opreation', '?/admin/member/opreation/lock/28/type/1.html', '1', 'admin', '2130706433', '1522123733');
INSERT INTO `t_admin_log` VALUES ('800', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522123735');
INSERT INTO `t_admin_log` VALUES ('801', 'admin', 'Member', 'opreation', '?/admin/member/opreation/lock/28/type/0.html', '1', 'admin', '2130706433', '1522123736');
INSERT INTO `t_admin_log` VALUES ('802', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522123737');
INSERT INTO `t_admin_log` VALUES ('803', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522125301');
INSERT INTO `t_admin_log` VALUES ('804', 'admin', 'Member', 'index', '?/admin/Member/index&page=2', '1', 'admin', '2130706433', '1522125307');
INSERT INTO `t_admin_log` VALUES ('805', 'admin', 'Member', 'del', '?/admin/member/del/Id/8.html', '1', 'admin', '2130706433', '1522125330');
INSERT INTO `t_admin_log` VALUES ('806', 'admin', 'Member', 'del', '?/admin/member/del/Id/8.html', '1', 'admin', '2130706433', '1522125364');
INSERT INTO `t_admin_log` VALUES ('807', 'admin', 'Member', 'index', '?/admin/Member/index&page=2', '1', 'admin', '2130706433', '1522125366');
INSERT INTO `t_admin_log` VALUES ('808', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522125368');
INSERT INTO `t_admin_log` VALUES ('809', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522125662');
INSERT INTO `t_admin_log` VALUES ('810', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522125784');
INSERT INTO `t_admin_log` VALUES ('811', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522125815');
INSERT INTO `t_admin_log` VALUES ('812', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522125946');
INSERT INTO `t_admin_log` VALUES ('813', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522125958');
INSERT INTO `t_admin_log` VALUES ('814', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522125980');
INSERT INTO `t_admin_log` VALUES ('815', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522126014');
INSERT INTO `t_admin_log` VALUES ('816', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522136478');
INSERT INTO `t_admin_log` VALUES ('817', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522136584');
INSERT INTO `t_admin_log` VALUES ('818', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522136593');
INSERT INTO `t_admin_log` VALUES ('819', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522136608');
INSERT INTO `t_admin_log` VALUES ('820', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522136628');
INSERT INTO `t_admin_log` VALUES ('821', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522136640');
INSERT INTO `t_admin_log` VALUES ('822', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522136663');
INSERT INTO `t_admin_log` VALUES ('823', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522136738');
INSERT INTO `t_admin_log` VALUES ('824', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522136748');
INSERT INTO `t_admin_log` VALUES ('825', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522136782');
INSERT INTO `t_admin_log` VALUES ('826', 'admin', 'Member', 'info', '?/admin/member/info/Id/29.html', '1', 'admin', '2130706433', '1522136784');
INSERT INTO `t_admin_log` VALUES ('827', 'admin', 'Member', 'info', '?/admin/member/info/Id/favicon.ico', '1', 'admin', '2130706433', '1522136786');
INSERT INTO `t_admin_log` VALUES ('828', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522136786');
INSERT INTO `t_admin_log` VALUES ('829', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522138882');
INSERT INTO `t_admin_log` VALUES ('830', 'admin', 'Member', 'reset', '?/admin/member/reset/Id/21.html', '1', 'admin', '2130706433', '1522138892');
INSERT INTO `t_admin_log` VALUES ('831', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522138894');
INSERT INTO `t_admin_log` VALUES ('832', 'admin', 'Member', 'reset', '?/admin/member/reset/Id/20.html', '1', 'admin', '2130706433', '1522138947');
INSERT INTO `t_admin_log` VALUES ('833', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522138950');
INSERT INTO `t_admin_log` VALUES ('834', 'admin', 'Member', 'reset', '?/admin/member/reset/Id/19.html', '1', 'admin', '2130706433', '1522138967');
INSERT INTO `t_admin_log` VALUES ('835', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522138971');
INSERT INTO `t_admin_log` VALUES ('836', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522138973');
INSERT INTO `t_admin_log` VALUES ('837', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522138999');
INSERT INTO `t_admin_log` VALUES ('838', 'admin', 'Member', 'reset', '?/admin/member/reset/Id/26.html', '1', 'admin', '2130706433', '1522139002');
INSERT INTO `t_admin_log` VALUES ('839', 'admin', 'Member', 'reset', '?/admin/member/reset/Id/26.html', '1', 'admin', '2130706433', '1522139063');
INSERT INTO `t_admin_log` VALUES ('840', 'admin', 'Member', 'reset', '?/admin/member/reset/Id/26.html', '1', 'admin', '2130706433', '1522139111');
INSERT INTO `t_admin_log` VALUES ('841', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522139113');
INSERT INTO `t_admin_log` VALUES ('842', 'admin', 'Member', 'info', '?/admin/member/info/Id/26.html', '1', 'admin', '2130706433', '1522139130');
INSERT INTO `t_admin_log` VALUES ('843', 'admin', 'Member', 'info', '?/admin/member/info/Id/favicon.ico', '1', 'admin', '2130706433', '1522139132');
INSERT INTO `t_admin_log` VALUES ('844', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522139133');
INSERT INTO `t_admin_log` VALUES ('845', 'admin', 'Member', 'register', '?/admin/Member/register', '1', 'admin', '2130706433', '1522139164');
INSERT INTO `t_admin_log` VALUES ('846', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522139166');
INSERT INTO `t_admin_log` VALUES ('847', 'admin', 'Member', 'activation', '?/admin/Member/activation', '1', 'admin', '2130706433', '1522139169');
INSERT INTO `t_admin_log` VALUES ('848', 'admin', 'Member', 'index', '?/admin/Member/index&page=1', '1', 'admin', '2130706433', '1522139171');
INSERT INTO `t_admin_log` VALUES ('849', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522139182');
INSERT INTO `t_admin_log` VALUES ('850', 'admin', 'Member', 'register', '?/admin/Member/register', '1', 'admin', '2130706433', '1522139275');
INSERT INTO `t_admin_log` VALUES ('851', 'admin', 'Member', 'register', '?/admin/Member/register', '1', 'admin', '2130706433', '1522139288');
INSERT INTO `t_admin_log` VALUES ('852', 'admin', 'Member', 'register', '?/admin/Member/register', '1', 'admin', '2130706433', '1522139306');
INSERT INTO `t_admin_log` VALUES ('853', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522139309');
INSERT INTO `t_admin_log` VALUES ('854', 'admin', 'Member', 'activation', '?/admin/Member/activation', '1', 'admin', '2130706433', '1522139332');
INSERT INTO `t_admin_log` VALUES ('855', 'admin', 'Member', 'index', '?/admin/Member/', '1', 'admin', '2130706433', '1522139703');
INSERT INTO `t_admin_log` VALUES ('856', 'admin', 'Menu', 'info', '?/admin/menu/info/id/40.html', '1', 'admin', '2130706433', '1522139733');
INSERT INTO `t_admin_log` VALUES ('857', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1522139734');
INSERT INTO `t_admin_log` VALUES ('858', 'admin', 'Menu', 'del', '?/admin/menu/del/id/40.html', '1', 'admin', '2130706433', '1522139740');
INSERT INTO `t_admin_log` VALUES ('859', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522139746');
INSERT INTO `t_admin_log` VALUES ('860', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522139771');
INSERT INTO `t_admin_log` VALUES ('861', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522139780');
INSERT INTO `t_admin_log` VALUES ('862', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522139783');
INSERT INTO `t_admin_log` VALUES ('863', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522139787');
INSERT INTO `t_admin_log` VALUES ('864', 'admin', 'Member', 'register', '?/admin/Member/register', '1', 'admin', '2130706433', '1522139797');
INSERT INTO `t_admin_log` VALUES ('865', 'admin', 'Member', 'register', '?/admin/Member/register', '1', 'admin', '2130706433', '1522139876');
INSERT INTO `t_admin_log` VALUES ('866', 'admin', 'Member', 'register', '?/admin/Member/register', '1', 'admin', '2130706433', '1522140465');
INSERT INTO `t_admin_log` VALUES ('867', 'admin', 'Member', 'register', '?/admin/Member/register', '1', 'admin', '2130706433', '1522143239');
INSERT INTO `t_admin_log` VALUES ('868', 'admin', 'Member', 'register', '?/admin/Member/register', '1', 'admin', '2130706433', '1522143266');
INSERT INTO `t_admin_log` VALUES ('869', 'admin', 'Member', 'register', '?/admin/Member/register', '1', 'admin', '2130706433', '1522143274');
INSERT INTO `t_admin_log` VALUES ('870', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143279');
INSERT INTO `t_admin_log` VALUES ('871', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143312');
INSERT INTO `t_admin_log` VALUES ('872', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143328');
INSERT INTO `t_admin_log` VALUES ('873', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143350');
INSERT INTO `t_admin_log` VALUES ('874', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143355');
INSERT INTO `t_admin_log` VALUES ('875', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143395');
INSERT INTO `t_admin_log` VALUES ('876', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143399');
INSERT INTO `t_admin_log` VALUES ('877', 'admin', 'Member', 'favicon.ico', '?/admin/member/favicon.ico', '1', 'admin', '2130706433', '1522143400');
INSERT INTO `t_admin_log` VALUES ('878', 'admin', 'Member', 'favicon.ico', '?/admin/member/favicon.ico', '1', 'admin', '2130706433', '1522143401');
INSERT INTO `t_admin_log` VALUES ('879', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143429');
INSERT INTO `t_admin_log` VALUES ('880', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143450');
INSERT INTO `t_admin_log` VALUES ('881', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143459');
INSERT INTO `t_admin_log` VALUES ('882', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143488');
INSERT INTO `t_admin_log` VALUES ('883', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143502');
INSERT INTO `t_admin_log` VALUES ('884', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143515');
INSERT INTO `t_admin_log` VALUES ('885', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143528');
INSERT INTO `t_admin_log` VALUES ('886', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143536');
INSERT INTO `t_admin_log` VALUES ('887', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143565');
INSERT INTO `t_admin_log` VALUES ('888', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143570');
INSERT INTO `t_admin_log` VALUES ('889', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143576');
INSERT INTO `t_admin_log` VALUES ('890', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143588');
INSERT INTO `t_admin_log` VALUES ('891', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143593');
INSERT INTO `t_admin_log` VALUES ('892', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143616');
INSERT INTO `t_admin_log` VALUES ('893', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143622');
INSERT INTO `t_admin_log` VALUES ('894', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143631');
INSERT INTO `t_admin_log` VALUES ('895', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143638');
INSERT INTO `t_admin_log` VALUES ('896', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143647');
INSERT INTO `t_admin_log` VALUES ('897', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143666');
INSERT INTO `t_admin_log` VALUES ('898', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143674');
INSERT INTO `t_admin_log` VALUES ('899', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143690');
INSERT INTO `t_admin_log` VALUES ('900', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143806');
INSERT INTO `t_admin_log` VALUES ('901', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143817');
INSERT INTO `t_admin_log` VALUES ('902', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143829');
INSERT INTO `t_admin_log` VALUES ('903', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143917');
INSERT INTO `t_admin_log` VALUES ('904', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522143923');
INSERT INTO `t_admin_log` VALUES ('905', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522145842');
INSERT INTO `t_admin_log` VALUES ('906', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522145961');
INSERT INTO `t_admin_log` VALUES ('907', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522145982');
INSERT INTO `t_admin_log` VALUES ('908', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522146126');
INSERT INTO `t_admin_log` VALUES ('909', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522146143');
INSERT INTO `t_admin_log` VALUES ('910', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522146255');
INSERT INTO `t_admin_log` VALUES ('911', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522146257');
INSERT INTO `t_admin_log` VALUES ('912', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522146304');
INSERT INTO `t_admin_log` VALUES ('913', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522146305');
INSERT INTO `t_admin_log` VALUES ('914', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522146383');
INSERT INTO `t_admin_log` VALUES ('915', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522146385');
INSERT INTO `t_admin_log` VALUES ('916', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522146427');
INSERT INTO `t_admin_log` VALUES ('917', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522146466');
INSERT INTO `t_admin_log` VALUES ('918', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522146478');
INSERT INTO `t_admin_log` VALUES ('919', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522146479');
INSERT INTO `t_admin_log` VALUES ('920', 'admin', 'Member', 'register', '?/admin/member/register.html', '1', 'admin', '2130706433', '1522146501');
INSERT INTO `t_admin_log` VALUES ('921', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522146506');
INSERT INTO `t_admin_log` VALUES ('922', 'admin', 'Member', 'register', '?/admin/Member/register', '1', 'admin', '2130706433', '1522146508');
INSERT INTO `t_admin_log` VALUES ('923', 'admin', 'Member', 'index', '?/admin/member/index.html', '1', 'admin', '2130706433', '1522146509');
INSERT INTO `t_admin_log` VALUES ('924', 'admin', 'Member', 'index', '?/admin/member/index.html', '1', 'admin', '2130706433', '1522146601');
INSERT INTO `t_admin_log` VALUES ('925', 'admin', 'Member', 'index', '?/admin/member/index.html', '1', 'admin', '2130706433', '1522146631');
INSERT INTO `t_admin_log` VALUES ('926', 'admin', 'Member', 'register', '?/admin/member/register', '1', 'admin', '2130706433', '1522147135');
INSERT INTO `t_admin_log` VALUES ('927', 'admin', 'Member', 'register', '?/admin/member/register', '1', 'admin', '2130706433', '1522147168');
INSERT INTO `t_admin_log` VALUES ('928', 'admin', 'Member', 'register', '?/admin/member/register', '1', 'admin', '2130706433', '1522147212');
INSERT INTO `t_admin_log` VALUES ('929', 'admin', 'Member', 'register', '?/admin/member/register', '1', 'admin', '2130706433', '1522147213');
INSERT INTO `t_admin_log` VALUES ('930', 'admin', 'Member', 'register', '?/admin/member/register', '1', 'admin', '2130706433', '1522147238');
INSERT INTO `t_admin_log` VALUES ('931', 'admin', 'Member', 'register', '?/admin/member/register', '1', 'admin', '2130706433', '1522147252');
INSERT INTO `t_admin_log` VALUES ('932', 'admin', 'Member', 'register', '?/admin/member/register', '1', 'admin', '2130706433', '1522147265');
INSERT INTO `t_admin_log` VALUES ('933', 'admin', 'Member', 'register', '?/admin/member/register', '1', 'admin', '2130706433', '1522147270');
INSERT INTO `t_admin_log` VALUES ('934', 'admin', 'Member', 'register', '?/admin/member/register', '1', 'admin', '2130706433', '1522147316');
INSERT INTO `t_admin_log` VALUES ('935', 'admin', 'Member', 'register', '?/admin/member/register', '1', 'admin', '2130706433', '1522147403');
INSERT INTO `t_admin_log` VALUES ('936', 'admin', 'Member', 'register', '?/admin/member/register', '1', 'admin', '2130706433', '1522147488');
INSERT INTO `t_admin_log` VALUES ('937', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522147492');
INSERT INTO `t_admin_log` VALUES ('938', 'admin', 'Member', 'info', '?/admin/member/info/Id/33.html', '1', 'admin', '2130706433', '1522147495');
INSERT INTO `t_admin_log` VALUES ('939', 'admin', 'Member', 'info', '?/admin/member/info/Id/favicon.ico', '1', 'admin', '2130706433', '1522147496');
INSERT INTO `t_admin_log` VALUES ('940', 'admin', 'Member', 'info', '?/admin/member/info/Id/33.html', '1', 'admin', '2130706433', '1522147503');
INSERT INTO `t_admin_log` VALUES ('941', 'admin', 'Member', 'info', '?/admin/member/info/Id/favicon.ico', '1', 'admin', '2130706433', '1522147505');
INSERT INTO `t_admin_log` VALUES ('942', 'admin', 'Member', 'info', '?/admin/member/info/Id/33.html', '1', 'admin', '2130706433', '1522147628');
INSERT INTO `t_admin_log` VALUES ('943', 'admin', 'Member', 'info', '?/admin/member/info/Id/favicon.ico', '1', 'admin', '2130706433', '1522147629');
INSERT INTO `t_admin_log` VALUES ('944', 'admin', 'Member', 'info', '?/admin/member/info/Id/33.html', '1', 'admin', '2130706433', '1522147639');
INSERT INTO `t_admin_log` VALUES ('945', 'admin', 'Member', 'info', '?/admin/member/info/Id/favicon.ico', '1', 'admin', '2130706433', '1522147641');
INSERT INTO `t_admin_log` VALUES ('946', 'admin', 'Member', 'info', '?/admin/member/info/Id/33.html', '1', 'admin', '2130706433', '1522147646');
INSERT INTO `t_admin_log` VALUES ('947', 'admin', 'Member', 'info', '?/admin/member/info/Id/33.html', '1', 'admin', '2130706433', '1522147647');
INSERT INTO `t_admin_log` VALUES ('948', 'admin', 'Member', 'info', '?/admin/member/info/Id/favicon.ico', '1', 'admin', '2130706433', '1522147648');
INSERT INTO `t_admin_log` VALUES ('949', 'admin', 'Member', 'info', '?/admin/member/info/Id/favicon.ico', '1', 'admin', '2130706433', '1522147648');
INSERT INTO `t_admin_log` VALUES ('950', 'admin', 'Member', 'index', '?/admin/member/index.html', '1', 'admin', '2130706433', '1522147651');
INSERT INTO `t_admin_log` VALUES ('951', 'admin', 'Member', 'info', '?/admin/member/info/Id/32.html', '1', 'admin', '2130706433', '1522147656');
INSERT INTO `t_admin_log` VALUES ('952', 'admin', 'Member', 'info', '?/admin/member/info/Id/favicon.ico', '1', 'admin', '2130706433', '1522147658');
INSERT INTO `t_admin_log` VALUES ('953', 'admin', 'Member', 'index', '?/admin/member/index.html', '1', 'admin', '2130706433', '1522147659');
INSERT INTO `t_admin_log` VALUES ('954', 'admin', 'Member', 'info', '?/admin/member/info/Id/30.html', '1', 'admin', '2130706433', '1522147663');
INSERT INTO `t_admin_log` VALUES ('955', 'admin', 'Member', 'info', '?/admin/member/info/Id/favicon.ico', '1', 'admin', '2130706433', '1522147665');
INSERT INTO `t_admin_log` VALUES ('956', 'admin', 'Member', 'info', '?/admin/member/info/Id/30.html', '1', 'admin', '2130706433', '1522147683');
INSERT INTO `t_admin_log` VALUES ('957', 'admin', 'Member', 'info', '?/admin/member/info/Id/favicon.ico', '1', 'admin', '2130706433', '1522147685');
INSERT INTO `t_admin_log` VALUES ('958', 'admin', 'Member', 'index', '?/admin/member/index.html', '1', 'admin', '2130706433', '1522147863');
INSERT INTO `t_admin_log` VALUES ('959', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522153979');
INSERT INTO `t_admin_log` VALUES ('960', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/favicon.ico', '1', 'admin', '2130706433', '1522153980');
INSERT INTO `t_admin_log` VALUES ('961', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522153997');
INSERT INTO `t_admin_log` VALUES ('962', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522153998');
INSERT INTO `t_admin_log` VALUES ('963', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/favicon.ico', '1', 'admin', '2130706433', '1522153999');
INSERT INTO `t_admin_log` VALUES ('964', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154034');
INSERT INTO `t_admin_log` VALUES ('965', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154037');
INSERT INTO `t_admin_log` VALUES ('966', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/favicon.ico', '1', 'admin', '2130706433', '1522154039');
INSERT INTO `t_admin_log` VALUES ('967', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154054');
INSERT INTO `t_admin_log` VALUES ('968', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154056');
INSERT INTO `t_admin_log` VALUES ('969', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/favicon.ico', '1', 'admin', '2130706433', '1522154058');
INSERT INTO `t_admin_log` VALUES ('970', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154087');
INSERT INTO `t_admin_log` VALUES ('971', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154088');
INSERT INTO `t_admin_log` VALUES ('972', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/favicon.ico', '1', 'admin', '2130706433', '1522154089');
INSERT INTO `t_admin_log` VALUES ('973', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154101');
INSERT INTO `t_admin_log` VALUES ('974', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154102');
INSERT INTO `t_admin_log` VALUES ('975', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/favicon.ico', '1', 'admin', '2130706433', '1522154104');
INSERT INTO `t_admin_log` VALUES ('976', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154156');
INSERT INTO `t_admin_log` VALUES ('977', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154163');
INSERT INTO `t_admin_log` VALUES ('978', 'admin', 'Member', 'index', '?/admin/member/index.html', '1', 'admin', '2130706433', '1522154164');
INSERT INTO `t_admin_log` VALUES ('979', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154169');
INSERT INTO `t_admin_log` VALUES ('980', 'admin', 'Member', 'index', '?/admin/member/index.html', '1', 'admin', '2130706433', '1522154171');
INSERT INTO `t_admin_log` VALUES ('981', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154172');
INSERT INTO `t_admin_log` VALUES ('982', 'admin', 'Member', 'index', '?/admin/member/index.html', '1', 'admin', '2130706433', '1522154174');
INSERT INTO `t_admin_log` VALUES ('983', 'admin', 'Member', 'index', '?/admin/member/index.html', '1', 'admin', '2130706433', '1522154234');
INSERT INTO `t_admin_log` VALUES ('984', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154235');
INSERT INTO `t_admin_log` VALUES ('985', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/favicon.ico', '1', 'admin', '2130706433', '1522154237');
INSERT INTO `t_admin_log` VALUES ('986', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154263');
INSERT INTO `t_admin_log` VALUES ('987', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/favicon.ico', '1', 'admin', '2130706433', '1522154263');
INSERT INTO `t_admin_log` VALUES ('988', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154268');
INSERT INTO `t_admin_log` VALUES ('989', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154270');
INSERT INTO `t_admin_log` VALUES ('990', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/favicon.ico', '1', 'admin', '2130706433', '1522154270');
INSERT INTO `t_admin_log` VALUES ('991', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154275');
INSERT INTO `t_admin_log` VALUES ('992', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154385');
INSERT INTO `t_admin_log` VALUES ('993', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154424');
INSERT INTO `t_admin_log` VALUES ('994', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154464');
INSERT INTO `t_admin_log` VALUES ('995', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/favicon.ico', '1', 'admin', '2130706433', '1522154466');
INSERT INTO `t_admin_log` VALUES ('996', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154505');
INSERT INTO `t_admin_log` VALUES ('997', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/favicon.ico', '1', 'admin', '2130706433', '1522154507');
INSERT INTO `t_admin_log` VALUES ('998', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154521');
INSERT INTO `t_admin_log` VALUES ('999', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/favicon.ico', '1', 'admin', '2130706433', '1522154523');
INSERT INTO `t_admin_log` VALUES ('1000', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154555');
INSERT INTO `t_admin_log` VALUES ('1001', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/favicon.ico', '1', 'admin', '2130706433', '1522154557');
INSERT INTO `t_admin_log` VALUES ('1002', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154583');
INSERT INTO `t_admin_log` VALUES ('1003', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/favicon.ico', '1', 'admin', '2130706433', '1522154585');
INSERT INTO `t_admin_log` VALUES ('1004', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154603');
INSERT INTO `t_admin_log` VALUES ('1005', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/favicon.ico', '1', 'admin', '2130706433', '1522154605');
INSERT INTO `t_admin_log` VALUES ('1006', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154615');
INSERT INTO `t_admin_log` VALUES ('1007', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154620');
INSERT INTO `t_admin_log` VALUES ('1008', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/33.html', '1', 'admin', '2130706433', '1522154622');
INSERT INTO `t_admin_log` VALUES ('1009', 'admin', 'Member', 'edit', '?/admin/member/edit/Id/favicon.ico', '1', 'admin', '2130706433', '1522154623');
INSERT INTO `t_admin_log` VALUES ('1010', 'admin', 'Member', 'index', '?/admin/member/index.html', '1', 'admin', '2130706433', '1522154624');
INSERT INTO `t_admin_log` VALUES ('1011', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522154642');
INSERT INTO `t_admin_log` VALUES ('1012', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/33.html', '1', 'admin', '2130706433', '1522154676');
INSERT INTO `t_admin_log` VALUES ('1013', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1522154678');
INSERT INTO `t_admin_log` VALUES ('1014', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1522154706');
INSERT INTO `t_admin_log` VALUES ('1015', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522154812');
INSERT INTO `t_admin_log` VALUES ('1016', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522154841');
INSERT INTO `t_admin_log` VALUES ('1017', 'admin', 'Member', 'register', '?/admin/Member/register', '1', 'admin', '2130706433', '1522154848');
INSERT INTO `t_admin_log` VALUES ('1018', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522154851');
INSERT INTO `t_admin_log` VALUES ('1019', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522155581');
INSERT INTO `t_admin_log` VALUES ('1020', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522155583');
INSERT INTO `t_admin_log` VALUES ('1021', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522155591');
INSERT INTO `t_admin_log` VALUES ('1022', 'admin', 'Bonus', 'favicon.ico', '?/admin/bonus/favicon.ico', '1', 'admin', '2130706433', '1522155593');
INSERT INTO `t_admin_log` VALUES ('1023', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522155602');
INSERT INTO `t_admin_log` VALUES ('1024', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522155612');
INSERT INTO `t_admin_log` VALUES ('1025', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522156375');
INSERT INTO `t_admin_log` VALUES ('1026', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522156383');
INSERT INTO `t_admin_log` VALUES ('1027', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522156432');
INSERT INTO `t_admin_log` VALUES ('1028', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522156519');
INSERT INTO `t_admin_log` VALUES ('1029', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522156540');
INSERT INTO `t_admin_log` VALUES ('1030', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522156544');
INSERT INTO `t_admin_log` VALUES ('1031', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522158531');
INSERT INTO `t_admin_log` VALUES ('1032', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522158571');
INSERT INTO `t_admin_log` VALUES ('1033', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522158602');
INSERT INTO `t_admin_log` VALUES ('1034', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522158667');
INSERT INTO `t_admin_log` VALUES ('1035', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522158807');
INSERT INTO `t_admin_log` VALUES ('1036', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522158815');
INSERT INTO `t_admin_log` VALUES ('1037', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522158823');
INSERT INTO `t_admin_log` VALUES ('1038', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522158836');
INSERT INTO `t_admin_log` VALUES ('1039', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522158849');
INSERT INTO `t_admin_log` VALUES ('1040', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522159468');
INSERT INTO `t_admin_log` VALUES ('1041', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522159475');
INSERT INTO `t_admin_log` VALUES ('1042', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522159526');
INSERT INTO `t_admin_log` VALUES ('1043', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522159579');
INSERT INTO `t_admin_log` VALUES ('1044', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522159610');
INSERT INTO `t_admin_log` VALUES ('1045', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522159788');
INSERT INTO `t_admin_log` VALUES ('1046', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522159806');
INSERT INTO `t_admin_log` VALUES ('1047', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522159818');
INSERT INTO `t_admin_log` VALUES ('1048', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522159826');
INSERT INTO `t_admin_log` VALUES ('1049', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522159855');
INSERT INTO `t_admin_log` VALUES ('1050', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/33.html', '1', 'admin', '2130706433', '1522159957');
INSERT INTO `t_admin_log` VALUES ('1051', 'admin', 'Menu', 'info', '?/admin/menu/info/parentid/favicon.ico', '1', 'admin', '2130706433', '1522159959');
INSERT INTO `t_admin_log` VALUES ('1052', 'admin', 'Menu', 'add', '?/admin/menu/add.html', '1', 'admin', '2130706433', '1522159995');
INSERT INTO `t_admin_log` VALUES ('1053', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522160084');
INSERT INTO `t_admin_log` VALUES ('1054', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522160086');
INSERT INTO `t_admin_log` VALUES ('1055', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522160246');
INSERT INTO `t_admin_log` VALUES ('1056', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522160248');
INSERT INTO `t_admin_log` VALUES ('1057', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/favicon.ico', '1', 'admin', '2130706433', '1522160250');
INSERT INTO `t_admin_log` VALUES ('1058', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522160414');
INSERT INTO `t_admin_log` VALUES ('1059', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/favicon.ico', '1', 'admin', '2130706433', '1522160415');
INSERT INTO `t_admin_log` VALUES ('1060', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/24.html', '1', 'admin', '2130706433', '1522160419');
INSERT INTO `t_admin_log` VALUES ('1061', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/1.html', '1', 'admin', '2130706433', '1522160424');
INSERT INTO `t_admin_log` VALUES ('1062', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/favicon.ico', '1', 'admin', '2130706433', '1522160425');
INSERT INTO `t_admin_log` VALUES ('1063', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/4.html', '1', 'admin', '2130706433', '1522160427');
INSERT INTO `t_admin_log` VALUES ('1064', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/1.html', '1', 'admin', '2130706433', '1522160429');
INSERT INTO `t_admin_log` VALUES ('1065', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/favicon.ico', '1', 'admin', '2130706433', '1522160431');
INSERT INTO `t_admin_log` VALUES ('1066', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/1.html', '1', 'admin', '2130706433', '1522160508');
INSERT INTO `t_admin_log` VALUES ('1067', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/1.html', '1', 'admin', '2130706433', '1522160522');
INSERT INTO `t_admin_log` VALUES ('1068', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522160539');
INSERT INTO `t_admin_log` VALUES ('1069', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/favicon.ico', '1', 'admin', '2130706433', '1522160541');
INSERT INTO `t_admin_log` VALUES ('1070', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522160543');
INSERT INTO `t_admin_log` VALUES ('1071', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/favicon.ico', '1', 'admin', '2130706433', '1522160545');
INSERT INTO `t_admin_log` VALUES ('1072', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522160558');
INSERT INTO `t_admin_log` VALUES ('1073', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/favicon.ico', '1', 'admin', '2130706433', '1522160560');
INSERT INTO `t_admin_log` VALUES ('1074', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522160561');
INSERT INTO `t_admin_log` VALUES ('1075', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/favicon.ico', '1', 'admin', '2130706433', '1522160562');
INSERT INTO `t_admin_log` VALUES ('1076', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522160599');
INSERT INTO `t_admin_log` VALUES ('1077', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522161164');
INSERT INTO `t_admin_log` VALUES ('1078', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522161223');
INSERT INTO `t_admin_log` VALUES ('1079', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522161272');
INSERT INTO `t_admin_log` VALUES ('1080', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522161397');
INSERT INTO `t_admin_log` VALUES ('1081', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522161659');
INSERT INTO `t_admin_log` VALUES ('1082', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522161677');
INSERT INTO `t_admin_log` VALUES ('1083', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522161687');
INSERT INTO `t_admin_log` VALUES ('1084', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522161748');
INSERT INTO `t_admin_log` VALUES ('1085', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522161792');
INSERT INTO `t_admin_log` VALUES ('1086', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522161803');
INSERT INTO `t_admin_log` VALUES ('1087', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522162520');
INSERT INTO `t_admin_log` VALUES ('1088', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522162665');
INSERT INTO `t_admin_log` VALUES ('1089', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522162679');
INSERT INTO `t_admin_log` VALUES ('1090', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522162692');
INSERT INTO `t_admin_log` VALUES ('1091', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522162738');
INSERT INTO `t_admin_log` VALUES ('1092', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522162740');
INSERT INTO `t_admin_log` VALUES ('1093', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522162744');
INSERT INTO `t_admin_log` VALUES ('1094', 'admin', 'Bonus', 'index', '?/admin/bonus', '1', 'admin', '2130706433', '1522162752');
INSERT INTO `t_admin_log` VALUES ('1095', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522162759');
INSERT INTO `t_admin_log` VALUES ('1096', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522162763');
INSERT INTO `t_admin_log` VALUES ('1097', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522162791');
INSERT INTO `t_admin_log` VALUES ('1098', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522162806');
INSERT INTO `t_admin_log` VALUES ('1099', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522162817');
INSERT INTO `t_admin_log` VALUES ('1100', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522162818');
INSERT INTO `t_admin_log` VALUES ('1101', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522162829');
INSERT INTO `t_admin_log` VALUES ('1102', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522162831');
INSERT INTO `t_admin_log` VALUES ('1103', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522162958');
INSERT INTO `t_admin_log` VALUES ('1104', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/0.html', '1', 'admin', '2130706433', '1522162962');
INSERT INTO `t_admin_log` VALUES ('1105', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/0.html', '1', 'admin', '2130706433', '1522162995');
INSERT INTO `t_admin_log` VALUES ('1106', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/', '1', 'admin', '2130706433', '1522163043');
INSERT INTO `t_admin_log` VALUES ('1107', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/favicon.ico', '1', 'admin', '2130706433', '1522163045');
INSERT INTO `t_admin_log` VALUES ('1108', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/', '1', 'admin', '2130706433', '1522163099');
INSERT INTO `t_admin_log` VALUES ('1109', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/favicon.ico', '1', 'admin', '2130706433', '1522163101');
INSERT INTO `t_admin_log` VALUES ('1110', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/', '1', 'admin', '2130706433', '1522163123');
INSERT INTO `t_admin_log` VALUES ('1111', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/favicon.ico', '1', 'admin', '2130706433', '1522163124');
INSERT INTO `t_admin_log` VALUES ('1112', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/0.html', '1', 'admin', '2130706433', '1522163153');
INSERT INTO `t_admin_log` VALUES ('1113', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/0.html', '1', 'admin', '2130706433', '1522163225');
INSERT INTO `t_admin_log` VALUES ('1114', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/0.html', '1', 'admin', '2130706433', '1522163240');
INSERT INTO `t_admin_log` VALUES ('1115', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/0.html', '1', 'admin', '2130706433', '1522163246');
INSERT INTO `t_admin_log` VALUES ('1116', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/0.html', '1', 'admin', '2130706433', '1522163317');
INSERT INTO `t_admin_log` VALUES ('1117', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/', '1', 'admin', '2130706433', '1522163318');
INSERT INTO `t_admin_log` VALUES ('1118', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/favicon.ico', '1', 'admin', '2130706433', '1522163320');
INSERT INTO `t_admin_log` VALUES ('1119', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/0.html', '1', 'admin', '2130706433', '1522163327');
INSERT INTO `t_admin_log` VALUES ('1120', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/', '1', 'admin', '2130706433', '1522163329');
INSERT INTO `t_admin_log` VALUES ('1121', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/favicon.ico', '1', 'admin', '2130706433', '1522163330');
INSERT INTO `t_admin_log` VALUES ('1122', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/0.html', '1', 'admin', '2130706433', '1522163356');
INSERT INTO `t_admin_log` VALUES ('1123', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/', '1', 'admin', '2130706433', '1522163358');
INSERT INTO `t_admin_log` VALUES ('1124', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/favicon.ico', '1', 'admin', '2130706433', '1522163360');
INSERT INTO `t_admin_log` VALUES ('1125', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/2.html', '1', 'admin', '2130706433', '1522163403');
INSERT INTO `t_admin_log` VALUES ('1126', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/', '1', 'admin', '2130706433', '1522163404');
INSERT INTO `t_admin_log` VALUES ('1127', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/favicon.ico', '1', 'admin', '2130706433', '1522163406');
INSERT INTO `t_admin_log` VALUES ('1128', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/0.html', '1', 'admin', '2130706433', '1522163411');
INSERT INTO `t_admin_log` VALUES ('1129', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/', '1', 'admin', '2130706433', '1522163412');
INSERT INTO `t_admin_log` VALUES ('1130', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/favicon.ico', '1', 'admin', '2130706433', '1522163414');
INSERT INTO `t_admin_log` VALUES ('1131', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/0.html', '1', 'admin', '2130706433', '1522163480');
INSERT INTO `t_admin_log` VALUES ('1132', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/', '1', 'admin', '2130706433', '1522163484');
INSERT INTO `t_admin_log` VALUES ('1133', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/favicon.ico', '1', 'admin', '2130706433', '1522163485');
INSERT INTO `t_admin_log` VALUES ('1134', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/0.html', '1', 'admin', '2130706433', '1522163489');
INSERT INTO `t_admin_log` VALUES ('1135', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/0.html', '1', 'admin', '2130706433', '1522163522');
INSERT INTO `t_admin_log` VALUES ('1136', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/', '1', 'admin', '2130706433', '1522163524');
INSERT INTO `t_admin_log` VALUES ('1137', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/favicon.ico', '1', 'admin', '2130706433', '1522163525');
INSERT INTO `t_admin_log` VALUES ('1138', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/', '1', 'admin', '2130706433', '1522163620');
INSERT INTO `t_admin_log` VALUES ('1139', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/', '1', 'admin', '2130706433', '1522163621');
INSERT INTO `t_admin_log` VALUES ('1140', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/favicon.ico', '1', 'admin', '2130706433', '1522163622');
INSERT INTO `t_admin_log` VALUES ('1141', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/favicon.ico', '1', 'admin', '2130706433', '1522163623');
INSERT INTO `t_admin_log` VALUES ('1142', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/0.html', '1', 'admin', '2130706433', '1522163654');
INSERT INTO `t_admin_log` VALUES ('1143', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522163685');
INSERT INTO `t_admin_log` VALUES ('1144', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/0.html', '1', 'admin', '2130706433', '1522163718');
INSERT INTO `t_admin_log` VALUES ('1145', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522163719');
INSERT INTO `t_admin_log` VALUES ('1146', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522163740');
INSERT INTO `t_admin_log` VALUES ('1147', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/1.html', '1', 'admin', '2130706433', '1522163744');
INSERT INTO `t_admin_log` VALUES ('1148', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522163745');
INSERT INTO `t_admin_log` VALUES ('1149', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting/type/1.html', '1', 'admin', '2130706433', '1522163751');
INSERT INTO `t_admin_log` VALUES ('1150', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522163752');
INSERT INTO `t_admin_log` VALUES ('1151', 'admin', 'Bonus', 'add', '?/admin/bonus/add', '1', 'admin', '2130706433', '1522163773');
INSERT INTO `t_admin_log` VALUES ('1152', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522163775');
INSERT INTO `t_admin_log` VALUES ('1153', 'admin', 'Bonus', 'add', '?/admin/bonus/add', '1', 'admin', '2130706433', '1522163790');
INSERT INTO `t_admin_log` VALUES ('1154', 'admin', 'Bonus', 'add', '?/admin/bonus/add', '1', 'admin', '2130706433', '1522164106');
INSERT INTO `t_admin_log` VALUES ('1155', 'admin', 'Bonus', 'add', '?/admin/bonus/add', '1', 'admin', '2130706433', '1522164124');
INSERT INTO `t_admin_log` VALUES ('1156', 'admin', 'Bonus', 'add', '?/admin/bonus/add', '1', 'admin', '2130706433', '1522164211');
INSERT INTO `t_admin_log` VALUES ('1157', 'admin', 'Bonus', 'add', '?/admin/bonus/add', '1', 'admin', '2130706433', '1522164225');
INSERT INTO `t_admin_log` VALUES ('1158', 'admin', 'Bonus', 'add', '?/admin/bonus/add', '1', 'admin', '2130706433', '1522164238');
INSERT INTO `t_admin_log` VALUES ('1159', 'admin', 'Bonus', 'add', '?/admin/bonus/add', '1', 'admin', '2130706433', '1522164265');
INSERT INTO `t_admin_log` VALUES ('1160', 'admin', 'Bonus', 'add', '?/admin/bonus/add', '1', 'admin', '2130706433', '1522164274');
INSERT INTO `t_admin_log` VALUES ('1161', 'admin', 'Bonus', 'add', '?/admin/bonus/add', '1', 'admin', '2130706433', '1522164276');
INSERT INTO `t_admin_log` VALUES ('1162', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting.html', '1', 'admin', '2130706433', '1522164277');
INSERT INTO `t_admin_log` VALUES ('1163', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting.html', '1', 'admin', '2130706433', '1522333930');
INSERT INTO `t_admin_log` VALUES ('1164', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522333940');
INSERT INTO `t_admin_log` VALUES ('1165', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1522340471');
INSERT INTO `t_admin_log` VALUES ('1166', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1522340479');
INSERT INTO `t_admin_log` VALUES ('1167', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1522340484');
INSERT INTO `t_admin_log` VALUES ('1168', 'admin', 'Group', 'favicon.ico', '?/admin/Group/favicon.ico', '1', 'admin', '2130706433', '1522340484');
INSERT INTO `t_admin_log` VALUES ('1169', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '1', 'admin', '2130706433', '1522340486');
INSERT INTO `t_admin_log` VALUES ('1170', 'admin', 'Admin', 'favicon.ico', '?/admin/Admin/favicon.ico', '1', 'admin', '2130706433', '1522340486');
INSERT INTO `t_admin_log` VALUES ('1171', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1522340487');
INSERT INTO `t_admin_log` VALUES ('1172', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '1', 'admin', '2130706433', '1522340516');
INSERT INTO `t_admin_log` VALUES ('1173', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522340518');
INSERT INTO `t_admin_log` VALUES ('1174', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522340520');
INSERT INTO `t_admin_log` VALUES ('1175', 'admin', 'Bonus', 'add', '?/admin/bonus/add', '1', 'admin', '2130706433', '1522340522');
INSERT INTO `t_admin_log` VALUES ('1176', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522340524');
INSERT INTO `t_admin_log` VALUES ('1177', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522340546');
INSERT INTO `t_admin_log` VALUES ('1178', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1522340548');
INSERT INTO `t_admin_log` VALUES ('1179', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522340549');
INSERT INTO `t_admin_log` VALUES ('1180', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522340550');
INSERT INTO `t_admin_log` VALUES ('1181', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522340553');
INSERT INTO `t_admin_log` VALUES ('1182', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522340553');
INSERT INTO `t_admin_log` VALUES ('1183', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522340567');
INSERT INTO `t_admin_log` VALUES ('1184', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1522340569');
INSERT INTO `t_admin_log` VALUES ('1185', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1522340571');
INSERT INTO `t_admin_log` VALUES ('1186', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522340571');
INSERT INTO `t_admin_log` VALUES ('1187', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522340573');
INSERT INTO `t_admin_log` VALUES ('1188', 'admin', 'Member', 'register', '?/admin/Member/register', '1', 'admin', '2130706433', '1522340574');
INSERT INTO `t_admin_log` VALUES ('1189', 'admin', 'Member', 'register', '?/admin/Member/register', '1', 'admin', '2130706433', '1522340580');
INSERT INTO `t_admin_log` VALUES ('1190', 'admin', 'Bonus', 'add', '?/admin/bonus/add', '1', 'admin', '2130706433', '1522340582');
INSERT INTO `t_admin_log` VALUES ('1191', 'admin', 'Member', 'register', '?/admin/Member/register', '1', 'admin', '2130706433', '1522340583');
INSERT INTO `t_admin_log` VALUES ('1192', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522340585');
INSERT INTO `t_admin_log` VALUES ('1193', 'admin', 'Bonus', 'add', '?/admin/bonus/add', '1', 'admin', '2130706433', '1522340588');
INSERT INTO `t_admin_log` VALUES ('1194', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522340590');
INSERT INTO `t_admin_log` VALUES ('1195', 'admin', 'Index', 'favicon.ico', '?/admin/index/favicon.ico', '1', 'admin', '2130706433', '1522340657');
INSERT INTO `t_admin_log` VALUES ('1196', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1522340659');
INSERT INTO `t_admin_log` VALUES ('1197', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1522340685');
INSERT INTO `t_admin_log` VALUES ('1198', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1522340692');
INSERT INTO `t_admin_log` VALUES ('1199', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1522340770');
INSERT INTO `t_admin_log` VALUES ('1200', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1522340775');
INSERT INTO `t_admin_log` VALUES ('1201', 'admin', 'Group', 'favicon.ico', '?/admin/Group/favicon.ico', '1', 'admin', '2130706433', '1522340776');
INSERT INTO `t_admin_log` VALUES ('1202', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '1', 'admin', '2130706433', '1522340778');
INSERT INTO `t_admin_log` VALUES ('1203', 'admin', 'Admin', 'favicon.ico', '?/admin/Admin/favicon.ico', '1', 'admin', '2130706433', '1522340778');
INSERT INTO `t_admin_log` VALUES ('1204', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1522340780');
INSERT INTO `t_admin_log` VALUES ('1205', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '1', 'admin', '2130706433', '1522340784');
INSERT INTO `t_admin_log` VALUES ('1206', 'admin', 'Bonus', 'add', '?/admin/bonus/add', '1', 'admin', '2130706433', '1522340786');
INSERT INTO `t_admin_log` VALUES ('1207', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '1', 'admin', '2130706433', '1522340789');
INSERT INTO `t_admin_log` VALUES ('1208', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1522340790');
INSERT INTO `t_admin_log` VALUES ('1209', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1522340793');
INSERT INTO `t_admin_log` VALUES ('1210', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1522340796');
INSERT INTO `t_admin_log` VALUES ('1211', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '1', 'admin', '2130706433', '1522340798');
INSERT INTO `t_admin_log` VALUES ('1212', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1522340805');
INSERT INTO `t_admin_log` VALUES ('1213', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '1', 'admin', '2130706433', '1522340807');
INSERT INTO `t_admin_log` VALUES ('1214', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522340808');
INSERT INTO `t_admin_log` VALUES ('1215', 'admin', 'Member', 'favicon.ico', '?/admin/Member/favicon.ico', '1', 'admin', '2130706433', '1522340808');
INSERT INTO `t_admin_log` VALUES ('1216', 'admin', 'Bonus', 'add', '?/admin/bonus/add', '1', 'admin', '2130706433', '1522340811');
INSERT INTO `t_admin_log` VALUES ('1217', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522340817');
INSERT INTO `t_admin_log` VALUES ('1218', 'admin', 'Menu', 'favicon.ico', '?/admin/Menu/favicon.ico', '1', 'admin', '2130706433', '1522340819');
INSERT INTO `t_admin_log` VALUES ('1219', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1522340820');
INSERT INTO `t_admin_log` VALUES ('1220', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1522340830');
INSERT INTO `t_admin_log` VALUES ('1221', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1522340842');
INSERT INTO `t_admin_log` VALUES ('1222', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '1', 'admin', '2130706433', '1522340844');
INSERT INTO `t_admin_log` VALUES ('1223', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522340853');
INSERT INTO `t_admin_log` VALUES ('1224', 'admin', 'Bonus', 'favicon.ico', '?/admin/bonus/favicon.ico', '1', 'admin', '2130706433', '1522340853');
INSERT INTO `t_admin_log` VALUES ('1225', 'admin', 'Menu', 'info', '?/admin/menu/info/id/33.html', '1', 'admin', '2130706433', '1522340868');
INSERT INTO `t_admin_log` VALUES ('1226', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1522340869');
INSERT INTO `t_admin_log` VALUES ('1227', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1522340882');
INSERT INTO `t_admin_log` VALUES ('1228', 'admin', 'Menu', 'info', '?/admin/menu/info/id/33.html', '1', 'admin', '2130706433', '1522340884');
INSERT INTO `t_admin_log` VALUES ('1229', 'admin', 'Menu', 'info', '?/admin/menu/info/id/favicon.ico', '1', 'admin', '2130706433', '1522340884');
INSERT INTO `t_admin_log` VALUES ('1230', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1522341150');
INSERT INTO `t_admin_log` VALUES ('1231', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1522341472');
INSERT INTO `t_admin_log` VALUES ('1232', 'admin', 'Log', 'favicon.ico', '?/admin/Log/favicon.ico', '1', 'admin', '2130706433', '1522341478');
INSERT INTO `t_admin_log` VALUES ('1233', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522341479');
INSERT INTO `t_admin_log` VALUES ('1234', 'admin', 'Member', 'register', '?/admin/Member/register', '1', 'admin', '2130706433', '1522341481');
INSERT INTO `t_admin_log` VALUES ('1235', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522341483');
INSERT INTO `t_admin_log` VALUES ('1236', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522341484');
INSERT INTO `t_admin_log` VALUES ('1237', 'admin', 'Member', 'register', '?/admin/Member/register', '1', 'admin', '2130706433', '1522341485');
INSERT INTO `t_admin_log` VALUES ('1238', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting', '1', 'admin', '2130706433', '1522341488');
INSERT INTO `t_admin_log` VALUES ('1239', 'admin', 'Bonus', 'add', '?/admin/bonus/add', '1', 'admin', '2130706433', '1522341490');
INSERT INTO `t_admin_log` VALUES ('1240', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting.html', '1', 'admin', '2130706433', '1522341493');
INSERT INTO `t_admin_log` VALUES ('1241', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting.html', '1', 'admin', '2130706433', '1522341735');
INSERT INTO `t_admin_log` VALUES ('1242', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting.html', '1', 'admin', '2130706433', '1522341736');
INSERT INTO `t_admin_log` VALUES ('1243', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting.html', '1', 'admin', '2130706433', '1522341758');
INSERT INTO `t_admin_log` VALUES ('1244', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting.html', '1', 'admin', '2130706433', '1522341788');
INSERT INTO `t_admin_log` VALUES ('1245', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting.html', '1', 'admin', '2130706433', '1522341792');
INSERT INTO `t_admin_log` VALUES ('1246', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting.html', '1', 'admin', '2130706433', '1522341797');
INSERT INTO `t_admin_log` VALUES ('1247', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting.html', '1', 'admin', '2130706433', '1522341805');
INSERT INTO `t_admin_log` VALUES ('1248', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1522341808');
INSERT INTO `t_admin_log` VALUES ('1249', 'admin', 'Bonus', 'setting', '?/admin/bonus/setting.html', '1', 'admin', '2130706433', '1522341810');
INSERT INTO `t_admin_log` VALUES ('1250', 'admin', 'Member', 'index', '?/admin/Member/index', '1', 'admin', '2130706433', '1522341811');
INSERT INTO `t_admin_log` VALUES ('1251', 'admin', 'Member', 'register', '?/admin/Member/register', '1', 'admin', '2130706433', '1522341813');
INSERT INTO `t_admin_log` VALUES ('1252', 'admin', 'Member', 'register', '?/admin/Member/register', '1', 'admin', '2130706433', '1522342605');
INSERT INTO `t_admin_log` VALUES ('1253', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1522342608');
INSERT INTO `t_admin_log` VALUES ('1254', 'admin', 'Member', 'register', '?/admin/Member/register', '1', 'admin', '2130706433', '1522342609');
INSERT INTO `t_admin_log` VALUES ('1255', 'admin', 'Member', 'register', '?/admin/Member/register', '1', 'admin', '2130706433', '1522343160');
INSERT INTO `t_admin_log` VALUES ('1256', 'admin', 'Member', 'assets', '?/admin/Member/assets/js/jquery.mobile.custom.min.js', '1', 'admin', '2130706433', '1522343160');

-- ----------------------------
-- Table structure for t_authorize
-- ----------------------------
DROP TABLE IF EXISTS `t_authorize`;
CREATE TABLE `t_authorize` (
  `Id` longtext,
  `RoleId` longtext,
  `MenuActionId` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_balance
-- ----------------------------

-- ----------------------------
-- Table structure for t_bonus_parameter
-- ----------------------------
DROP TABLE IF EXISTS `t_bonus_parameter`;
CREATE TABLE `t_bonus_parameter` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Max` double DEFAULT NULL,
  `Min` double DEFAULT NULL,
  `Percent` double DEFAULT NULL,
  `Give` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_bonus_parameter
-- ----------------------------
INSERT INTO `t_bonus_parameter` VALUES ('1', '账户激活', '0', '2', null, '2');
INSERT INTO `t_bonus_parameter` VALUES ('2', '节点算力', null, '200030', '0.3', null);
INSERT INTO `t_bonus_parameter` VALUES ('3', '奖金日封顶', '5000', null, '50', null);
INSERT INTO `t_bonus_parameter` VALUES ('4', '本币', null, null, '0.4', null);
INSERT INTO `t_bonus_parameter` VALUES ('5', '奖金发放', null, null, '1002', null);

-- ----------------------------
-- Table structure for t_bonus_setting
-- ----------------------------
DROP TABLE IF EXISTS `t_bonus_setting`;
CREATE TABLE `t_bonus_setting` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Max` double DEFAULT NULL,
  `Min` double DEFAULT NULL,
  `Percent` double DEFAULT NULL,
  `Type` tinyint(1) DEFAULT '0' COMMENT '0智能算力',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_bonus_setting
-- ----------------------------
INSERT INTO `t_bonus_setting` VALUES ('1', '100', '0', '23', '0');
INSERT INTO `t_bonus_setting` VALUES ('2', '100', '0', '44', '1');
INSERT INTO `t_bonus_setting` VALUES ('3', '300', '100', '3', '0');
INSERT INTO `t_bonus_setting` VALUES ('4', '500', '300', '0.13', '0');
INSERT INTO `t_bonus_setting` VALUES ('5', '0', '600', '0.3', '0');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_deliveryaddress
-- ----------------------------

-- ----------------------------
-- Table structure for t_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_detail`;
CREATE TABLE `t_detail` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `WalletAdress` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AddTime` int(11) DEFAULT NULL,
  `Way` tinyint(1) DEFAULT '0' COMMENT '0发送1接收',
  `Type` tinyint(1) DEFAULT '0' COMMENT '0在线1离线',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_detail
-- ----------------------------
INSERT INTO `t_detail` VALUES ('1', '30', '12', '04db54f4c10b467e5e1cff80d40c3449', '1522735848', '1', '0');
INSERT INTO `t_detail` VALUES ('5', '30', '24', '04db54f4c10b467e5e1cff80d40c3449', '1522736140', '1', '0');
INSERT INTO `t_detail` VALUES ('6', '19', '21.23', '1', '1522736140', '0', '0');
INSERT INTO `t_detail` VALUES ('7', '30', '121', '04db54f4c10b467e5e1cff80d40c3449', '1522736583', '1', '0');
INSERT INTO `t_detail` VALUES ('8', '19', '121', '1', '1522736583', '0', '0');
INSERT INTO `t_detail` VALUES ('9', '30', '121', '04db54f4c10b467e5e1cff80d40c3449', '1522736675', '1', '0');
INSERT INTO `t_detail` VALUES ('10', '19', '121', '1', '1522736675', '0', '0');
INSERT INTO `t_detail` VALUES ('11', '30', '123', '04db54f4c10b467e5e1cff80d40c3449', '1522737970', '1', '0');
INSERT INTO `t_detail` VALUES ('12', '19', '123', '1', '1522737970', '0', '0');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_financialsummary
-- ----------------------------

-- ----------------------------
-- Table structure for t_gas_log
-- ----------------------------
DROP TABLE IF EXISTS `t_gas_log`;
CREATE TABLE `t_gas_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `AddTime` int(11) DEFAULT NULL,
  `Type` tinyint(1) DEFAULT '0' COMMENT '0兑换1转账消耗',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_gas_log
-- ----------------------------
INSERT INTO `t_gas_log` VALUES ('1', '29', '312', '1343252432', '0');
INSERT INTO `t_gas_log` VALUES ('2', '19', '12', '1522738442', '0');
INSERT INTO `t_gas_log` VALUES ('3', '19', '12', '1522738479', '0');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

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
INSERT INTO `t_menu` VALUES ('30', '财务管理', null, '0', '', null, null, 'Current', '', '', null, null, '999', '1', null);
INSERT INTO `t_menu` VALUES ('31', '手工充值扣款', null, '30', '', null, null, 'Current', 'operation', '', null, null, '999', '1', null);
INSERT INTO `t_menu` VALUES ('32', '货币管理', null, '30', '', null, null, 'Current', 'manager', '', null, null, '999', '1', null);
INSERT INTO `t_menu` VALUES ('33', '奖金管理', null, '0', '', null, null, 'bonus', '', '', null, null, '999', '1', null);
INSERT INTO `t_menu` VALUES ('34', '离线发送', null, '30', '', null, null, 'Current', 'send', '', null, null, '999', '1', null);
INSERT INTO `t_menu` VALUES ('35', '货币兑换', null, '30', '', null, null, 'Current', 'exchanage', '', null, null, '999', '1', null);
INSERT INTO `t_menu` VALUES ('36', '财务明细', null, '30', '', null, null, 'Current', 'info', '', null, null, '999', '1', null);
INSERT INTO `t_menu` VALUES ('37', '财务报表', null, '30', '', null, null, 'Current', 'table', '', null, null, '999', '1', null);
INSERT INTO `t_menu` VALUES ('38', '公告管理', null, '0', '', null, null, 'Notice', '', '', null, null, '999', '1', null);
INSERT INTO `t_menu` VALUES ('39', '注册会员', null, '24', '', null, null, 'Member', 'register', '', null, null, '999', '1', null);
INSERT INTO `t_menu` VALUES ('41', '编辑', null, '24', '', null, null, 'Member', 'edit', '', null, null, '999', '2', '1522115649');
INSERT INTO `t_menu` VALUES ('42', '删除', null, '24', '', null, null, 'Member', 'del', '', null, null, '999', '2', null);
INSERT INTO `t_menu` VALUES ('43', '查看详情', null, '24', '', null, null, 'Member', 'info', '', null, null, '999', '2', null);
INSERT INTO `t_menu` VALUES ('44', '重置密码', null, '24', '', null, null, 'Member', 'reset', '', null, null, '999', '2', null);
INSERT INTO `t_menu` VALUES ('45', '操作（锁定）', null, '24', '', null, null, 'Member', 'operation', '', null, null, '999', '2', null);
INSERT INTO `t_menu` VALUES ('46', '奖金设置', null, '33', '', null, null, 'bonus', 'setting', '', null, null, '999', '1', null);
INSERT INTO `t_menu` VALUES ('47', '添加奖金设置', null, '33', '', null, null, 'bonus', 'add', '', null, null, '999', '1', null);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menutype
-- ----------------------------

-- ----------------------------
-- Table structure for t_mess
-- ----------------------------
DROP TABLE IF EXISTS `t_mess`;
CREATE TABLE `t_mess` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) DEFAULT NULL,
  `Title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Mobile` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Content` text COLLATE utf8_unicode_ci,
  `Type` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_mess
-- ----------------------------
INSERT INTO `t_mess` VALUES ('1', null, '312', '15283827970', '423', '123');
INSERT INTO `t_mess` VALUES ('2', null, '312', '15283827970', '423', '123');
INSERT INTO `t_mess` VALUES ('3', '19', '312', '15283827970', '423', '123');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_messagebody
-- ----------------------------

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(200) DEFAULT NULL,
  `Content` longtext,
  `CreateDate` int(11) DEFAULT NULL,
  `LastModifyDate` int(11) DEFAULT NULL,
  `Type` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shoppingcart
-- ----------------------------

-- ----------------------------
-- Table structure for t_sl_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sl_log`;
CREATE TABLE `t_sl_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Userid` int(11) DEFAULT NULL,
  `SL` double DEFAULT NULL,
  `Release` double DEFAULT NULL,
  `AddTime` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0' COMMENT '0智能算力1节点算力2链接算力',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_sl_log
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `JiHuoDate` int(11) DEFAULT NULL,
  `JiHuoKouKuanId` int(11) DEFAULT NULL,
  `IsValid` tinyint(4) DEFAULT '0' COMMENT '0未激活',
  `IsLock` tinyint(4) DEFAULT '0',
  `SecretSecurityId` int(11) DEFAULT NULL,
  `SecretSecurityMatchText` varchar(255) DEFAULT NULL,
  `TimeStamp` tinyblob,
  `ID_Number` varchar(50) DEFAULT NULL,
  `Mobile` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Isjiaoyi` tinyint(4) DEFAULT '0',
  `WalletAddress` longtext NOT NULL,
  `Titleid` int(11) DEFAULT NULL,
  `isDOUT` tinyint(4) DEFAULT NULL,
  `ImageUrl` varchar(200) DEFAULT NULL,
  `WallImageUrl` varchar(200) DEFAULT NULL COMMENT '推荐码',
  `WallImageUrlapp` varchar(200) DEFAULT NULL,
  `TJtoken` varchar(8) NOT NULL,
  `IsFull` tinyint(1) NOT NULL DEFAULT '0',
  `Ranks` text,
  `JTRanks` text,
  `RanksTime` int(11) DEFAULT NULL,
  `WalletAdress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '123', '123', '123', null, null, null, '1', '', null, null, null, null, '16', '17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-26 13:41:21', null, null, '0', null, null, null, null, null, null, null, '15283827970', null, null, '', null, null, null, null, null, '123', '3', '0,2,3,11,14,16,17,18,19,20,23,24,26,27,28,29', null, null, null);
INSERT INTO `t_user` VALUES ('2', '3', '33', '44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-26 13:33:20', null, null, '0', null, null, '0', null, null, null, null, null, null, null, '', null, null, null, null, null, '', '3', '0,3,26', null, null, null);
INSERT INTO `t_user` VALUES ('3', '32', '42', '234', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 11:29:12', null, null, '0', null, null, '0', null, null, null, null, null, null, null, '', null, null, null, null, null, '', '3', null, null, null, null);
INSERT INTO `t_user` VALUES ('4', null, '123', '45431598ccd1e9cf2fc678d423b89c9e', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-26 13:41:21', null, null, '0', null, null, '0', null, null, null, null, '', null, null, '', null, null, null, null, null, '633c6e6', '0', '0,11,14,16,17,18,19,20,23,24,26,27,28,29', null, null, null);
INSERT INTO `t_user` VALUES ('5', null, '', '3a9d933c8d8ab6338805d7f1d843cb89', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 12:01:41', null, null, '0', null, null, '0', null, null, null, null, '', null, null, '', null, null, null, null, null, 'fc5f3e9', '0', null, null, null, null);
INSERT INTO `t_user` VALUES ('6', null, '', 'bb1224976d44d1db64d9b2a0db7991f1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-26 13:41:21', null, null, '0', null, null, '0', null, null, null, null, '', null, null, '', null, null, null, null, null, '', '0', '0,11,14,16,17,18,19,20,23,24,26,27,28,29', null, null, null);
INSERT INTO `t_user` VALUES ('7', null, '', '2c777e5b6dfd2504b66fb77488e8ca70', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 12:02:57', null, null, '0', null, null, '0', null, null, null, null, '', null, null, '', null, null, null, null, null, '48e0089c', '0', null, null, null, null);
INSERT INTO `t_user` VALUES ('30', null, '435d', '6ab74d2d5e66db4323bc685f79667293', null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-27 18:24:15', '1', null, '1522146255', null, '0', '0', null, null, null, null, '15283827970', null, '0', '', null, null, null, null, null, 'd1ea33d4', '0', '0', null, null, '04db54f4c10b467e5e1cff80d40c3449');
INSERT INTO `t_user` VALUES ('9', null, '2343', 'a886a6f93ce544ad6689e33fb576e47e', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 12:05:14', null, null, '0', null, null, '0', null, null, null, null, '', null, null, '', null, null, null, null, null, '35d20189', '0', null, null, null, null);
INSERT INTO `t_user` VALUES ('11', null, '带我去', 'a829fbf65466441a0ab78d24cd947827', null, null, null, null, null, null, null, null, null, '18', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-26 13:41:21', null, null, '0', null, null, '0', null, null, null, null, '', null, null, '', null, null, null, null, null, '3d46091', '0', '0,2,3,11,14,16,17,18,19,20,23,24,26,27,28,29', null, null, null);
INSERT INTO `t_user` VALUES ('12', null, '要的', 'd0fadd6d5559c85e2e368eb4ba88ab4a', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 22:55:26', null, null, '0', null, null, '0', null, null, null, null, '15283827971', null, null, '', null, null, null, null, null, '47058379', '0', '0', null, null, null);
INSERT INTO `t_user` VALUES ('13', null, '要的', 'f5860d7420c1968893391e450bd86a32', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 22:55:28', null, null, '0', null, null, '0', null, null, null, null, '15283827971', null, null, '', null, null, null, null, null, 'b4752064', '0', '0', null, null, null);
INSERT INTO `t_user` VALUES ('14', null, '要的', '58f6969f979f1919ab12c17d9e8651de', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 22:55:30', null, null, '0', null, null, '0', null, null, null, null, '15283827971', null, null, '', null, null, null, null, null, '938daa24', '0', '0', null, null, null);
INSERT INTO `t_user` VALUES ('15', null, '带我去分', '856dd2c9bcb118ef4b31fbd04338f1e0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 22:55:32', null, null, '0', null, null, '0', null, null, null, null, '15283827971', null, null, '', null, null, null, null, null, 'f245df41', '0', '0', null, null, null);
INSERT INTO `t_user` VALUES ('16', null, 'ewfew', '8b1318d0f63162b6ed94c6bc23e416ce', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 22:55:34', null, null, '0', null, null, '0', null, null, null, null, '15283827971', null, null, '', null, null, null, null, null, 'd2c0baa7', '0', '0', null, null, null);
INSERT INTO `t_user` VALUES ('17', null, '我确定', '7ab3aebd195c631d6d68c165b0894c56', null, null, null, null, null, null, null, null, null, '19', '20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-26 13:41:21', null, null, '0', null, null, '0', null, null, null, null, '15283827971', null, null, '', null, null, null, null, null, '7f70e2be', '3', '0,19,20,23,24,26,27,28,29', null, null, null);
INSERT INTO `t_user` VALUES ('18', null, '微服务', 'a88b110ae47749c373f3f0b4c288f2c7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 22:55:38', null, null, '0', null, null, '0', null, null, null, null, '15283827971', null, null, '', null, null, null, null, null, 'ebd5004a', '0', '0', null, null, null);
INSERT INTO `t_user` VALUES ('19', null, '啊', '574dfc3623c821452d098d73dfcd4e42', '574dfc3623c821452d098d73dfcd4e42', null, null, '5', null, null, null, null, null, '23', '28', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-04-03 13:01:42', null, null, '0', null, null, '0', null, null, null, null, '15283827923', null, null, '', null, null, null, null, null, 'e1bd8752', '3', '0,23,26,28,29', '0', '1522388009', '1');
INSERT INTO `t_user` VALUES ('20', null, '的', '60239b0d74aaef50dafe47354827cbfe', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 22:55:42', null, null, '0', null, null, '0', null, null, null, null, '15283827971', null, null, '', null, null, null, null, null, '2c63214e', '0', '0', null, null, null);
INSERT INTO `t_user` VALUES ('21', null, '收到', 'bace5401a4ca10d53bd6b5a7b3a75ff1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-27 10:52:57', null, null, '1524585600', null, null, '0', null, null, null, null, '15283827970', null, null, '', null, null, null, null, null, 'e6ae13c6', '0', '0', null, null, null);
INSERT INTO `t_user` VALUES ('22', null, '打算', 'b1c539da656f93c112c5343ae6a3d74e', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 23:03:27', null, null, '0', null, null, '0', null, null, null, null, '15283827970', null, null, '', null, null, null, null, null, 'd3494509', '0', '0', null, null, null);
INSERT INTO `t_user` VALUES ('23', null, 'ad打算', 'e4f978c1db70a224c27bfce6f4ea1d61', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '29', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-26 13:41:21', null, null, '0', null, null, '0', null, null, null, null, '15283827970', null, null, '', null, null, null, null, null, '86af651a', '2', '0,29', null, null, null);
INSERT INTO `t_user` VALUES ('24', null, '较大', '0727459fcfd3a5d59d7c02ee17d88fb7', null, null, null, '1', '19', null, '啊', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-26 13:28:00', null, null, '0', null, null, '0', null, null, null, null, '15283827970', null, null, '', null, null, null, null, null, '4cd61485', '0', '0', null, null, null);
INSERT INTO `t_user` VALUES ('26', null, '较大2', '59b974430619b85a55f57bcaa34ec08f', null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-27 16:25:11', null, null, '1521043200', null, null, '0', null, null, null, null, '15283827970', null, null, '', null, null, null, null, null, '39a9cc3a', '0', '0', null, null, null);
INSERT INTO `t_user` VALUES ('27', null, 'qw十大', 'a46d6372ec286b1957ccd0d32d90dcb7', null, null, null, '6', '19', null, '啊', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-26 13:37:30', null, null, '0', null, null, '0', null, null, null, null, '15283827970', null, null, '', null, null, null, null, null, 'c0b7c83b', '0', '0', null, null, null);
INSERT INTO `t_user` VALUES ('28', null, '123wer', '6c76e95072a0031088efcfc6370a62b9', null, null, null, '6', '19', null, '啊', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-27 12:08:56', null, null, '1521043200', null, null, '0', null, null, null, null, '15283827970', null, null, '', null, null, null, null, null, '31712362', '0', '0', null, null, null);
INSERT INTO `t_user` VALUES ('29', null, 'sadas的', '7fdb5acc6d0b30408f426f540aca3e4e', null, null, null, '6', '19', null, '啊', null, null, null, null, '23', null, 'ad打算', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-27 12:08:51', null, null, '0', null, null, '0', null, null, null, null, '15283827970', null, '0', '', null, null, null, null, null, '7d9adbbf', '0', '0', null, null, null);
INSERT INTO `t_user` VALUES ('31', null, 'ewqe23', 'ee9123e5e7055b8bb4ac4be65d565525', null, null, null, '1', null, null, null, null, null, '32', '36', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-30 13:33:52', '1', null, '1522146304', null, '0', '0', null, null, null, null, '15283827970', null, '0', '', null, null, null, null, null, '4c555177', '3', '0,32,36', '36', '1522388009', 'd4191aac171b528e326ab3491873c925');
INSERT INTO `t_user` VALUES ('32', null, 'adsa2', '19f8552454abb90fc767b69a4f160fa8', null, null, null, '2', '31', null, 'ewqe23', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-27 18:26:23', '1', null, '1522146383', null, '0', '0', null, null, null, null, '15283827970', null, '0', '', null, null, null, null, null, 'e64e4b1', '0', '0', null, null, 'e3b8d988bd48def0c10de8b93b84a68f');
INSERT INTO `t_user` VALUES ('33', null, '435', '123123', null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-27 20:43:40', '1', null, '1522146478', null, '0', '0', null, null, null, null, '15283827974', null, '0', '', null, null, null, null, null, '852c8ba6', '0', '0', null, null, '12314');
INSERT INTO `t_user` VALUES ('36', null, '123435', '0d14b7f7aa907883cdf34c9bdebbc1f4', null, null, null, '2', '31', null, 'ewqe23', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-30 13:33:29', '0', null, null, null, '0', '0', null, null, null, null, '15283827970', null, '0', '', null, null, null, null, null, '7d48d1df', '0', '0', '0', '1522388009', 'aa4d2f7aa65daa2074b5187c7114f7f4');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userbankaccount
-- ----------------------------

-- ----------------------------
-- Table structure for t_wallet
-- ----------------------------
DROP TABLE IF EXISTS `t_wallet`;
CREATE TABLE `t_wallet` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) DEFAULT NULL,
  `CurrencyId` int(11) DEFAULT NULL,
  `Amount` double DEFAULT '0',
  `Gas` double DEFAULT '0',
  `Release` double DEFAULT '0',
  `UpdateTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_wallet
-- ----------------------------
INSERT INTO `t_wallet` VALUES ('1', '19', null, '342', '3600', '121', '1522737970');
INSERT INTO `t_wallet` VALUES ('2', '30', null, '266', '0', '123', '1522737970');

-- ----------------------------
-- Table structure for __migrationhistory
-- ----------------------------
DROP TABLE IF EXISTS `__migrationhistory`;
CREATE TABLE `__migrationhistory` (
  `MigrationId` varchar(150) DEFAULT NULL,
  `ContextKey` varchar(255) DEFAULT NULL,
  `Model` longblob,
  `ProductVersion` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __migrationhistory
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
