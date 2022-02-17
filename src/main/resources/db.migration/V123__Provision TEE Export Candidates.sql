INSERT INTO `service_definitions` (
  `service_tp_id`,`service_id`,`service_category_id`,`repeatable`,`vendor_service_id`,`created_date`,`created_tp_id`,
  `created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES 
  ('tee','export_candidates','integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_texts` (
  `service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`language`,`service_name`,`service_diz`,
  `instructions_widget`,`instructions_candidate`,`created_date`,`created_tp_id`,`created_tp_user_id`,
  `updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES 
  ('tee','export_candidates','','','en','Export Candidates','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_mappings` (
  `package_id`,`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`service_select`,`service_display`,`enabled`,
  `service_group`,`service_order`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`,
  `updated_tp_user_id`,`result_validity_days`,`order_validity_days`,`max_retry_attempts`,`retry_interval_multiplier`)
VALUES
  ('tee_api','tee','export_candidates','','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1);

INSERT INTO `xslt_versions` (
  `xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
VALUES
  ('candidates_export_tee_ids_upsert',0,'Initial TEE Query for Candidate Export (Retrieve Updated Candidates)',    'ttc_verify',NOW(),'/artifacts/tee_default_candidate_export_ids_upsert.xml',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_export_tee_pfl_fetch', 0,'Initial TEE Query for Candidate Export (Retrieve Candidate Profiles)',    'ttc_verify',NOW(),'/artifacts/tee_default_candidate_export_pfl_fetch.xml', 0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_export_tee_app_fetch', 0,'Initial TEE Query for Candidate Export (Retrieve Candidate Applications)','ttc_verify',NOW(),'/artifacts/tee_default_candidate_export_app_fetch.xml', 0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_export_tee_att_fetch', 0,'Initial TEE Query for Candidate Export (Retrieve Candidate Attachments)', 'ttc_verify',NOW(),'/artifacts/tee_default_candidate_export_att_fetch.xml', 0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_add_tee_agent',        0,'Initial TEE Transform for Candidate Add by Agent',                        'ttc_verify',NOW(),'/artifacts/tee_default_candidate_export_add_agent.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');

INSERT INTO `integration_transform_settings` (
  `service_tp_id`,`client_group_id`,`client_user_id`,`source_tp_id`,`system_id`,`action`,`service_id`,`xslt_id`)
VALUES
  ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_TEE','ADD','transform_candidates','candidates_add_tee_agent');
