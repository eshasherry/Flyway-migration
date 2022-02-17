ALTER TABLE `settings_endpoints` DROP COLUMN `name`;
ALTER TABLE `settings_endpoints` ADD COLUMN `client_user_id` VARCHAR(45) NULL DEFAULT NULL  AFTER `client_group_id` , ADD COLUMN `mode` VARCHAR(45) BINARY NULL DEFAULT NULL  AFTER `client_user_id` , ADD COLUMN `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST  
, ADD UNIQUE INDEX `endpoint_UNIQUE` (`endpoint_category` ASC, `partner_id` ASC, `client_group_id` ASC, `client_user_id` ASC, `mode` ASC) ;

DELETE FROM settings_endpoints where partner_id like 'ka1_%';

UPDATE `trading_partners` set partner_id = 'kenexa_assessments' where partner_id = 'ka1_prod';
DELETE FROM `trading_partners` WHERE partner_id='ka1_qa';
DELETE FROM `service_settings` WHERE `tp_id` IN ('ka1_qa', 'ka1_prod');

DELETE FROM settings_endpoints where partner_id like 'ttc_apply_%';
UPDATE `trading_partners` set partner_id = 'ttc_apply', `partner_name` = 'Talemetry Apply' where partner_id = 'ttc_apply_prod';
DELETE FROM `trading_partners` WHERE partner_id='ttc_apply_staging';

DELETE FROM `partner_service_mappings` WHERE partner_id = 'ka1_qa';
UPDATE `partner_service_mappings` set partner_id = 'kenexa_assessments' where partner_id = 'ka1_prod';
