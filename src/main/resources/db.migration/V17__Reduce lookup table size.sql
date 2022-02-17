ALTER TABLE `lookup_order_services` DROP COLUMN `client_group_id` , DROP COLUMN `req_timedatestamp` , DROP COLUMN `tp_activity_uqid` , DROP COLUMN `tp_uqid` , DROP COLUMN `txn_id` , ADD COLUMN `q_processing_id` INT(11) NOT NULL  FIRST , CHANGE COLUMN `service` `service` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL  
, DROP INDEX `lookup_txn` 
, ADD INDEX `lookup_txn` (`q_processing_id` ASC, `service` ASC, `package` ASC) 
, DROP INDEX `lookup_candidate` 
, DROP INDEX `lookup_activity` ;
