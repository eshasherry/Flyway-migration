DELIMITER //
CREATE PROCEDURE provision_pf_temp_155()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='pf';
    IF var_count = 1 THEN
        INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('candidates_add_pf_pf',0,'Initial PeopleFluent Transform for Candidate Add by PeopleFluent ATS',   'ttc_verify',NOW(),'/artifacts/pf_default_candidate_export_add_pf.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_del_pf_pf',0,'Initial PeopleFluent Transform for Candidate Delete by PeopleFluent ATS','ttc_verify',NOW(),'/artifacts/pf_default_candidate_export_del_pf.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
    END IF;
END//
DELIMITER ;

CALL provision_pf_temp_155();
DROP PROCEDURE provision_pf_temp_155;
