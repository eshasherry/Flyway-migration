INSERT INTO `service_definitions`
    (`service_tp_id`,`service_id`,`service_category_id`,`repeatable`,`vendor_service_id`,`created_date`,`created_tp_id`
    ,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES
    ('ttc_int_test','export_candidates','integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
    ('ttc_int_test','export_jobs',      'integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_texts`
    (`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`language`,`service_name`,`service_diz`
    ,`instructions_widget`,`instructions_candidate`,`created_date`,`created_tp_id`,`created_tp_user_id`
    ,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES
    ('ttc_int_test','export_candidates','','','en','Export Candidates','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
    ('ttc_int_test','export_jobs',      '','','en','Export Jobs',      '','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_mappings`
    (`package_id`,`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`service_select`,`service_display`,`enabled`
    ,`service_group`,`service_order`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`
    ,`updated_tp_user_id`,`result_validity_days`,`order_validity_days`,`max_retry_attempts`,`retry_interval_multiplier`)
VALUES
    ('ttc_int_test_api','ttc_int_test','export_candidates','','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1),
    ('ttc_int_test_api','ttc_int_test','export_jobs',      '','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1);

INSERT INTO `xslt_versions`
    (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
VALUES
    ('candidates_add_ttc_int_test_agent',        0,'Initial Integration Test Transform for Candidate Add by Agent',     'ttc_verify',NOW(),'/artifacts/ttc_int_test_default_candidate_export_add_agent.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
    ('candidates_del_ttc_int_test_agent',        0,'Initial Integration Test Transform for Candidate Delete by Agent',  'ttc_verify',NOW(),'/artifacts/ttc_int_test_default_candidate_export_del_agent.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
    ('candidates_export_ttc_int_test_sample_001',0,'Initial Integration Test Request for Candidate Export (Sample 001)','ttc_verify',NOW(),'/artifacts/ttc_int_test_default_candidate_export_sample_001.xml',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
    ('jobs_add_ttc_int_test_agent',              0,'Initial Integration Test Transform for Job Add by Agent',           'ttc_verify',NOW(),'/artifacts/ttc_int_test_default_job_export_add_agent.xslt',      0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
    ('jobs_del_ttc_int_test_agent',              0,'Initial Integration Test Transform for Job Delete by Agent',        'ttc_verify',NOW(),'/artifacts/ttc_int_test_default_job_export_del_agent.xslt',      0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
    ('jobs_export_ttc_int_test_sample_001',      0,'Initial Integration Test Request for Job Export (Sample 001)',      'ttc_verify',NOW(),'/artifacts/ttc_int_test_default_job_export_sample_001.xml',      0,'com.talemetry.verify.serviceprovider.talemetryapigateway');

INSERT INTO `integration_transform_settings`
    (`service_tp_id`,`client_group_id`,`client_user_id`,`source_tp_id`,`system_id`,`action`,`service_id`,`xslt_id`)
VALUES
    ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_TTC_INT_TEST','ADD','transform_candidates','candidates_add_ttc_int_test_agent'),
    ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_TTC_INT_TEST','DEL','transform_candidates','candidates_del_ttc_int_test_agent'),
    ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_TTC_INT_TEST','ADD','transform_jobs',      'jobs_add_ttc_int_test_agent'),
    ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_TTC_INT_TEST','DEL','transform_jobs',      'jobs_del_ttc_int_test_agent');
