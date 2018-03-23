/*
Navicat MySQL Data Transfer

Source Server         : demo
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : mem

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-03-23 11:02:17
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
  `Id` longtext,
  `AdminCode` varchar(50) DEFAULT NULL,
  `NickName` varchar(50) DEFAULT NULL,
  `L1Pwd` varchar(255) DEFAULT NULL,
  `L2Pwd` varchar(255) DEFAULT NULL,
  `L3Pwd` varchar(255) DEFAULT NULL,
  `IsLock` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------

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
  `Id` longtext,
  `MenuName` varchar(50) DEFAULT NULL,
  `MenuUrl` varchar(255) DEFAULT NULL,
  `MenuIcon` varchar(50) DEFAULT NULL,
  `MenuTypeId` longtext,
  `MenuSequenceNum` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------

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
  `JiHuoMemberType` int(11) DEFAULT NULL,
  `JiHuoMemberId` longtext,
  `JiHuoDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `JiHuoKouKuanId` int(11) DEFAULT NULL,
  `IsValid` tinyint(4) DEFAULT NULL,
  `IsLock` tinyint(4) DEFAULT '0',
  `SecretSecurityId` int(11) DEFAULT NULL,
  `SecretSecurityMatchText` varchar(255) DEFAULT NULL,
  `TimeStamp` tinyblob,
  `ID_Number` varchar(50) DEFAULT NULL,
  `Mobile` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Isjiaoyi` tinyint(4) DEFAULT NULL,
  `WalletAddress` longtext,
  `Titleid` int(11) DEFAULT NULL,
  `isDOUT` tinyint(4) DEFAULT NULL,
  `ImageUrl` varchar(200) DEFAULT NULL,
  `WallImageUrl` varchar(200) DEFAULT NULL COMMENT '推荐码',
  `WallImageUrlapp` varchar(200) DEFAULT NULL,
  `TJtoken` varchar(8) NOT NULL,
  `IsFull` tinyint(1) NOT NULL DEFAULT '0',
  `Ranks` text,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '123', '123', '123', null, null, null, null, '', null, null, null, null, '2', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 10:31:29', null, null, '0000-00-00 00:00:00', null, null, null, null, null, null, null, '15283827970', null, null, null, null, null, null, null, null, '123', '0', '2,3');
INSERT INTO `t_user` VALUES ('2', '3', '33', '44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 10:30:35', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '', '0', null);
INSERT INTO `t_user` VALUES ('3', '32', '42', '234', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-03-23 10:31:08', null, null, '0000-00-00 00:00:00', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '', '0', null);

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
