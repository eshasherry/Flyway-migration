-- Password: kd9Z2xoa3EV

DELIMITER //
CREATE PROCEDURE provision_pf_temp_157()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='pf';
    IF var_count = 1 THEN
        INSERT INTO `trading_partners`
            (`partner_id`, `password`,`partner_name`, `partner_type`, `enabled`)
        VALUES
            ('pfats','YOx2it4Tf8Y06E559J3fXobFiEpa9UPMN84w64vYOHmcYbRntJr6CCTtcYHVGcDn','PeopleFluent ATS', 'ats', 1);
        
        DELETE FROM `xslt_versions` WHERE `xslt_id`='candidates_add_pf_pf';
        DELETE FROM `xslt_versions` WHERE `xslt_id`='candidates_del_pf_pf';
        
        INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('candidates_add_pf_pfats',0,'Initial PeopleFluent Transform for Candidate Add by PeopleFluent ATS',   'ttc_verify',NOW(),'/artifacts/pf_default_candidate_export_add_pfats.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_del_pf_pfats',0,'Initial PeopleFluent Transform for Candidate Delete by PeopleFluent ATS','ttc_verify',NOW(),'/artifacts/pf_default_candidate_export_del_pfats.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
    END IF;
END//
DELIMITER ;

CALL provision_pf_temp_157();
DROP PROCEDURE provision_pf_temp_157;
