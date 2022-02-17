UPDATE `trading_partners` SET `partner_type`='integration' WHERE `partner_id`='tbe';

INSERT INTO `trading_partners` (
  `partner_id`, `password`,`partner_name`, `partner_type`, `enabled`)
VALUES
  ('tee', 'Can9YfLjUrFX0b2Cj7uAsD/GvyeJCgqnj1IabodVpe0dl9EEMamipDrDHnDvnX/q','Taleo Enterprise Edition', 'integration', 1);

INSERT INTO `service_definitions` (
  `service_tp_id`,`service_id`,`service_category_id`,`repeatable`,`vendor_service_id`,`created_date`,`created_tp_id`,
  `created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES 
  ('tee','_core','_core',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('tee','_core_vendor','_core',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('tee','import_candidates','integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_texts` (
  `service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`language`,`service_name`,`service_diz`,
  `instructions_widget`,`instructions_candidate`,`created_date`,`created_tp_id`,`created_tp_user_id`,
  `updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES 
  ('tee','_core','','','en','Built-in','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('tee','_core_vendor','','','en','Built-in (Vendor)','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('tee','import_candidates','','','en','Import Candidates','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_mappings` (
  `package_id`,`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`service_select`,`service_display`,`enabled`,
  `service_group`,`service_order`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`,
  `updated_tp_user_id`,`result_validity_days`,`order_validity_days`,`max_retry_attempts`,`retry_interval_multiplier`)
VALUES
  ('tee_api','tbe','_core','','',2,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1),
  ('tee_api','tbe','_core_vendor','','',2,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1),
  ('tee_api','tbe','import_candidates','','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,5,2);

INSERT INTO `package_definitions` (
  `package_id`,`owning_service_tp_id`,`vendor_package_ids`,`created_date`,`created_tp_id`,`created_tp_user_id`,
  `updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES
  ('tee_api','ttc_verify','{"":""}',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `package_texts` (
  `package_id`,`client_group_id`,`client_user_id`,`language`,`package_name`,`created_date`,`created_tp_id`,`created_tp_user_id`,
  `updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES
  ('tee_api','','','en','API only',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `xslt_versions` (
  `xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
VALUES
  ('candidates_import_tee_lib',               0,'Initial TEE Transform for Candidate Import (Shared Library)',                  'ttc_verify',NOW(),'/artifacts/tee_default_candidate_import_lib.xslt',               0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_import_tee_pfl_create_email',  0,'Initial TEE Transform for Candidate Import (Create Candidate with Email ID)',  'ttc_verify',NOW(),'/artifacts/tee_default_candidate_import_pfl_create_email.xslt',  0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_import_tee_pfl_create_default',0,'Initial TEE Transform for Candidate Import (Create Candidate with Default ID)','ttc_verify',NOW(),'/artifacts/tee_default_candidate_import_pfl_create_default.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_import_tee_pfl_update',        0,'Initial TEE Transform for Candidate Import (Update Candidate)',                'ttc_verify',NOW(),'/artifacts/tee_default_candidate_import_pfl_update.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_import_tee_pfl_attach',        0,'Initial TEE Transform for Candidate Import (Upload Attachment)',               'ttc_verify',NOW(),'/artifacts/tee_default_candidate_import_pfl_attach.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_import_tee_app_create',        0,'Initial TEE Transform for Candidate Import (Create Application)',              'ttc_verify',NOW(),'/artifacts/tee_default_candidate_import_app_create.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_import_tee_app_attach',        0,'Initial TEE Transform for Candidate Import (Upload Attachment to Application)','ttc_verify',NOW(),'/artifacts/tee_default_candidate_import_app_attach.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
