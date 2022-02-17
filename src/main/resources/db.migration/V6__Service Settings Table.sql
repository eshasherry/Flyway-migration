ALTER TABLE `partner_service_mappings` DROP COLUMN `settings_2_data` , DROP COLUMN `settings_1_data` , DROP COLUMN `settings_2` , DROP COLUMN `settings_1` , DROP COLUMN `partner_service_mapping_id`, CHANGE COLUMN `client_user_id` `client_user_id` VARCHAR(45) NULL DEFAULT NULL  
, ADD UNIQUE INDEX `partner_id_UNIQUE` (`partner_id`, `client_group_id`,`client_user_id` ASC) 
, DROP PRIMARY KEY ;

--
-- Table structure for table `service_settings`
--

DROP TABLE IF EXISTS `service_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_settings` (
  `tp_id` varchar(45) NOT NULL,
  `client_group_id` varchar(45) DEFAULT NULL,
  `client_user_id` varchar(45) DEFAULT NULL,
  `key` varchar(45) NOT NULL,
  `value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tp_id`),
  KEY `LOOKUP` (`tp_id`,`client_group_id`,`client_user_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
ALTER TABLE `service_settings` ADD COLUMN `enabled` TINYINT NOT NULL DEFAULT 1  AFTER `value` ;
ALTER TABLE `service_settings` 
ADD UNIQUE INDEX `tp_id_UNIQUE` (`tp_id` ASC, `client_group_id` ASC, `client_user_id` ASC, `key` ASC) 
, DROP PRIMARY KEY ;

-- Dump completed on 2012-10-11 14:57:26
