INSERT INTO `trading_partners`
  (`partner_id`, `password`,`partner_name`, `partner_type`, `enabled`)
VALUES
  ('icims', 'zGFkfp7VmpqogoiREBILIMhxHuRxuTkQrLv24qoh2uGZZaiM0S8oIPwOWUULzmfT','iCIMS', 'integration', 1);

INSERT INTO `package_definitions`
  (`package_id`,`owning_service_tp_id`,`vendor_package_ids`,`created_date`,`created_tp_id`,`created_tp_user_id`
  ,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES
  ('icims_api','ttc_verify','{"":""}',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `package_texts`
  (`package_id`,`client_group_id`,`client_user_id`,`language`,`package_name`,`created_date`,`created_tp_id`
  ,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES
  ('icims_api','','','en','API only',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_definitions`
  (`service_tp_id`,`service_id`,`service_category_id`,`repeatable`,`vendor_service_id`,`created_date`,`created_tp_id`
  ,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES
  ('icims','_core',            '_core',      0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('icims','_core_vendor',     '_core',      0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('icims','export_jobs',      'integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('icims','export_candidates','integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('icims','import_candidates','integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_texts`
  (`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`language`,`service_name`,`service_diz`
  ,`instructions_widget`,`instructions_candidate`,`created_date`,`created_tp_id`,`created_tp_user_id`
  ,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES
  ('icims','_core',            '','','en','Built-in',         '','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('icims','_core_vendor',     '','','en','Built-in (Vendor)','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('icims','export_jobs',      '','','en','Export Jobs',      '','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('icims','export_candidates','','','en','Export Candidates','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('icims','import_candidates','','','en','Import Candidates','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_mappings`
  (`package_id`,`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`service_select`,`service_display`,`enabled`
  ,`service_group`,`service_order`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`
  ,`updated_tp_user_id`,`result_validity_days`,`order_validity_days`,`max_retry_attempts`,`retry_interval_multiplier`)
VALUES
  ('icims_api','icims','_core',            '','',2,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1),
  ('icims_api','icims','_core_vendor',     '','',2,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1),
  ('icims_api','icims','export_jobs',      '','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1),
  ('icims_api','icims','export_candidates','','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1),
  ('icims_api','icims','import_candidates','','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,5,2);

INSERT INTO `xslt_versions`
  (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
VALUES
  ('jobs_export_icims_pfl_model',          0,'Initial iCIMS Model for Job Export (Profile Model)',                                                             'ttc_verify',NOW(),'/artifacts/icims_default_job_export_pfl_model.json',          0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_export_icims_pfl_model',    0,'Initial iCIMS Model for Candidate Export (Profile Model)',                                                       'ttc_verify',NOW(),'/artifacts/icims_default_candidate_export_pfl_model.json',    0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_export_icims_app_model',    0,'Initial iCIMS Model for Candidate Export (Workflow Model)',                                                      'ttc_verify',NOW(),'/artifacts/icims_default_candidate_export_app_model.json',    0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_import_icims_lib',          0,'Initial iCIMS Transform for Candidate Import (Shared Library)',                                                  'ttc_verify',NOW(),'/artifacts/icims_default_candidate_import_lib.xslt',          0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_import_icims_pfl_clean_nil',0,'Initial iCIMS Transform for Candidate Import (Retain All Existing Repeatable Entries for Update)',               'ttc_verify',NOW(),'/artifacts/icims_default_candidate_import_pfl_clean_nil.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_import_icims_pfl_clean_all',0,'Initial iCIMS Transform for Candidate Import (Remove All Existing Repeatable Entries for Update)',               'ttc_verify',NOW(),'/artifacts/icims_default_candidate_import_pfl_clean_all.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_import_icims_pfl_clean_dup',0,'Initial iCIMS Transform for Candidate Import (Remove Only Repeatable Entries that Allows Duplicates for Update)','ttc_verify',NOW(),'/artifacts/icims_default_candidate_import_pfl_clean_dup.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_import_icims_pfl_search',   0,'Initial iCIMS Transform for Candidate Import (Search Candidate)',                                                'ttc_verify',NOW(),'/artifacts/icims_default_candidate_import_pfl_search.xslt',   0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_import_icims_pfl_upsert',   0,'Initial iCIMS Transform for Candidate Import (Update Candidate)',                                                'ttc_verify',NOW(),'/artifacts/icims_default_candidate_import_pfl_upsert.xslt',   0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_import_icims_app_create',   0,'Initial iCIMS Transform for Candidate Import (Create Application)',                                              'ttc_verify',NOW(),'/artifacts/icims_default_candidate_import_app_create.xslt',   0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('jobs_add_icims_agent',                 0,'Initial iCIMS Transform for Job Add by Agent',                                                                   'ttc_verify',NOW(),'/artifacts/icims_default_job_export_add_agent.xslt',          0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('jobs_del_icims_agent',                 0,'Initial iCIMS Transform for Job Delete by Agent',                                                                'ttc_verify',NOW(),'/artifacts/icims_default_job_export_del_agent.xslt',          0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_add_icims_agent',           0,'Initial iCIMS Transform for Candidate Add by Agent',                                                             'ttc_verify',NOW(),'/artifacts/icims_default_candidate_export_add_agent.xslt',    0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_del_icims_agent',           0,'Initial iCIMS Transform for Candidate Delete by Agent',                                                          'ttc_verify',NOW(),'/artifacts/icims_default_candidate_export_del_agent.xslt',    0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
  
INSERT INTO `integration_transform_settings`
  (`service_tp_id`,`client_group_id`,`client_user_id`,`source_tp_id`,`system_id`,`action`,`service_id`,`xslt_id`)
VALUES
  ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_ICIMS','ADD','transform_jobs',      'jobs_add_icims_agent'),
  ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_ICIMS','DEL','transform_jobs',      'jobs_del_icims_agent'),
  ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_ICIMS','ADD','transform_candidates','candidates_add_icims_agent'),
  ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_ICIMS','DEL','transform_candidates','candidates_del_icims_agent');
