DELIMITER //
CREATE PROCEDURE provision_successfactors_temp_194()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='sf';
    IF var_count = 1 THEN
        INSERT INTO `service_definitions`
            (`service_tp_id`,`service_id`,`service_category_id`,`repeatable`,`vendor_service_id`,`created_date`,`created_tp_id`
            ,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
        VALUES
            ('sf','import_candidates','integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');
        
        INSERT INTO `service_texts`
            (`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`language`,`service_name`,`service_diz`
            ,`instructions_widget`,`instructions_candidate`,`created_date`,`created_tp_id`,`created_tp_user_id`
            ,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
        VALUES
            ('sf','import_candidates','','','en','Import Candidates','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');
        
        INSERT INTO `service_mappings`
            (`package_id`,`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`service_select`,`service_display`,`enabled`
            ,`service_group`,`service_order`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`
            ,`updated_tp_user_id`,`result_validity_days`,`order_validity_days`,`max_retry_attempts`,`retry_interval_multiplier`)
        VALUES
            ('sf_api','sf','import_candidates','','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,5,2);
        
        INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('candidates_import_sf_lib',       0,'Initial SuccessFactors Transform for Candidate Import (Shared Library)',       'ttc_verify',NOW(),'/artifacts/sf_default_candidate_import_lib.xslt',       0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_import_sf_map',       0,'Initial SuccessFactors Transform for Candidate Import (Mappings)',             'ttc_verify',NOW(),'/artifacts/sf_default_candidate_import_map.xslt',       0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_import_sf_pfl_upsert',0,'Initial SuccessFactors Transform for Candidate Import (Upsert Profile)',       'ttc_verify',NOW(),'/artifacts/sf_default_candidate_import_pfl_upsert.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_import_sf_app_upsert',0,'Initial SuccessFactors Transform for Candidate Import (Update Application)',   'ttc_verify',NOW(),'/artifacts/sf_default_candidate_import_app_upsert.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_import_sf_exp_upsert',0,'Initial SuccessFactors Transform for Candidate Import (Update Linked Objects)','ttc_verify',NOW(),'/artifacts/sf_default_candidate_import_exp_upsert.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_import_sf_att_create',0,'Initial SuccessFactors Transform for Candidate Import (Create Attachment)',    'ttc_verify',NOW(),'/artifacts/sf_default_candidate_import_att_create.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
    END IF;
END//
DELIMITER ;

CALL provision_successfactors_temp_194();
DROP PROCEDURE provision_successfactors_temp_194;
