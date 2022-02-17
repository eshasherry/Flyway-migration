-- MySQL dump 10.13  Distrib 5.5.16, for osx10.5 (i386)
--
-- Host: localhost    Database: hrnx
-- ------------------------------------------------------
-- Server version	5.5.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `q_processing`
--
DROP TABLE IF EXISTS `q_processing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `q_processing` (
  `txn_id` varchar(45) NOT NULL,
  `friendly_id` int(10) unsigned DEFAULT NULL,
  `req_timedatestamp` datetime NOT NULL,
  `last_hrnx_attempt` datetime DEFAULT NULL,
  `hrnx_status` varchar(45) DEFAULT NULL,
  `client_group_id` varchar(45) NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `tp_uqid` varchar(100) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `ip_address` varchar(100) NOT NULL,
  `destination_url` varchar(255) DEFAULT NULL,
  `session_id` varchar(45) DEFAULT NULL,
  `version` tinyint(1) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `attempt` tinyint(1) unsigned DEFAULT NULL,
  `payload_hrnx` mediumtext,
  `tp_activity_uqid` varchar(100) DEFAULT NULL,
  KEY `index1` (`txn_id`) USING BTREE,
  KEY `client_group` (`client_group_id`),
  KEY `status` (`hrnx_status`),
  KEY `activity_id` (`tp_activity_uqid`),
  KEY `date` (`req_timedatestamp`),
  KEY `candidate_id` (`tp_uqid`),
  KEY `candidate_client` (`client_group_id`,`tp_uqid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eula`
--

DROP TABLE IF EXISTS `eula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eula` (
  `eula_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `client_group_id` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `eula_rev_date` datetime NOT NULL,
  `eula_html` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`eula_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trading_partners_old`
--

