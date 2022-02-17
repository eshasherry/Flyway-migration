DELIMITER //
CREATE PROCEDURE provision_workday_temp_143()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='wd';
    IF var_count = 1 THEN
        INSERT INTO `service_definitions`
            (`service_tp_id`,`service_id`,`service_category_id`,`repeatable`,`vendor_service_id`,`created_date`,`created_tp_id`
            ,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
        VALUES
            ('wd','import_candidates','integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');
        
        INSERT INTO `service_texts`
            (`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`language`,`service_name`,`service_diz`
            ,`instructions_widget`,`instructions_candidate`,`created_date`,`created_tp_id`,`created_tp_user_id`
            ,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
        VALUES
            ('wd','import_candidates','','','en','Import Candidates','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');
        
        INSERT INTO `service_mappings`
            (`package_id`,`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`service_select`,`service_display`,`enabled`
            ,`service_group`,`service_order`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`
            ,`updated_tp_user_id`,`result_validity_days`,`order_validity_days`,`max_retry_attempts`,`retry_interval_multiplier`)
        VALUES
            ('wd_api','wd','import_candidates','','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,5,2);
        
        INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('candidates_import_wd_lib',            0,'Initial Workday Transform for Candidate Import (Shared Library)',             'ttc_verify',NOW(),'/artifacts/wd_default_candidate_import_lib.xslt',            0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_import_wd_pfl_fetch_email',0,'Initial Workday Transform for Candidate Import (Retrieve Candidate by Email)','ttc_verify',NOW(),'/artifacts/wd_default_candidate_import_pfl_fetch_email.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_import_wd_pfl_fetch_name', 0,'Initial Workday Transform for Candidate Import (Retrieve Candidate by Name)', 'ttc_verify',NOW(),'/artifacts/wd_default_candidate_import_pfl_fetch_name.xslt', 0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_import_wd_pfl_create',     0,'Initial Workday Transform for Candidate Import (Create Candidate)',           'ttc_verify',NOW(),'/artifacts/wd_default_candidate_import_pfl_create.xslt',     0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_import_wd_pfl_update',     0,'Initial Workday Transform for Candidate Import (Update Candidate)',           'ttc_verify',NOW(),'/artifacts/wd_default_candidate_import_pfl_update.xslt',     0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_import_wd_app_create',     0,'Initial Workday Transform for Candidate Import (Create Application)',         'ttc_verify',NOW(),'/artifacts/wd_default_candidate_import_app_create.xslt',     0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
    END IF;
END//
DELIMITER ;

CALL provision_workday_temp_143();
DROP PROCEDURE provision_workday_temp_143;
