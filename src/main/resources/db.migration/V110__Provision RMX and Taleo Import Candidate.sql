INSERT INTO `trading_partners` (
  `partner_id`, `password`,`partner_name`, `partner_type`, `enabled`)
VALUES
  ('rmx', 'Can9YfLjUrFX0b2Cj7uAsD/GvyeJCgqnj1IabodVpe0dl9EEMamipDrDHnDvnX/q','ResumeMirror', 'integration', 1);

INSERT INTO `service_definitions` (
  `service_tp_id`,`service_id`,`service_category_id`,`repeatable`,`vendor_service_id`,`created_date`,`created_tp_id`,
  `created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES 
  ('tbe','import_candidates','integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('rmx','_core','_core',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('rmx','_core_vendor','_core',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('rmx','extract_resumes','integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_texts` (
  `service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`language`,`service_name`,`service_diz`,
  `instructions_widget`,`instructions_candidate`,`created_date`,`created_tp_id`,`created_tp_user_id`,
  `updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES 
  ('tbe','import_candidates','','','en','Import Candidates','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('rmx','_core','','','en','Built-in','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('rmx','_core_vendor','','','en','Built-in (Vendor)','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('rmx','extract_resumes','','','en','Extract Resumes','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_mappings` (
  `package_id`,`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`service_select`,`service_display`,`enabled`,
  `service_group`,`service_order`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`,
  `updated_tp_user_id`,`result_validity_days`,`order_validity_days`,`max_retry_attempts`,`retry_interval_multiplier`)
VALUES
  ('tbe_api','tbe','import_candidates','','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,5,2),
  ('rmx_api','rmx','extract_resumes','','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1),
  ('rmx_api','rmx','_core','','',2,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1),
  ('rmx_api','rmx','_core_vendor','','',2,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1);

INSERT INTO `package_definitions` (
  `package_id`,`owning_service_tp_id`,`vendor_package_ids`,`created_date`,`created_tp_id`,`created_tp_user_id`,
  `updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES
  ('rmx_api','ttc_verify','{"":""}',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `package_texts` (
  `package_id`,`client_group_id`,`client_user_id`,`language`,`package_name`,`created_date`,`created_tp_id`,`created_tp_user_id`,
  `updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES
  ('rmx_api','','','en','API only',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

ALTER TABLE `xslt_versions` 
  CHANGE COLUMN `xslt_id` `xslt_id` VARCHAR(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  CHANGE COLUMN `xslt_path` `xslt_path` VARCHAR(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL;

ALTER TABLE `integration_transform_settings`
  CHANGE COLUMN `xslt_id` `xslt_id` VARCHAR(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL;

ALTER TABLE `q_sent` 
  CHANGE COLUMN `payload_translated_pii` `payload_translated_pii` MEDIUMBLOB NULL DEFAULT NULL;
  
INSERT INTO `xslt_versions` (
  `xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
VALUES
  ('candidates_import_tbe_lib',       0,'Initial TBE Transform for Candidate Import (Shared Library)',     'ttc_verify',NOW(),'/artifacts/tbe_default_candidate_import_lib.xslt',       0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_import_tbe_pfl_search',0,'Initial TBE Transform for Candidate Import (Search Candidate)',   'ttc_verify',NOW(),'/artifacts/tbe_default_candidate_import_pfl_search.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_import_tbe_pfl_upsert',0,'Initial TBE Transform for Candidate Import (Update Candidate)',   'ttc_verify',NOW(),'/artifacts/tbe_default_candidate_import_pfl_upsert.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_import_tbe_emp_create',0,'Initial TBE Transform for Candidate Import (Update Employment)',  'ttc_verify',NOW(),'/artifacts/tbe_default_candidate_import_emp_create.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_import_tbe_edu_create',0,'Initial TBE Transform for Candidate Import (Update Education)',   'ttc_verify',NOW(),'/artifacts/tbe_default_candidate_import_edu_create.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_import_tbe_app_upsert',0,'Initial TBE Transform for Candidate Import (Update Application)', 'ttc_verify',NOW(),'/artifacts/tbe_default_candidate_import_app_upsert.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_import_tbe_res_create',0,'Initial TBE Transform for Candidate Import (Upload Resume)',      'ttc_verify',NOW(),'/artifacts/tbe_default_candidate_import_res_create.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_import_tbe_att_create',0,'Initial TBE Transform for Candidate Import (Upload Attachment)',  'ttc_verify',NOW(),'/artifacts/tbe_default_candidate_import_att_create.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
