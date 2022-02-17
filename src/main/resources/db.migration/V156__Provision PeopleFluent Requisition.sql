-- Deliberately check for tee, since hcs will not have it.
DELIMITER //
CREATE PROCEDURE provision_pf_temp_156()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='pf';
    IF var_count = 1 THEN
        INSERT INTO `service_definitions`
            (`service_tp_id`,`service_id`,`service_category_id`,`repeatable`,`vendor_service_id`,`created_date`,`created_tp_id`
            ,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
        VALUES
            ('pf','export_jobs','integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');
        
        INSERT INTO `service_texts`
            (`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`language`,`service_name`,`service_diz`
            ,`instructions_widget`,`instructions_candidate`,`created_date`,`created_tp_id`,`created_tp_user_id`
            ,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
        VALUES
            ('pf','export_jobs','','','en','Export Jobs','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');
        
        INSERT INTO `service_mappings`
            (`package_id`,`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`service_select`,`service_display`,`enabled`
            ,`service_group`,`service_order`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`
            ,`updated_tp_user_id`,`result_validity_days`,`order_validity_days`,`max_retry_attempts`,`retry_interval_multiplier`)
        VALUES
            ('pf_api','pf','export_jobs','','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1);
        
        INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('jobs_add_pf_agent',0,'Initial PeopleFluent Transform for Job Add by Agent',   'ttc_verify',NOW(),'/artifacts/pf_default_job_export_add_agent.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('jobs_del_pf_agent',0,'Initial PeopleFluent Transform for Job Delete by Agent','ttc_verify',NOW(),'/artifacts/pf_default_job_export_del_agent.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
        
        INSERT INTO `integration_transform_settings`
            (`service_tp_id`,`client_group_id`,`client_user_id`,`source_tp_id`,`system_id`,`action`,`service_id`,`xslt_id`)
        VALUES
            ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_PF','ADD','transform_jobs','jobs_add_pf_agent'),
            ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_PF','DEL','transform_jobs','jobs_del_pf_agent');
    END IF;
END//
DELIMITER ;

CALL provision_pf_temp_156();
DROP PROCEDURE provision_pf_temp_156;
