ALTER TABLE `q_incoming` ADD COLUMN `test_taken_timestamp` DATETIME NULL DEFAULT NULL  AFTER `REQUESTOR_ID` , ADD COLUMN `result_timestamp` DATETIME NULL DEFAULT NULL  AFTER `test_taken_timestamp` , CHANGE COLUMN `hrnx_status` `hrnx_status` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL  ;
ALTER TABLE `q_incoming` 
ADD INDEX `test_date_index` (`test_taken_timestamp` ASC) 
, ADD INDEX `result_date_index` (`result_timestamp` ASC) ;
ALTER TABLE `q_incoming` ADD COLUMN `client_group_id` VARCHAR(45) NOT NULL  AFTER `tp_id` , ADD COLUMN `client_user_id` VARCHAR(45) NULL DEFAULT NULL  AFTER `client_group_id` , ADD COLUMN `service_provider_id` VARCHAR(45) NOT NULL  AFTER `client_user_id` ;
