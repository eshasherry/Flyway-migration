-- Password: kd9Z2xoa3EV
-- Deliberately check for tee, since hcs will not have it.
DELIMITER //
CREATE PROCEDURE provision_rp_temp_179()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='tee';
    IF var_count = 1 THEN
        INSERT INTO `trading_partners`
            (`partner_id`, `password`,`partner_name`, `partner_type`, `enabled`)
        VALUES
            ('rolepointats','YOx2it4Tf8Y06E559J3fXobFiEpa9UPMN84w64vYOHmcYbRntJr6CCTtcYHVGcDn','RolePoint ATS', 'ats', 1);
            
        INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('candidates_ext_rolepoint_rolepointats',0,'Initial RolePoint Transform for Candidate Extract by RolePoint ATS','ttc_verify',NOW(),'/artifacts/rolepoint_default_candidate_export_ext_rolepointats.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_add_rolepoint_rolepointats',0,'Initial RolePoint Transform for Candidate Add by RolePoint ATS',    'ttc_verify',NOW(),'/artifacts/rolepoint_default_candidate_export_add_rolepointats.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_del_rolepoint_rolepointats',0,'Initial RolePoint Transform for Candidate Delete by RolePoint ATS', 'ttc_verify',NOW(),'/artifacts/rolepoint_default_candidate_export_del_rolepointats.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
    END IF;
END//
DELIMITER ;

CALL provision_rp_temp_179();
DROP PROCEDURE provision_rp_temp_179;
