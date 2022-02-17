DELIMITER //
CREATE PROCEDURE provision_tee_temp_167()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='tee';
    IF var_count = 1 THEN
        INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('jobs_export_tee_pfl_fetch_lcl',               0,'Initial TEE Query for Job Export (Retrieve Requisition Details by Locale)',                      'ttc_verify',NOW(),'/artifacts/tee_default_job_export_pfl_fetch_lcl.xml',               0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('jobs_export_tee_pfl_fetch_cs_lcl',            0,'Initial TEE Query for Job Export (Retrieve Posted Requisition Details by Locale)',               'ttc_verify',NOW(),'/artifacts/tee_default_job_export_pfl_fetch_cs_lcl.xml',            0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('jobs_export_tee_pfl_snippet_string_lcl',      0,'Initial TEE Query for Job Export (Retrieve Requisition Custom Snippet for String by Locale)'  ,  'ttc_verify',NOW(),'/artifacts/tee_default_job_export_pfl_snippet_string_lcl.xml',      0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_export_tee_pfl_snippet_string_lcl',0,'Initial TEE Query for Candidate Export (Retrieve Candidate Custom Snippet for String by Locale)','ttc_verify',NOW(),'/artifacts/tee_default_candidate_export_pfl_snippet_string_lcl.xml',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
    END IF;
END//
DELIMITER ;

CALL provision_tee_temp_167();
DROP PROCEDURE provision_tee_temp_167;
