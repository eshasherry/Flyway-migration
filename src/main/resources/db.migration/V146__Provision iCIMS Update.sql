DELIMITER //
CREATE PROCEDURE provision_workday_temp_146()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='icims';
    IF var_count = 1 THEN
        INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('jobs_export_icims_pfl_filter',      0,'Initial iCIMS Model for Job Export (Profile Fields to Skip)',       'ttc_verify',NOW(),'/artifacts/icims_default_job_export_pfl_filter.json',      0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_export_icims_pfl_filter',0,'Initial iCIMS Model for Candidate Export (Profile Fields to Skip)', 'ttc_verify',NOW(),'/artifacts/icims_default_candidate_export_pfl_filter.json',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_export_icims_app_filter',0,'Initial iCIMS Model for Candidate Export (Workflow Fields to Skip)','ttc_verify',NOW(),'/artifacts/icims_default_candidate_export_app_filter.json',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
    END IF;
END//
DELIMITER ;

CALL provision_workday_temp_146();
DROP PROCEDURE provision_workday_temp_146;
