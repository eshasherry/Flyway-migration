UPDATE `service_settings`
   SET `client_group_id`=''
   WHERE `client_group_id` IS NULL;
UPDATE `service_settings`
   SET `client_user_id`=''
   WHERE `client_user_id` IS NULL;

ALTER TABLE `service_settings`
   DROP KEY `LOOKUP`
  ,DROP KEY `tp_id_UNIQUE`
  ,DROP COLUMN `enabled`
  ,CHANGE COLUMN `tp_id` `service_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
  ,MODIFY COLUMN `client_group_id` VARCHAR(45) NOT NULL DEFAULT ''
  ,MODIFY COLUMN `client_user_id` VARCHAR(45) NOT NULL DEFAULT ''
  ,MODIFY COLUMN `key` VARCHAR(45) NOT NULL DEFAULT ''
  ,MODIFY COLUMN `value` VARCHAR(255) NOT NULL DEFAULT ''
  ,ADD COLUMN `created_date` TIMESTAMP NOT NULL DEFAULT NOW()
  ,ADD COLUMN `created_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
  ,ADD COLUMN `created_tp_user_id` VARCHAR(45) NOT NULL DEFAULT ''
  ,ADD COLUMN `updated_date` TIMESTAMP NOT NULL DEFAULT NOW()
  ,ADD COLUMN `updated_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
  ,ADD COLUMN `updated_tp_user_id` VARCHAR(45) NOT NULL DEFAULT ''
  ,ADD PRIMARY KEY (`client_group_id`,`client_user_id`,`service_tp_id`,`key`);

UPDATE `service_settings`
  SET `created_date`=NOW()
     ,`created_tp_id`='ttc_verify'
     ,`created_tp_user_id`='ttc_verify'
     ,`updated_date`=NOW()
     ,`updated_tp_id`='ttc_verify'
     ,`updated_tp_user_id`='ttc_verify';
