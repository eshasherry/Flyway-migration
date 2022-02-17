DELIMITER //
CREATE PROCEDURE provision_workday_temp_141()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='wd';
    IF var_count = 1 THEN
        INSERT INTO `service_definitions`
            (`service_tp_id`,`service_id`,`service_category_id`,`repeatable`,`vendor_service_id`,`created_date`,`created_tp_id`
            ,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
        VALUES
            ('wd','export_jobs','integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');
        
        INSERT INTO `service_texts`
            (`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`language`,`service_name`,`service_diz`
            ,`instructions_widget`,`instructions_candidate`,`created_date`,`created_tp_id`,`created_tp_user_id`
            ,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
        VALUES
            ('wd','export_jobs','','','en','Export Jobs','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');
        
        INSERT INTO `service_mappings`
            (`package_id`,`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`service_select`,`service_display`,`enabled`
            ,`service_group`,`service_order`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`
            ,`updated_tp_user_id`,`result_validity_days`,`order_validity_days`,`max_retry_attempts`,`retry_interval_multiplier`)
        VALUES
            ('wd_api','wd','export_jobs','','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1);
        
        INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('jobs_export_wd_ste_pfl_fetch',   0,'Initial Workday Request for Job Export (Retrieve Site Details)',          'ttc_verify',NOW(),'/artifacts/wd_default_job_export_ste_pfl_fetch.xml',   0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('jobs_export_wd_loc_pfl_fetch',   0,'Initial Workday Request for Job Export (Retrieve Location Details)',      'ttc_verify',NOW(),'/artifacts/wd_default_job_export_loc_pfl_fetch.xml',   0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('jobs_export_wd_org_pfl_fetch',   0,'Initial Workday Request for Job Export (Retrieve Organization Details)',  'ttc_verify',NOW(),'/artifacts/wd_default_job_export_org_pfl_fetch.xml',   0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('jobs_export_wd_jfg_ids_fullsync',0,'Initial Workday Request for Job Export (Retrieve Job Family Groups)',     'ttc_verify',NOW(),'/artifacts/wd_default_job_export_jfg_ids_fullsync.xml',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('jobs_export_wd_req_ids_fullsync',0,'Initial Workday Request for Job Export (Retrieve Requisitions Full Sync)','ttc_verify',NOW(),'/artifacts/wd_default_job_export_req_ids_fullsync.xml',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('jobs_export_wd_req_ids_active',  0,'Initial Workday Request for Job Export (Retrieve Requisitions Active)',   'ttc_verify',NOW(),'/artifacts/wd_default_job_export_req_ids_active.xml',  0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('jobs_export_wd_req_ids_upsert',  0,'Initial Workday Request for Job Export (Retrieve Requisitions Updated)',  'ttc_verify',NOW(),'/artifacts/wd_default_job_export_req_ids_upsert.xml',  0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('jobs_export_wd_req_pfl_fetch',   0,'Initial Workday Request for Job Export (Retrieve Requisition Details)',   'ttc_verify',NOW(),'/artifacts/wd_default_job_export_req_pfl_fetch.xml',   0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('jobs_export_wd_req_pst_fetch',   0,'Initial Workday Request for Job Export (Retrieve Requisition Posting)',   'ttc_verify',NOW(),'/artifacts/wd_default_job_export_req_pst_fetch.xml',   0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('jobs_export_wd_pst_ids_active',  0,'Initial Workday Request for Job Export (Retrieve Postings Active)',       'ttc_verify',NOW(),'/artifacts/wd_default_job_export_pst_ids_active.xml',  0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('jobs_add_wd_agent',              0,'Initial Workday Transform for Job Add by Agent',                          'ttc_verify',NOW(),'/artifacts/wd_default_job_export_add_agent.xslt',      0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('jobs_del_wd_agent',              0,'Initial Workday Transform for Job Delete by Agent',                       'ttc_verify',NOW(),'/artifacts/wd_default_job_export_del_agent.xslt',      0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
        
        INSERT INTO `integration_transform_settings`
            (`service_tp_id`,`client_group_id`,`client_user_id`,`source_tp_id`,`system_id`,`action`,`service_id`,`xslt_id`)
        VALUES
            ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_WD','ADD','transform_jobs','jobs_add_wd_agent'),
            ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_WD','DEL','transform_jobs','jobs_del_wd_agent');
    END IF;
END//
DELIMITER ;

CALL provision_workday_temp_141();
DROP PROCEDURE provision_workday_temp_141;
