-- Unused tables for now -- add these back when we need them
drop table `lookup_quest2_mnemonic`;
drop table `lookup_quest_collection_sites`;
drop table `lookup_acxiom_zfd`;
drop table `trading_partners_old`;
drop table `lookup_gender2`;
drop table `keystore`;
drop table `lookup_drugreason`;

-- We don't need the id column, it seems -- the name is unique
ALTER TABLE `settings_endpoints` DROP COLUMN `id` 
, DROP PRIMARY KEY 
, ADD PRIMARY KEY (`name`) ;

-- Change Friendly ID to a string, since our new generation logic generates string
ALTER TABLE `q_processing` CHANGE COLUMN `friendly_id` `friendly_id` VARCHAR(25) NULL DEFAULT NULL  ;

-- Denormalize first name, last name, and email since these are used for searching in AWACS
ALTER TABLE `q_processing` ADD COLUMN `applicant_first_name` VARCHAR(100) NULL DEFAULT NULL  AFTER `tp_activity_uqid` , ADD COLUMN `applicant_last_name` VARCHAR(100) NULL DEFAULT NULL  AFTER `applicant_first_name` , ADD COLUMN `applicant_email` VARCHAR(100) NULL DEFAULT NULL  AFTER `applicant_last_name` ;
ALTER TABLE `q_processing` 
ADD INDEX `candidate_name` (`applicant_last_name` ASC, `applicant_first_name` ASC) 
, ADD INDEX `candidate_email` (`applicant_email` ASC) ;

-- Increase password field length since we are now storing hash 
ALTER TABLE `tp_users` CHANGE COLUMN `password` `password` VARCHAR(125) NULL DEFAULT NULL  ;
ALTER TABLE `trading_partners` CHANGE COLUMN `password` `password` VARCHAR(125) NULL DEFAULT NULL  ;
ALTER TABLE `client_users` CHANGE COLUMN `password` `password` VARCHAR(125) CHARACTER SET 'latin1' COLLATE 'latin1_bin' NULL DEFAULT NULL  ;
ALTER TABLE `awacs_users` CHANGE COLUMN `password` `password` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL  ;

ALTER TABLE `settings_endpoints` DROP COLUMN `direction` ;
ALTER TABLE `q_processing` CHANGE COLUMN `user_id` `user_id` VARCHAR(45) NULL  ;

ALTER TABLE `q_processing` 
DROP INDEX `activity_id` 
, ADD INDEX `activity_id` (`client_group_id` ASC, `tp_activity_uqid` ASC) ;

-- Create primary key for q_processing
ALTER TABLE `q_processing` 
 ADD PRIMARY KEY (`txn_id`) ;
 
-- Drop unused tables
DROP TABLE IF EXISTS `assets`;
 drop table `bank_names`;
drop table `bank_zipcodes`;
drop table `console_menu`;
drop table `credit_cards`;
drop table `hrnx_access_log`;
drop table `hrnx_awacs_access_log`;
drop table `hrnx_cp_access_log`;
drop table `hrnx_mc_access_log`;
drop table `lookup_us_counties`;
drop table `lookup_us_federal_districts`;
drop table `lookup_us_states`;
drop table `lookup_zipcodes`;
drop table `mappings_login`;
drop table `pathways`;
drop table `payment_options`;
drop table `timezones`;
drop table `timezones_dst_rules`;
drop table `tp_products`;
drop table `workflows`;
drop table `workflow_details`;