DROP TABLE IF EXISTS `trading_partners_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trading_partners_old` (
  `partner_id` varchar(45) NOT NULL,
  `partner_name` varchar(255) DEFAULT NULL,
  `partner_type` varchar(45) DEFAULT NULL,
  `password` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `logo_large` blob,
  `logo_small` blob,
  `contact_info` text,
  `enabled` tinyint(1) DEFAULT NULL,
  `logo_sp` blob,
  PRIMARY KEY (`partner_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mappings_login`
--

DROP TABLE IF EXISTS `mappings_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mappings_login` (
  `mapping_login_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_group_id` varchar(45) DEFAULT NULL,
  `client_user_id` varchar(255) DEFAULT NULL,
  `service_element_name` varchar(255) DEFAULT NULL,
  `service_tp_id` varchar(255) DEFAULT NULL,
  `service_tp_pw` varchar(255) DEFAULT NULL,
  `service_id1` varchar(255) DEFAULT NULL,
  `service_pw1` varchar(255) DEFAULT NULL,
  `service_id2` varchar(255) DEFAULT NULL,
  `service_pw2` varchar(255) DEFAULT NULL,
  `rowEnc` tinyint(1) unsigned DEFAULT NULL,
  `enabled` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`mapping_login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1679 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings_endpoints`
--

DROP TABLE IF EXISTS `settings_endpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_endpoints` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `endpoint_category` varchar(45) NOT NULL,
  `partner_id` varchar(45) NOT NULL,
  `client_group_id` varchar(45) DEFAULT NULL,
  `address_preprocessing` text,
  `address` text,
  `endpoint_type` varchar(45) DEFAULT NULL,
  `endpoint_options` varchar(255) DEFAULT NULL,
  `retry` int(10) unsigned DEFAULT NULL,
  `retry_delay` int(11) DEFAULT NULL,
  `timeout_action` varchar(45) DEFAULT NULL,
  `timeout_duration` int(10) unsigned DEFAULT NULL,
  `port` int(10) unsigned DEFAULT NULL,
  `direction` varchar(45) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `critical` tinyint(1) unsigned DEFAULT NULL,
  `priority` int(10) unsigned DEFAULT NULL,
  `xslt` mediumtext CHARACTER SET utf8 COLLATE utf8_bin,
  `xslt_preprocessing` mediumtext CHARACTER SET utf8 COLLATE utf8_bin,
  `allowed_ips` text CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_users`
--

DROP TABLE IF EXISTS `client_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_users` (
  `user_id` varchar(45) NOT NULL,
  `client_group_id` varchar(45) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `formatted_name` varchar(255) DEFAULT NULL,
  `email_address` varchar(100) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `enabled` tinyint(4) DEFAULT NULL,
  `user_rights` text,
  `user_options` text,
  `user_timezone` tinyint(1) DEFAULT NULL,
  `eula_id_shown` tinyint(3) unsigned DEFAULT NULL,
  `eula_agreed` tinyint(1) DEFAULT NULL,
  `eula_agreed_date` datetime DEFAULT NULL,
  `receive_notifications` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hrnx_status`
--

DROP TABLE IF EXISTS `hrnx_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hrnx_status` (
  `status_id` tinyint(3) unsigned NOT NULL,
  `status_short` varchar(45) DEFAULT NULL,
  `status_text` varchar(150) DEFAULT NULL,
  `status_diz` text,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lookup_quest_collection_sites`
--

DROP TABLE IF EXISTS `lookup_quest_collection_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookup_quest_collection_sites` (
  `SiteCode` varchar(10) NOT NULL,
  `Status` tinyint(3) unsigned DEFAULT NULL,
  `SiteName` varchar(150) NOT NULL,
  `Address1` varchar(150) DEFAULT NULL,
  `Address2` varchar(150) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `ZIP` varchar(20) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Fax` varchar(20) DEFAULT NULL,
  `isPreferred` tinyint(3) unsigned DEFAULT NULL,
  `isElectronicCCF` varchar(1) DEFAULT NULL,
  `Hours` varchar(255) DEFAULT NULL,
  `isThirdParty` tinyint(3) DEFAULT NULL,
  `isPSC` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`SiteCode`),
  KEY `index0` (`SiteCode`),
  KEY `index1` (`ZIP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hrnx_cp_access_log`
--

DROP TABLE IF EXISTS `hrnx_cp_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hrnx_cp_access_log` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_timedatestamp` datetime NOT NULL,
  `attempts_remaining` tinyint(3) DEFAULT NULL,
  `logins_remaining` tinyint(3) DEFAULT NULL,
  `sms_sent_counter` tinyint(3) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `session_id` varchar(45) DEFAULT NULL,
  `tid` varchar(130) DEFAULT NULL,
  `client_group_id` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `security_pin` varchar(10) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `browserAgent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2188 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workflow_details`
--

DROP TABLE IF EXISTS `workflow_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_details` (
  `workflow_detail_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `workflow_group` varchar(45) DEFAULT NULL,
  `partner_id` varchar(45) DEFAULT NULL,
  `workflow_sequence` int(11) DEFAULT NULL,
  `workflow_name` varchar(45) DEFAULT NULL,
  `workflow_diz` varchar(100) DEFAULT NULL,
  `workflow_action` varchar(45) DEFAULT NULL,
  `workflow_content` text NOT NULL,
  `workflow_content_type` varchar(45) NOT NULL,
  PRIMARY KEY (`workflow_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `q_sent`
--

DROP TABLE IF EXISTS `q_sent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `q_sent` (
  `txn_id` varchar(45) NOT NULL,
  `req_timedatestamp` datetime NOT NULL,
  `hrnx_status` varchar(45) DEFAULT NULL,
  `client_group_id` varchar(45) NOT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  `tp_id` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `payload_hrnx` mediumtext,
  `payload_translated` mediumtext,
  `response` mediumtext,
  `endpoint_type` varchar(45) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  KEY `index1` (`txn_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `console_menu`
--

DROP TABLE IF EXISTS `console_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `console_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region` varchar(45) DEFAULT NULL,
  `level` int(10) unsigned DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `href` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `style-class` varchar(45) DEFAULT NULL,
  `isParent` tinyint(1) DEFAULT NULL,
  `ordering` int(10) unsigned DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  `group` varchar(45) DEFAULT NULL,
  `partner_category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lookup_drugreason`
--

DROP TABLE IF EXISTS `lookup_drugreason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookup_drugreason` (
  `id` varchar(45) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `diz` blob,
  `ordering` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keystore`
--

DROP TABLE IF EXISTS `keystore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keystore` (
  `key_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key_name` varchar(45) DEFAULT NULL,
  `key_date` datetime DEFAULT NULL,
  `key_version` int(10) unsigned DEFAULT NULL,
  `key_value` varchar(45) DEFAULT NULL,
  `key_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`key_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank_names`
--

DROP TABLE IF EXISTS `bank_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_names` (
  `name_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_group_id` varchar(45) DEFAULT NULL,
  `client_user` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`name_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_options`
--

DROP TABLE IF EXISTS `payment_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_options` (
  `payment_type_id` varchar(45) NOT NULL,
  `payment_name` varchar(45) DEFAULT NULL,
  `payment_diz` text,
  `ordering` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`payment_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `q_incoming`
--

DROP TABLE IF EXISTS `q_incoming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `q_incoming` (
  `txn_id` varchar(45) CHARACTER SET utf8 NOT NULL,
  `receipt_timedatestamp` datetime NOT NULL,
  `hrnx_status` varchar(45) DEFAULT NULL,
  `retry_left` tinyint(3) DEFAULT NULL,
  `version` tinyint(1) unsigned DEFAULT NULL,
  `tp_id` varchar(45) NOT NULL,
  `source` varchar(45) DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `payload_original` mediumtext,
  `payload_hrnx` mediumtext,
  KEY `index1` (`txn_id`) USING BTREE,
  KEY `index2` (`tp_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hrnx_awacs_access_log`
--

DROP TABLE IF EXISTS `hrnx_awacs_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hrnx_awacs_access_log` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_timedatestamp` datetime NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `action` varchar(100) NOT NULL,
  `session_id` varchar(35) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `browserAgent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB AUTO_INCREMENT=809 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lookup_gender2`
--

DROP TABLE IF EXISTS `lookup_gender2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookup_gender2` (
  `id` varchar(45) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `diz` blob,
  `ordering` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lookup_us_counties`
--

DROP TABLE IF EXISTS `lookup_us_counties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookup_us_counties` (
  `county_state` varchar(10) NOT NULL,
  `county_name` varchar(100) NOT NULL,
  `county_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`county_state`,`county_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lookup_acxiom_zfd`
--

DROP TABLE IF EXISTS `lookup_acxiom_zfd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookup_acxiom_zfd` (
  `zip_code` varchar(45) NOT NULL,
  `state` varchar(45) DEFAULT NULL,
  `county_code` varchar(45) DEFAULT NULL,
  `county_name` varchar(45) DEFAULT NULL,
  `district_id` varchar(45) DEFAULT NULL,
  `district_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`zip_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='zip codes, FIPS codes, district id''s';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credit_cards`
--

DROP TABLE IF EXISTS `credit_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_cards` (
  `cc_id` varchar(45) NOT NULL,
  `cc_name` varchar(100) NOT NULL,
  `logo_path` varchar(100) DEFAULT NULL,
  `ordering` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`cc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tp_users`
--

DROP TABLE IF EXISTS `tp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tp_users` (
  `user_id` varchar(45) NOT NULL,
  `tp_id` varchar(45) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `user_rights` text,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) unsigned DEFAULT NULL,
  `mc_timeout` tinyint(3) DEFAULT NULL,
  `awacs_createdBy` varchar(45) DEFAULT NULL,
  `awacs_createdDate` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timezones`
--

DROP TABLE IF EXISTS `timezones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timezones` (
  `tz_id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `timezone` tinyint(1) NOT NULL,
  `timezone_prefix` varchar(25) DEFAULT NULL,
  `timezone_prefix_dst` varchar(25) DEFAULT NULL,
  `timezone_diz` varchar(100) NOT NULL,
  PRIMARY KEY (`tz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lookup_us_federal_districts`
--

DROP TABLE IF EXISTS `lookup_us_federal_districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookup_us_federal_districts` (
  `district_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `state_code` varchar(45) NOT NULL,
  `district_region` varchar(45) DEFAULT NULL,
  `federal_district` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lookup_zipcodes`
--

DROP TABLE IF EXISTS `lookup_zipcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookup_zipcodes` (
  `zipcode` varchar(5) NOT NULL,
  `long` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  PRIMARY KEY (`zipcode`),
  KEY `index1` (`zipcode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partner_service_mappings`
--

DROP TABLE IF EXISTS `partner_service_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_service_mappings` (
  `partner_service_mapping_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_created` datetime DEFAULT NULL,
  `date_activated` datetime DEFAULT NULL,
  `partner_id` varchar(255) NOT NULL,
  `client_group_id` varchar(45) NOT NULL,
  `client_user_id` varchar(45) DEFAULT NULL,
  `createdUser` varchar(45) DEFAULT NULL,
  `createdTp` varchar(45) DEFAULT NULL,
  `service_categoryid` varchar(255) DEFAULT NULL,
  `service_id` varchar(255) DEFAULT NULL,
  `enabled` tinyint(4) DEFAULT NULL,
  `settings_1` varchar(255) DEFAULT NULL,
  `settings_2` varchar(255) DEFAULT NULL,
  `settings_1_data` text,
  `settings_2_data` text,
  PRIMARY KEY (`partner_service_mapping_id`),
  KEY `index1` (`partner_id`,`client_group_id`,`client_user_id`,`service_categoryid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=944 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `awacs_users`
--

DROP TABLE IF EXISTS `awacs_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awacs_users` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_rights` text,
  `enabled` tinyint(1) unsigned DEFAULT NULL,
  `timeout` mediumint(9) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `fail_count` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hrnx_mc_access_log`
--

DROP TABLE IF EXISTS `hrnx_mc_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hrnx_mc_access_log` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_timedatestamp` datetime NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `action` varchar(100) NOT NULL,
  `session_id` varchar(100) DEFAULT NULL,
  `groupId` varchar(45) NOT NULL,
  `groupType` varchar(45) DEFAULT NULL,
  `userId` varchar(45) NOT NULL,
  `browserAgent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1485 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tp_products`
--

DROP TABLE IF EXISTS `tp_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tp_products` (
  `product_row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` varchar(45) NOT NULL,
  `tp_id` varchar(45) NOT NULL,
  `product_name` varchar(45) DEFAULT NULL,
  `product_version` varchar(10) DEFAULT NULL,
  `product_pw` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`product_row_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `services_category`
--

DROP TABLE IF EXISTS `services_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_category` (
  `service_categoryid` varchar(45) NOT NULL,
  `service_categoryname` varchar(255) DEFAULT NULL,
  `iconfile` varchar(255) DEFAULT NULL,
  `ordering` int(10) unsigned DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`service_categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `client_group_id` varchar(45) NOT NULL,
  `clientname` varchar(255) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `activatedDate` datetime DEFAULT NULL,
  `createdUser` varchar(45) DEFAULT NULL,
  `createdTp` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `groupAuthAllowed` tinyint(1) unsigned DEFAULT NULL,
  `groupAuthLogUser` tinyint(1) unsigned DEFAULT NULL,
  `groupAuthAutoCreateUser` tinyint(1) unsigned DEFAULT NULL,
  `reviewCpSubmission` tinyint(1) unsigned DEFAULT NULL,
  `rowEnc` tinyint(1) unsigned DEFAULT NULL,
  `enabled` tinyint(1) unsigned DEFAULT NULL,
  `timezone` tinyint(1) DEFAULT NULL,
  `tp_product_id` varchar(45) DEFAULT NULL,
  `client_options` text,
  `history` text,
  `eula_id_shown` tinyint(1) unsigned DEFAULT NULL,
  `eula_agreed` tinyint(1) DEFAULT NULL,
  `eula_agreed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`client_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hrnx_access_log`
--

DROP TABLE IF EXISTS `hrnx_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hrnx_access_log` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_timedatestamp` datetime NOT NULL,
  `userId` varchar(45) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `action` varchar(100) NOT NULL,
  `session_id` varchar(45) DEFAULT NULL,
  `groupId` varchar(45) NOT NULL,
  `browserAgent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`row_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9542 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workflows`
--

DROP TABLE IF EXISTS `workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflows` (
  `workflow_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_timedatestamp` datetime NOT NULL,
  `modified_timedatestamp` datetime NOT NULL,
  `owner_user_id` varchar(45) DEFAULT NULL,
  `tp_id` varchar(45) DEFAULT NULL,
  `client_group_id` varchar(45) DEFAULT NULL,
  `client_users` text,
  `workflow_name` varchar(45) DEFAULT NULL,
  `workflow_sequence` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `service_row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` varchar(45) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `services_diz` text,
  `service_tooltip` varchar(255) DEFAULT NULL,
  `service_tp_id` varchar(45) NOT NULL,
  `client_group_id` varchar(45) DEFAULT NULL,
  `client_user_id` varchar(45) DEFAULT NULL,
  `ordering` int(10) unsigned DEFAULT NULL,
  `fields_reqd` text,
  `fields_optl` text,
  `fields_ordering_override` text,
  `service_categoryid` varchar(45) DEFAULT NULL,
  `repeatable` tinyint(1) unsigned DEFAULT NULL,
  `service_parent` varchar(45) DEFAULT NULL,
  `display` tinyint(1) unsigned DEFAULT NULL,
  `disabled` tinyint(1) unsigned DEFAULT NULL,
  `expressOk` tinyint(1) unsigned DEFAULT NULL,
  `version` int(10) unsigned DEFAULT NULL,
  `endpoint_id` int(10) unsigned DEFAULT NULL,
  `instructions_widget` text,
  `instructions_candidate` text,
  `service_settings` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`service_row_id`),
  KEY `index1` (`service_id`,`service_tp_id`,`client_group_id`,`client_user_id`,`service_categoryid`,`service_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3375 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lookup_quest2_mnemonic`
--

DROP TABLE IF EXISTS `lookup_quest2_mnemonic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookup_quest2_mnemonic` (
  `MNEMONIC` varchar(10) NOT NULL,
  `SPE_TYPE` varchar(10) DEFAULT NULL,
  `XML_SpecType` varchar(10) DEFAULT NULL,
  `REQ_NAME` varchar(100) DEFAULT NULL,
  KEY `index1` (`MNEMONIC`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packages` (
  `pkg_id` varchar(45) NOT NULL,
  `pkg_name` varchar(255) DEFAULT NULL,
  `service_id` varchar(100) NOT NULL,
  `client_group_id` varchar(45) NOT NULL,
  `service_tp_id` varchar(45) NOT NULL,
  `ordering` int(10) unsigned DEFAULT NULL,
  `defaultpkg` tinyint(1) DEFAULT NULL,
  `client_username` text,
  `parameters` text,
  `tooltipOrCaption` text,
  `service_min` int(10) unsigned DEFAULT NULL,
  `service_max` int(10) unsigned DEFAULT NULL,
  `adhoc_setting` smallint(5) unsigned DEFAULT NULL,
  `vendor_pkg_id` varchar(45) DEFAULT NULL,
  `version` int(10) unsigned DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`pkg_id`,`service_id`,`client_group_id`,`service_tp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pathways`
--

DROP TABLE IF EXISTS `pathways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pathways` (
  `pathway_row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner_tp_id` varchar(45) NOT NULL,
  `owner_tp_userid` varchar(45) DEFAULT NULL,
  `owner_product` varchar(45) DEFAULT NULL,
  `pathway_tp` varchar(45) NOT NULL,
  `enabled_date` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `version` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`pathway_row_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank_zipcodes`
--

DROP TABLE IF EXISTS `bank_zipcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_zipcodes` (
  `zipcode_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_group_id` varchar(45) DEFAULT NULL,
  `client_user` varchar(45) DEFAULT NULL,
  `zipcode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`zipcode_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trading_partners_category`
--

DROP TABLE IF EXISTS `trading_partners_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trading_partners_category` (
  `category_row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `partner_type` varchar(45) NOT NULL,
  `partner_category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`category_row_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `asset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_name` varchar(45) DEFAULT NULL,
  `asset_diz` varchar(255) DEFAULT NULL,
  `asset_type` varchar(45) DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `ordering` tinyint(3) unsigned DEFAULT NULL,
  `partner_id` varchar(45) DEFAULT NULL,
  `asset_path` varchar(100) DEFAULT NULL,
  `asset_text` text,
  PRIMARY KEY (`asset_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `verify_agent_setting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_group_id` varchar(45) DEFAULT NULL,
  `emailTemplate` text,
  `emailTemplateType` varchar(45) DEFAULT NULL,
  `screenHTML` text,
  `emailSubject` varchar(255) DEFAULT NULL,
  `logo` varchar(45) DEFAULT NULL,
  `background` varchar(45) DEFAULT NULL,
  `onCompletionURL` varchar(255) DEFAULT NULL,
  `enabled` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`verify_agent_setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=499 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `field_row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` varchar(45) NOT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `displayLabel` varchar(255) DEFAULT NULL,
  `field_comments` text,
  `field_type` varchar(255) DEFAULT NULL,
  `field_categoryid` varchar(45) DEFAULT NULL,
  `service_tp_id` varchar(45) DEFAULT NULL,
  `client_group_id` varchar(45) DEFAULT NULL,
  `client_user_id` varchar(45) DEFAULT NULL,
  `sensitivity` tinyint(1) unsigned DEFAULT NULL,
  `ordering` int(10) unsigned DEFAULT NULL,
  `required` tinyint(1) unsigned DEFAULT NULL,
  `disabled` tinyint(1) unsigned DEFAULT NULL,
  `size` int(10) unsigned DEFAULT NULL,
  `maxlength` int(10) unsigned DEFAULT NULL,
  `default_val` varchar(255) DEFAULT NULL,
  `regex_check` varchar(255) DEFAULT NULL,
  `maps_to` varchar(255) DEFAULT NULL,
  `render_row` int(10) unsigned DEFAULT NULL,
  `render_col` int(10) unsigned DEFAULT NULL,
  `customHtml` mediumtext,
  `version` int(10) unsigned DEFAULT NULL,
  `candidate` tinyint(1) DEFAULT NULL,
  `candidate_service` varchar(255) DEFAULT NULL,
  `comments_mc` text CHARACTER SET utf8,
  PRIMARY KEY (`field_row_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1041 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tp_user_rights`
--

DROP TABLE IF EXISTS `tp_user_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tp_user_rights` (
  `rights_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rights_name` varchar(45) NOT NULL,
  `rights_diz` text,
  PRIMARY KEY (`rights_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lookup_order_services`
--

DROP TABLE IF EXISTS `lookup_order_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookup_order_services` (
  `txn_id` varchar(45) NOT NULL,
  `tp_uqid` varchar(45) DEFAULT NULL,
  `tp_activity_uqid` varchar(45) DEFAULT NULL,
  `service` varchar(45) DEFAULT NULL,
  `package` varchar(45) DEFAULT NULL,
  `req_timedatestamp` datetime NOT NULL,
  `client_group_id` varchar(45) DEFAULT NULL,
  KEY `lookup_txn` (`service`,`package`,`txn_id`,`client_group_id`,`req_timedatestamp`),
  KEY `lookup_activity` (`service`,`package`,`tp_activity_uqid`,`client_group_id`,`req_timedatestamp`),
  KEY `lookup_candidate` (`service`,`package`,`tp_uqid`,`client_group_id`,`req_timedatestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `q_email_outbox`
--

DROP TABLE IF EXISTS `q_email_outbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `q_email_outbox` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipients` varchar(255) DEFAULT NULL,
  `txn_id` varchar(45) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text,
  `email_timedatestamp` datetime DEFAULT NULL,
  `sent_timedatestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3433 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hrnx_error_stack`
--

DROP TABLE IF EXISTS `hrnx_error_stack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hrnx_error_stack` (
  `error_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `error_timedatestamp` datetime NOT NULL,
  `error_severity` tinyint(3) unsigned DEFAULT NULL,
  `error_loc` varchar(100) NOT NULL,
  `create_alert` tinyint(3) unsigned DEFAULT NULL,
  `client_group_id` varchar(45) DEFAULT NULL,
  `client_user_id` varchar(45) DEFAULT NULL,
  `service_tp_id` varchar(45) DEFAULT NULL,
  `tp_id` varchar(45) DEFAULT NULL,
  `txn_id` varchar(45) DEFAULT NULL,
  `error_short` varchar(100) NOT NULL,
  `error_long` varchar(255) DEFAULT NULL,
  `error_blob` text,
  `error_blob_2` text,
  `isRead` bit(1) DEFAULT NULL,
  `isReadByTp` bit(1) DEFAULT NULL,
  PRIMARY KEY (`error_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14987 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lookup_us_states`
--

DROP TABLE IF EXISTS `lookup_us_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookup_us_states` (
  `state_code` varchar(45) NOT NULL,
  `state_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`state_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timezones_dst_rules`
--

DROP TABLE IF EXISTS `timezones_dst_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timezones_dst_rules` (
  `dst_start` datetime NOT NULL,
  `dst_end` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partner_custom_questions`
--

DROP TABLE IF EXISTS `partner_custom_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_custom_questions` (
  `partner_question_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `partner_id` varchar(255) NOT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `service_categoryid` varchar(255) DEFAULT NULL,
  `service_id` varchar(255) DEFAULT NULL,
  `required` tinyint(1) unsigned DEFAULT NULL,
  `ordering` int(10) unsigned DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `question_type` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) unsigned DEFAULT NULL,
  `version` tinyint(3) unsigned DEFAULT NULL,
  `defaultVal` varchar(255) DEFAULT NULL,
  `hrnxCallback` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`partner_question_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=499 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trading_partners`
--

DROP TABLE IF EXISTS `trading_partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trading_partners` (
  `partner_id` varchar(45) NOT NULL,
  `partner_name` varchar(255) DEFAULT NULL,
  `date_started` datetime DEFAULT NULL,
  `partner_type` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `logo_large` blob,
  `logo_sp` blob,
  `logo_small` blob,
  `contact_info` text,
  `enabled` tinyint(1) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `enroll_html` text,
  `fields_reqd` text,
  `fields_optl` text,
  `custom_bottom` text,
  `custom_top` text,
  `custom_top_enroll` text,
  `credit_cards` varchar(100) DEFAULT NULL,
  `custom_bottom_enroll` text,
  `notification_level` tinyint(1) unsigned DEFAULT NULL,
  `notification_recipients` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`partner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-10-11 10:42:25
