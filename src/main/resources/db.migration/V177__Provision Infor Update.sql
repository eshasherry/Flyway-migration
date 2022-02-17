DELIMITER //
CREATE PROCEDURE provision_infor_temp_177()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='infor';
    IF var_count = 1 THEN
        INSERT INTO `service_definitions`
            (`service_tp_id`,`service_id`,`service_category_id`,`repeatable`,`vendor_service_id`,`created_date`,`created_tp_id`
            ,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
        VALUES
            ('infor','export_questions','integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
            ('infor','export_lists',    'integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');
        
        INSERT INTO `service_texts`
            (`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`language`,`service_name`,`service_diz`
            ,`instructions_widget`,`instructions_candidate`,`created_date`,`created_tp_id`,`created_tp_user_id`
            ,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
        VALUES
            ('infor','export_questions','','','en','Export Questions','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
            ('infor','export_lists',    '','','en','Export Lists',    '','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');
        
        INSERT INTO `service_mappings`
            (`package_id`,`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`service_select`,`service_display`,`enabled`
            ,`service_group`,`service_order`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`
            ,`updated_tp_user_id`,`result_validity_days`,`order_validity_days`,`max_retry_attempts`,`retry_interval_multiplier`)
        VALUES
            ('infor_api','infor','export_questions','','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1),
            ('infor_api','infor','export_lists',    '','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1);
        
        INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('questions_export_infor_labels',  0,'Initial Infor Model for Question Export by Agent (Labels)','ttc_verify',NOW(),'/artifacts/infor_default_question_export_labels.json',   0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('lists_export_infor_labels',      0,'Initial Infor Model for List Export by Agent (Labels)',    'ttc_verify',NOW(),'/artifacts/infor_default_list_export_labels.json',       0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('mirroring_questions_infor_agent',0,'Initial Infor Transform for Question Mirroring by Agent',  'ttc_verify',NOW(),'/artifacts/infor_default_question_export_add_agent.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('lists_add_infor_agent',          0,'Initial Infor Transform for List Add by Agent',            'ttc_verify',NOW(),'/artifacts/infor_default_list_export_add_agent.xslt',    0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('lists_del_infor_agent',          0,'Initial Infor Transform for List Delete by Agent',         'ttc_verify',NOW(),'/artifacts/infor_default_list_export_del_agent.xslt',    0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
        
        INSERT INTO `integration_transform_settings`
            (`service_tp_id`,`client_group_id`,`client_user_id`,`source_tp_id`,`system_id`,`action`,`service_id`,`xslt_id`)
        VALUES
            ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_INFOR','UPDATE','mirror_questions','mirroring_questions_infor_agent'),
            ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_INFOR','ADD',   'transform_lists', 'lists_add_infor_agent'),
            ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_INFOR','DEL',   'transform_lists', 'lists_del_infor_agent');
    END IF;
END//
DELIMITER ;

CALL provision_infor_temp_177();
DROP PROCEDURE provision_infor_temp_177;
