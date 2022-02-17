DELIMITER //
CREATE PROCEDURE provision_infor_temp_190()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='infor';
    IF var_count = 1 THEN
        INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('jobquestions_add_infor_agent',0,'Initial Infor Transform for Job Question Add by Agent','ttc_verify',NOW(),'/artifacts/infor_default_jobquestion_export_add_agent.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
        
        INSERT INTO `integration_transform_settings`
            (`service_tp_id`,`client_group_id`,`client_user_id`,`source_tp_id`,`system_id`,`action`,`service_id`,`xslt_id`)
        VALUES
            ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_INFOR','ADD','transform_jobquestions','jobquestions_add_infor_agent');
    END IF;
END//
DELIMITER ;

CALL provision_infor_temp_190();
DROP PROCEDURE provision_infor_temp_190;
