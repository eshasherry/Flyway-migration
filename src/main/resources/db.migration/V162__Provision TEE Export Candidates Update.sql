DELIMITER //
CREATE PROCEDURE provision_tee_temp_162()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='tee';
    IF var_count = 1 THEN
        INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('candidates_export_tee_cmt_fetch',0,'Initial TEE Query for Candidate Export (Retrieve Candidate Comments and Messages)','ttc_verify',NOW(),'/artifacts/tee_default_candidate_export_cmt_fetch.xml',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
    END IF;
END//
DELIMITER ;

CALL provision_tee_temp_162();
DROP PROCEDURE provision_tee_temp_162;
