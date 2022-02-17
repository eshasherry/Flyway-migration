INSERT INTO `service_definitions` (
  `service_tp_id`,`service_id`,`service_category_id`,`repeatable`,`vendor_service_id`,`created_date`,`created_tp_id`,
  `created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES 
  ('ttc_api_gateway','transform_questions','integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

  INSERT INTO `service_mappings` (
  `package_id`,`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`service_select`,`service_display`,`enabled`,
  `service_group`,`service_order`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`,
  `updated_tp_user_id`,`result_validity_days`,`order_validity_days`,`max_retry_attempts`,`retry_interval_multiplier`)
VALUES
  ('ttc_api_gateway_api','ttc_api_gateway','transform_questions','','',0,0,1,100,100,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1);
  
INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('questions_add_generic_genericats', 0,'Initial Generic Transform for Question Add by Generic ATS',          'ttc_verify',NOW(),'/artifacts/generic_default_question_export_add_genericats.xslt',  0,'com.talemetry.verify.serviceprovider.talemetryapigateway');

INSERT INTO `integration_transform_settings`
            (`service_tp_id`,`client_group_id`,`client_user_id`,`source_tp_id`,`system_id`,`action`,`service_id`,`xslt_id`)
        VALUES
            ('ttc_api_gateway','test_client_ttc','','ttc_agent','','UPDATE','transform_questions','questions_add_generic_genericats');    
              
INSERT INTO `integration_transform_settings`
            (`service_tp_id`,`client_group_id`,`client_user_id`,`source_tp_id`,`system_id`,`action`,`service_id`,`xslt_id`)
        VALUES
            ('ttc_api_gateway','test_client_ttc','','ttc_agent','','DELETE','transform_questions','questions_del_generic_genericats');    

INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('questions_del_generic_genericats', 0,'Initial Generic Transform for Question Delete by Generic ATS',          'ttc_verify',NOW(),'/artifacts/generic_default_question_export_del_genericats.xslt',  0,'com.talemetry.verify.serviceprovider.talemetryapigateway');           