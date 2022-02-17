DELIMITER //
CREATE PROCEDURE provision_workday_temp_149()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='wd';
    IF var_count = 1 THEN
        INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('candidates_export_wd_ids_delta', 0,'Initial Workday Request for Candidate Export (Retrieve Candidates, Delta Load)','ttc_verify',NOW(),'/artifacts/wd_default_candidate_export_ids_delta.xml',  0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
    END IF;
END//
DELIMITER ;

CALL provision_workday_temp_149();
DROP PROCEDURE provision_workday_temp_149;
