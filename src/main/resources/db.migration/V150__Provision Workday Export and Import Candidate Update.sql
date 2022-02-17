DELIMITER //
CREATE PROCEDURE provision_workday_temp_150()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='wd';
    IF var_count = 1 THEN
        INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('candidates_export_wd_add_fetch', 0,'Initial Workday Request for Candidate Export (Retrieve Candidate Additional Data)',     'ttc_verify',NOW(),'/artifacts/wd_default_candidate_export_add_fetch.xml',  0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_import_wd_add_create',0,'Initial Workday Transform for Candidate Import (Upload Additional Data to Application)','ttc_verify',NOW(),'/artifacts/wd_default_candidate_import_add_create.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
    END IF;
END//
DELIMITER ;

CALL provision_workday_temp_150();
DROP PROCEDURE provision_workday_temp_150;
