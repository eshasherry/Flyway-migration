UPDATE `settings_endpoints`
   SET `client_group_id`=''
   WHERE `client_group_id` IS NULL;
UPDATE `settings_endpoints`
   SET `client_user_id`=''
   WHERE `client_user_id` IS NULL;

ALTER TABLE `settings_endpoints`
   DROP PRIMARY KEY
  ,DROP KEY `endpoint_UNIQUE`
  ,DROP COLUMN `id`
  ,DROP COLUMN `mode`
  ,DROP COLUMN `address_preprocessing`
  ,DROP COLUMN `xslt`
  ,DROP COLUMN `xslt_preprocessing`
  ,DROP COLUMN `endpoint_type`
  ,DROP COLUMN `endpoint_options`
  ,DROP COLUMN `retry`
  ,DROP COLUMN `retry_delay`
  ,DROP COLUMN `timeout_action`
  ,DROP COLUMN `timeout_duration`
  ,DROP COLUMN `port`
  ,DROP COLUMN `enabled`
  ,DROP COLUMN `critical`
  ,DROP COLUMN `priority`
  ,DROP COLUMN `allowed_ips` 
  ,MODIFY COLUMN `endpoint_category` VARCHAR(45) NOT NULL DEFAULT ''
  ,CHANGE COLUMN `partner_id` `tp_id` VARCHAR(45) NOT NULL DEFAULT ''
  ,MODIFY COLUMN `client_group_id` VARCHAR(45) NOT NULL DEFAULT ''
  ,MODIFY COLUMN `client_user_id` VARCHAR(45) NOT NULL DEFAULT ''
  ,MODIFY COLUMN `address` MEDIUMTEXT NOT NULL
  ,ADD COLUMN `created_date` TIMESTAMP NOT NULL DEFAULT NOW()
  ,ADD COLUMN `created_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
  ,ADD COLUMN `created_tp_user_id` VARCHAR(45) NOT NULL DEFAULT ''
  ,ADD COLUMN `updated_date` TIMESTAMP NOT NULL DEFAULT NOW()
  ,ADD COLUMN `updated_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
  ,ADD COLUMN `updated_tp_user_id` VARCHAR(45) NOT NULL DEFAULT ''
  ,ADD PRIMARY KEY (`client_group_id`,`client_user_id`,`tp_id`,`endpoint_category`);
  
UPDATE `settings_endpoints`
  SET `created_date`=NOW()
     ,`created_tp_id`='ttc_verify'
     ,`created_tp_user_id`='ttc_verify'
     ,`updated_date`=NOW()
     ,`updated_tp_id`='ttc_verify'
     ,`updated_tp_user_id`='ttc_verify';
