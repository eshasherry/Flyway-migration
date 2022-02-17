INSERT INTO `service_definitions`
  (`service_tp_id`,`service_id`,`service_category_id`,`repeatable`,`vendor_service_id`,`created_date`,`created_tp_id`
  ,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES
  ('hcs','export_jobs',      'integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('hcs','export_candidates','integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('hcs','export_lists',     'integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('hcs','export_users',     'integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_texts`
  (`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`language`,`service_name`,`service_diz`
  ,`instructions_widget`,`instructions_candidate`,`created_date`,`created_tp_id`,`created_tp_user_id`
  ,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES
  ('hcs','export_jobs',      '','','en','Export Jobs',      '','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('hcs','export_candidates','','','en','Export Candidates','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('hcs','export_lists',     '','','en','Export Lists',     '','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('hcs','export_users',     '','','en','Export Users',     '','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_mappings`
  (`package_id`,`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`service_select`,`service_display`,`enabled`
  ,`service_group`,`service_order`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`
  ,`updated_tp_user_id`,`result_validity_days`,`order_validity_days`,`max_retry_attempts`,`retry_interval_multiplier`)
VALUES
  ('hcs_api','hcs','export_jobs',      '','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1),
  ('hcs_api','hcs','export_candidates','','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1),
  ('hcs_api','hcs','export_lists',     '','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1),
  ('hcs_api','hcs','export_users',     '','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1);

INSERT INTO `xslt_versions`
  (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
VALUES
  ('jobs_export_hcs_ids_active',      0,'Initial HCS Request for Job Export (Retrieve Active Requisitions)',            'ttc_verify',NOW(),'/artifacts/hcs_default_job_export_ids_active.xml',      0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('jobs_export_hcs_ids_active_cs',   0,'Initial HCS Request for Job Export (Retrieve Active and Posted Requisitions)', 'ttc_verify',NOW(),'/artifacts/hcs_default_job_export_ids_active_cs.xml',   0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('jobs_export_hcs_ids_upsert',      0,'Initial HCS Request for Job Export (Retrieve Updated Requisitions)',           'ttc_verify',NOW(),'/artifacts/hcs_default_job_export_ids_upsert.xml',      0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('jobs_export_hcs_ids_upsert_cs',   0,'Initial HCS Request for Job Export (Retrieve Updated and Posted Requisitions)','ttc_verify',NOW(),'/artifacts/hcs_default_job_export_ids_upsert_cs.xml',   0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('jobs_export_hcs_pfl_fetch',       0,'Initial HCS Request for Job Export (Retrieve Requisition Details)',            'ttc_verify',NOW(),'/artifacts/hcs_default_job_export_pfl_fetch.xml',       0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('jobs_add_hcs_agent',              0,'Initial HCS Transform for Job Add by Agent',                                   'ttc_verify',NOW(),'/artifacts/hcs_default_job_export_add_agent.xslt',      0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('jobs_del_hcs_agent',              0,'Initial HCS Transform for Job Delete by Agent',                                'ttc_verify',NOW(),'/artifacts/hcs_default_job_export_del_agent.xslt',      0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_export_hcs_ids_fetch', 0,'Initial HCS Request for Candidate Export (Retrieve Candidate List)',           'ttc_verify',NOW(),'/artifacts/hcs_default_candidate_export_ids_fetch.xml', 0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_export_hcs_pfl_fetch', 0,'Initial HCS Request for Candidate Export (Retrieve Candidate Details)',        'ttc_verify',NOW(),'/artifacts/hcs_default_candidate_export_pfl_fetch.xml', 0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_add_hcs_agent',        0,'Initial HCS Transform for Candidate Add by Agent',                             'ttc_verify',NOW(),'/artifacts/hcs_default_candidate_export_add_agent.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_del_hcs_agent',        0,'Initial HCS Transform for Candidate Delete by Agent',                          'ttc_verify',NOW(),'/artifacts/hcs_default_candidate_export_del_agent.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('lists_export_hcs_ids_fetch',      0,'Initial HCS Request for List Export (Retrieve Lists)',                         'ttc_verify',NOW(),'/artifacts/hcs_default_list_export_ids_fetch.xml',      0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('lists_export_hcs_pfl_fetch',      0,'Initial HCS Request for List Export (Retrieve List Details)',                  'ttc_verify',NOW(),'/artifacts/hcs_default_list_export_pfl_fetch.xml',      0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('lists_add_hcs_agent',             0,'Initial HCS Transform for List Add by Agent',                                  'ttc_verify',NOW(),'/artifacts/hcs_default_list_export_add_agent.xslt',     0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('lists_del_hcs_agent',             0,'Initial HCS Transform for List Delete by Agent',                               'ttc_verify',NOW(),'/artifacts/hcs_default_list_export_del_agent.xslt',     0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('users_export_hcs_ids_fetch',      0,'Initial HCS Request for User Export (Retrieve User List)',                     'ttc_verify',NOW(),'/artifacts/hcs_default_user_export_ids_fetch.xml',      0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('users_export_hcs_pfl_fetch',      0,'Initial HCS Request for User Export (Retrieve User Details)',                  'ttc_verify',NOW(),'/artifacts/hcs_default_user_export_pfl_fetch.xml',      0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('mirroring_users_hcs_agent',       0,'Initial HCS Transform for User Mirroring by Agent',                            'ttc_verify',NOW(),'/artifacts/hcs_default_user_export_add_agent.xslt',     0,'com.talemetry.verify.serviceprovider.talemetryapigateway');

INSERT INTO `integration_transform_settings`
  (`service_tp_id`,`client_group_id`,`client_user_id`,`source_tp_id`,`system_id`,`action`,`service_id`,`xslt_id`)
VALUES
  ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_HCS','ADD',   'transform_jobs',      'jobs_add_hcs_agent'),
  ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_HCS','DEL',   'transform_jobs',      'jobs_del_hcs_agent'),
  ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_HCS','ADD',   'transform_candidates','candidates_add_hcs_agent'),
  ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_HCS','DEL',   'transform_candidates','candidates_del_hcs_agent'),
  ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_HCS','ADD',   'transform_lists',     'lists_add_hcs_agent'),
  ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_HCS','DEL',   'transform_lists',     'lists_del_hcs_agent'),
  ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_HCS','UPDATE','mirror_users',        'mirroring_users_hcs_agent');
