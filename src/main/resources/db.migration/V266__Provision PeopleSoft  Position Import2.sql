DELIMITER //
CREATE PROCEDURE provision_peoplesofthcm_temp_266()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;

    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='peoplesofthcm';
    IF var_count = 1 THEN
		INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('position_import_peoplesoft_agent',0,'Initial PeopleSoft Transform for postion Add/ Update by Agent','ttc_verify',NOW(),'/artifacts/peoplesoft_default_position_import_agent.xslt',0,'com.talemetry.verify.agent.peoplesoft');

       INSERT INTO `integration_transform_settings`
            (`service_tp_id`,`client_group_id`,`client_user_id`,`source_tp_id`,`system_id`,`action`,`service_id`,`xslt_id`)
        VALUES
            ('peoplesofthcm','','','jobviteapigateway','','POSITION_UPSERT','position_import','position_import_peoplesoft_agent');
   END IF;
END//
DELIMITER ;

CALL provision_peoplesofthcm_temp_266();
DROP PROCEDURE provision_peoplesofthcm_temp_266;
