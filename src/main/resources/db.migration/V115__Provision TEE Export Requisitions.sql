INSERT INTO `service_definitions` (
  `service_tp_id`,`service_id`,`service_category_id`,`repeatable`,`vendor_service_id`,`created_date`,`created_tp_id`,
  `created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES 
  ('tee','export_jobs','integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_texts` (
  `service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`language`,`service_name`,`service_diz`,
  `instructions_widget`,`instructions_candidate`,`created_date`,`created_tp_id`,`created_tp_user_id`,
  `updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES 
  ('tee','export_jobs','','','en','Export Jobs','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_mappings` (
  `package_id`,`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`service_select`,`service_display`,`enabled`,
  `service_group`,`service_order`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`,
  `updated_tp_user_id`,`result_validity_days`,`order_validity_days`,`max_retry_attempts`,`retry_interval_multiplier`)
VALUES
  ('tee_api','tee','export_jobs','','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1);

INSERT INTO `xslt_versions` (
  `xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
VALUES
  ('jobs_export_tee_ids_active',   0,'Initial TEE Query for Job Export (Retrieve Active Requisitions)',            'ttc_verify',NOW(),'/artifacts/tee_default_job_export_ids_active.xml',   0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('jobs_export_tee_ids_upsert',   0,'Initial TEE Query for Job Export (Retrieve Updated Requisitions)',           'ttc_verify',NOW(),'/artifacts/tee_default_job_export_ids_upsert.xml',   0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('jobs_export_tee_pfl_fetch',    0,'Initial TEE Query for Job Export (Retrieve Requisition Details)',            'ttc_verify',NOW(),'/artifacts/tee_default_job_export_pfl_fetch.xml',    0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('jobs_add_tee_agent',           0,'Initial TEE Transform for Job Add by Agent',                                 'ttc_verify',NOW(),'/artifacts/tee_default_job_export_add_agent.xslt',   0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('jobs_del_tee_agent',           0,'Initial TEE Trasnform for Job Delete by Agent',                              'ttc_verify',NOW(),'/artifacts/tee_default_job_export_del_agent.xslt',   0,'com.talemetry.verify.serviceprovider.talemetryapigateway');

UPDATE `service_mappings`
SET    `service_tp_id`='tee'
WHERE  `package_id`='tee_api'
  AND  `service_tp_id`='tbe'
  AND  `service_id` IN ('_core','_core_vendor','import_candidates')
  AND  `client_group_id`=''
  AND  `client_user_id`='';
