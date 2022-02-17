ALTER TABLE `error_recovery_records` ADD COLUMN `key` VARCHAR(45) NOT NULL DEFAULT ''  AFTER `service_id` , CHANGE COLUMN `state_pii` `state_pii` LONGBLOB NOT NULL  ;
