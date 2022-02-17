DELIMITER //
CREATE PROCEDURE provision_workday_temp_148()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='wd';
    IF var_count = 1 THEN
        INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('candidates_export_wd_req_fetch', 0,'Initial Workday Request for Candidate Export (Retrieve Requisition Details)',          'ttc_verify',NOW(),'/artifacts/wd_default_candidate_export_req_fetch.xml',  0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_export_wd_eve_fetch', 0,'Initial Workday Request for Candidate Export (Retrieve Evergreen Requisition Details)','ttc_verify',NOW(),'/artifacts/wd_default_candidate_export_eve_fetch.xml',  0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_export_wd_deg_fetch', 0,'Initial Workday Request for Candidate Export (Retrieve Degrees)',                      'ttc_verify',NOW(),'/artifacts/wd_default_candidate_export_deg_fetch.xml',  0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_export_wd_fos_fetch', 0,'Initial Workday Request for Candidate Export (Retrieve Fields of Study)',              'ttc_verify',NOW(),'/artifacts/wd_default_candidate_export_fos_fetch.xml',  0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_import_wd_app_attach',0,'Initial Workday Transform for Candidate Import (Upload Attachment to Application)',    'ttc_verify',NOW(),'/artifacts/wd_default_candidate_import_app_attach.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
    END IF;
END//
DELIMITER ;

CALL provision_workday_temp_148();
DROP PROCEDURE provision_workday_temp_148;
