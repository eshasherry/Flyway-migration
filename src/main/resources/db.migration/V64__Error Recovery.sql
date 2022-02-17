ALTER TABLE `q_processing` DROP INDEX `transaction_activity_uniq_key` 
, ADD UNIQUE INDEX `transaction_activity_uniq_key` (`client_group_id` ASC, `tp_id` ASC, `tp_activity_uqid` ASC, `attempt` ASC) ;

CREATE  TABLE `error_recovery_records` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `txn_id` VARCHAR(45) NOT NULL ,
  `timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
  `tp_id` VARCHAR(45) NOT NULL ,
  `state_pii` BLOB NOT NULL ,
  `attempt_number` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `lookup` (`txn_id` ASC) );

  
  
INSERT INTO `service_definitions` (
   `service_tp_id`
  ,`service_id`
  ,`service_category_id`
  ,`repeatable`
  ,`vendor_service_id`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   'ttc_verify_test'
  ,'test_order_failure'
  ,'assessment'
  ,0
  ,'test_order_failure_id'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);

INSERT INTO `service_texts` (
   `service_tp_id`
  ,`service_id`
  ,`client_group_id`
  ,`client_user_id`
  ,`language`
  ,`service_name`
  ,`service_diz`
  ,`instructions_widget`
  ,`instructions_candidate`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   'ttc_verify_test'
  ,'test_order_failure'
  ,''
  ,''
  ,'en'
  ,'Test Service with failure'
  ,''
  ,''
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);

INSERT INTO `service_mappings` (
   `package_id`
  ,`service_tp_id`
  ,`service_id`
  ,`client_group_id`
  ,`client_user_id`
  ,`service_select`
  ,`service_display`
  ,`enabled`
  ,`service_group`
  ,`service_order`
  ,`result_validity_days`
  ,`order_validity_days`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   'ttc_verify_test_api'
  ,'ttc_verify_test'
  ,'test_order_failure'
  ,''
  ,''
  ,0
  ,1
  ,1
  ,200
  ,100
  ,-1
  ,-1
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);


INSERT INTO `field_mappings` (
   `service_tp_id`
  ,`service_id`
  ,`field_id`
  ,`client_group_id`
  ,`client_user_id`
  ,`field_state`
  ,`field_display`
  ,`field_sensitivity`
  ,`field_cp_state`
  ,`field_cp_display`
  ,`field_cp_sensitivity`
  ,`enabled`
  ,`field_group`
  ,`field_order`
  ,`field_default`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   'ttc_verify_test'
  ,'test_order_failure'
  ,'ttc_verify_test_response'
  ,''
  ,''
  ,1
  ,0
  ,1
  ,1
  ,0
  ,1
  ,1
  ,400
  ,100
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
),(
   'ttc_verify_test'
  ,'test_order_failure'
  ,'ttc_verify_test_delay'
  ,''
  ,''
  ,1
  ,0
  ,1
  ,1
  ,0
  ,1
  ,1
  ,400
  ,200
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);

INSERT INTO `service_settings` (`service_tp_id`, `client_group_id`, `key`, `value`) VALUES ('ttc_verify_test', 'test_client_ttc', 'max_retry_attempts', '3');

ALTER TABLE `error_recovery_records` ADD COLUMN `service_id` VARCHAR(45) NOT NULL  AFTER `tp_id` ;
