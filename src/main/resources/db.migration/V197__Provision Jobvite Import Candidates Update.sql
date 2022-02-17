DELIMITER //
CREATE PROCEDURE provision_jobvite_temp_197()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='jobvite';
    IF var_count = 1 THEN
        INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('candidates_import_jobvite_map',0,'Initial Jobvite Transform for Candidate Import (Mappings)','ttc_verify',NOW(),'/artifacts/jobvite_default_candidate_import_map.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
    END IF;
END//
DELIMITER ;

CALL provision_jobvite_temp_197();
DROP PROCEDURE provision_jobvite_temp_197;
