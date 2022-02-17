INSERT INTO `trading_partners_category` (
   `partner_type`
  ,`partner_category`
) VALUES (
   'integration'
  ,'sp'
);

INSERT INTO `service_categories` (
   `service_category_id`
  ,`service_category_name`
) VALUES (
   'integration'
  ,'Integrations'
);

INSERT INTO `trading_partners` (
   `partner_id`
  ,`partner_name`
  ,`partner_type`
  ,`password`
  ,`enabled`
) VALUES (
   'ttc_integrator'
  ,'Talemetry Integrator'
  ,'ats'
  ,'r633RULVZbqyxv0I3fH/ASpn5G3qq8kIrAHSWrIFu75ndv2CYS6k5277XazdAd+w'
  ,1
);

INSERT INTO `trading_partners` (
   `partner_id`
  ,`partner_name`
  ,`partner_type`
  ,`password`
  ,`enabled`
) VALUES (
   'ttc_api_gateway'
  ,'Talemetry API Gateway'
  ,'integration'
  ,'yZNfHD5T/1u3pOPI4FXeMNhq7isVYQj1Wdw+NpIXQuMMK0GjvXXmBPouv1XBB+T0'
  ,1
);

-- Move those packages against ttc_apply to ttc_api_gateway
UPDATE `package_definitions`
  SET `package_id`='ttc_api_gateway_api'
  WHERE `package_id`='ttc_apply_api';
  
UPDATE `package_mappings`
  SET `package_id`='ttc_api_gateway_api'
  WHERE `package_id`='ttc_apply_api' AND `client_group_id`='test_client_ttc' AND `client_user_id`='';

INSERT INTO `package_texts` (
   `package_id`
  ,`client_group_id`
  ,`client_user_id`
  ,`language`
  ,`package_name`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   'ttc_api_gateway_api'
  ,''
  ,''
  ,'en'
  ,'API only'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);
  
-- Move those services against ttc_apply to ttc_api_gateway
UPDATE `service_definitions`
  SET `service_tp_id`='ttc_api_gateway', `service_category_id`='integration'
  WHERE `service_tp_id`='ttc_apply' and `service_id`='transform_jobs';

UPDATE `service_texts`
  SET `service_tp_id`='ttc_api_gateway'
  WHERE `service_tp_id`='ttc_apply' and `service_id`='transform_jobs';

UPDATE `service_mappings`
  SET `package_id`='ttc_api_gateway_api', `service_tp_id`='ttc_api_gateway'
  WHERE `package_id`='ttc_apply_api' AND `service_tp_id`='ttc_apply' AND `service_id`='transform_jobs';
  
UPDATE `service_settings`
  SET `service_tp_id`='ttc_api_gateway', `key`='XSLT_transform_jobs|ttc_integrator|ADD|'
  WHERE `service_tp_id`='ttc_apply' AND `client_group_id`='test_client_ttc' AND `client_user_id`='' AND `key`='XSLT_transform_jobs|ttc_verify|ADD|';

UPDATE `service_settings`
  SET `service_tp_id`='ttc_api_gateway', `key`='XSLT_transform_jobs|ttc_integrator|DEL|'
  WHERE `service_tp_id`='ttc_apply' AND `client_group_id`='test_client_ttc' AND `client_user_id`='' AND `key`='XSLT_transform_jobs|ttc_verify|DEL|';

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
   'ttc_api_gateway'
  ,'_core'
  ,'_core'
  ,0
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
),(
   'ttc_api_gateway'
  ,'_core_vendor'
  ,'_core'
  ,0
  ,''
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
   'ttc_api_gateway'
  ,'_core'
  ,''
  ,''
  ,'en'
  ,'Built-in'
  ,''
  ,''
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
),(
   'ttc_api_gateway'
  ,'_core_vendor'
  ,''
  ,''
  ,'en'
  ,'Built-in (Vendor)'
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
   'ttc_api_gateway_api'
  ,'ttc_api_gateway'
  ,'_core'
  ,''
  ,''
  ,2
  ,0
  ,1
  ,100
  ,100
  ,-1
  ,-1
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
),(
   'ttc_api_gateway_api'
  ,'ttc_api_gateway'
  ,'_core_vendor'
  ,''
  ,''
  ,2
  ,0
  ,1
  ,100
  ,200
  ,-1
  ,-1
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);

-- Move those fields against ttc_apply to ttc_api_gateway
UPDATE `field_definitions`
  SET `field_id`='integration_action'
  WHERE `field_id`='action';
UPDATE `field_definitions`
  SET `field_id`='integration_system_id'
  WHERE `field_id`='job_system_id';
UPDATE `field_definitions`
  SET `field_id`='integration_attachment_id'
  WHERE `field_id`='source_attachment_id';
UPDATE `field_definitions`
  SET `field_id`='integration_variable_name'
  WHERE `field_id`='variable_name';
UPDATE `field_definitions`
  SET `field_id`='integration_variable_value'
  WHERE `field_id`='variable_value';

UPDATE `field_mappings`
  SET `service_tp_id`='ttc_api_gateway', `field_id`='integration_action'
  WHERE `service_tp_id`='ttc_apply' AND `service_id`='transform_jobs' AND `field_id`='action';
UPDATE `field_mappings`
  SET `service_tp_id`='ttc_api_gateway', `field_id`='integration_system_id'
  WHERE `service_tp_id`='ttc_apply' AND `service_id`='transform_jobs' AND `field_id`='job_system_id';
UPDATE `field_mappings`
  SET `service_tp_id`='ttc_api_gateway', `field_id`='integration_attachment_id'
  WHERE `service_tp_id`='ttc_apply' AND `service_id`='transform_jobs' AND `field_id`='source_attachment_id';
UPDATE `field_mappings`
  SET `service_tp_id`='ttc_api_gateway', `field_id`='integration_variable_name'
  WHERE `service_tp_id`='ttc_apply' AND `service_id`='transform_jobs' AND `field_id`='variable_name';
UPDATE `field_mappings`
  SET `service_tp_id`='ttc_api_gateway', `field_id`='integration_variable_value'
  WHERE `service_tp_id`='ttc_apply' AND `service_id`='transform_jobs' AND `field_id`='variable_value';

INSERT INTO `field_texts` (
   `field_id`
  ,`client_group_id`
  ,`client_user_id`
  ,`language`
  ,`field_name`
  ,`field_tooltip`
  ,`field_comment`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   'integration_action'
  ,''
  ,''
  ,'en'
  ,'Integration Action'
  ,''
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
),(
   'integration_system_id'
  ,''
  ,''
  ,'en'
  ,'Integration Source System ID'
  ,''
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
),(
   'integration_attachment_id'
  ,''
  ,''
  ,'en'
  ,'Integration Source Attachment ID'
  ,''
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
),(
   'integration_variable_name'
  ,''
  ,''
  ,'en'
  ,'Integration Variable Name'
  ,''
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
),(
   'integration_variable_value'
  ,''
  ,''
  ,'en'
  ,'Integration Variable Value'
  ,''
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);

