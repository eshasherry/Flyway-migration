DELIMITER //
CREATE PROCEDURE provision_infor_temp_165()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='infor';
    IF var_count = 1 THEN
        INSERT INTO `service_definitions`
            (`service_tp_id`,`service_id`,`service_category_id`,`repeatable`,`vendor_service_id`,`created_date`,`created_tp_id`
            ,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
        VALUES
            ('infor','import_candidates','integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');
        
        INSERT INTO `service_texts`
            (`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`language`,`service_name`,`service_diz`
            ,`instructions_widget`,`instructions_candidate`,`created_date`,`created_tp_id`,`created_tp_user_id`
            ,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
        VALUES
            ('infor','import_candidates','','','en','Import Candidates','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');
        
        INSERT INTO `service_mappings`
            (`package_id`,`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`service_select`,`service_display`,`enabled`
            ,`service_group`,`service_order`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`
            ,`updated_tp_user_id`,`result_validity_days`,`order_validity_days`,`max_retry_attempts`,`retry_interval_multiplier`)
        VALUES
            ('infor_api','infor','import_candidates','','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,5,2);
        
        INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('candidates_import_infor_lib',       0,'Initial Infor Transform for Candidate Import (Shared Library)',  'ttc_verify',NOW(),'/artifacts/infor_default_candidate_import_lib.xslt',       0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_import_infor_pfl_upsert',0,'Initial Infor Transform for Candidate Import (Upsert Candidate)','ttc_verify',NOW(),'/artifacts/infor_default_candidate_import_pfl_upsert.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
    END IF;
END//
DELIMITER ;

CALL provision_infor_temp_165();
DROP PROCEDURE provision_infor_temp_165;
