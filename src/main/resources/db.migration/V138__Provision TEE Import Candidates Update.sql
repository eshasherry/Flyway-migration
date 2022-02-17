DELIMITER //
CREATE PROCEDURE update_xslt_versions_temp_138()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='tee';
    IF var_count = 1 THEN
        INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('candidates_import_tee_pfl_overwrite', 0,'Initial TEE Transform for Candidate Import (Update Candidate with Overwrite)','ttc_verify',NOW(),'/artifacts/tee_default_candidate_import_pfl_overwrite.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
    END IF;
END//
DELIMITER ;

CALL update_xslt_versions_temp_138();
DROP PROCEDURE update_xslt_versions_temp_138;
