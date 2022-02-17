INSERT INTO `service_definitions`
  (`service_tp_id`,`service_id`,`service_category_id`,`repeatable`,`vendor_service_id`,`created_date`,`created_tp_id`
  ,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES
  ('tee','export_lists','integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_texts`
  (`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`language`,`service_name`,`service_diz`
  ,`instructions_widget`,`instructions_candidate`,`created_date`,`created_tp_id`,`created_tp_user_id`
  ,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES
  ('tee','export_lists','','','en','Export Lists','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_mappings`
  (`package_id`,`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`service_select`,`service_display`,`enabled`
  ,`service_group`,`service_order`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`
  ,`updated_tp_user_id`,`result_validity_days`,`order_validity_days`,`max_retry_attempts`,`retry_interval_multiplier`)
VALUES
  ('tee_api','tee','export_lists','','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1);

INSERT INTO `xslt_versions`
  (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
VALUES
  ('lists_export_tee_pfl_build_query',0,'Initial TEE Query for List Export (Build List Retrieval Query)','ttc_verify',NOW(),'/artifacts/tee_default_list_export_pfl_build_query.xslt', 0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
