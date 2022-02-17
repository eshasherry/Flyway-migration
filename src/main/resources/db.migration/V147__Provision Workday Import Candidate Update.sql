DELIMITER //
CREATE PROCEDURE provision_workday_temp_147()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='wd';
    IF var_count = 1 THEN
        INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('candidates_import_wd_deg_fetch',0,'Initial Workday Transform for Candidate Import (Retrieve Degrees)',        'ttc_verify',NOW(),'/artifacts/wd_default_candidate_import_deg_fetch.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_import_wd_fos_fetch',0,'Initial Workday Transform for Candidate Import (Retrieve Fields of Study)','ttc_verify',NOW(),'/artifacts/wd_default_candidate_import_fos_fetch.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
    END IF;
END//
DELIMITER ;

CALL provision_workday_temp_147();
DROP PROCEDURE provision_workday_temp_147;
