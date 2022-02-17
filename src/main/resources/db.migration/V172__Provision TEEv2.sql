-- Deliberately check for tee, since hcs will not have it.
DELIMITER //
CREATE PROCEDURE provision_teev2_temp_172()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='tee';
    IF var_count = 1 THEN
        INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('jobs_add_teev2_integrator',0,'Initial TEE v2 Transform for Job Add by Integrator',   'ttc_verify',NOW(),'/artifacts/teev2_default_job_export_add_integrator.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('jobs_del_teev2_integrator',0,'Initial TEE v2 Transform for Job Delete by Integrator','ttc_verify',NOW(),'/artifacts/teev2_default_job_export_del_integrator.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_add_teev2_integrator',0,'Initial TEE v2 Transform for Candidate Add by Integrator',   'ttc_verify',NOW(),'/artifacts/teev2_default_candidate_export_add_integrator.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('candidates_del_teev2_integrator',0,'Initial TEE v2 Transform for Candidate Delete by Integrator','ttc_verify',NOW(),'/artifacts/teev2_default_candidate_export_del_integrator.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
        
        INSERT INTO `integration_transform_settings`
            (`service_tp_id`,`client_group_id`,`client_user_id`,`source_tp_id`,`system_id`,`action`,`service_id`,`xslt_id`)
        VALUES
            ('ttc_api_gateway','test_client_ttc','','ttc_integrator','SYS_TEEV2','ADD','transform_jobs','jobs_add_teev2_integrator'),
            ('ttc_api_gateway','test_client_ttc','','ttc_integrator','SYS_TEEV2','DEL','transform_jobs','jobs_del_teev2_integrator'),
            ('ttc_api_gateway','test_client_ttc','','ttc_integrator','SYS_TEEV2','ADD','transform_candidates','candidates_add_teev2_integrator'),
            ('ttc_api_gateway','test_client_ttc','','ttc_integrator','SYS_TEEV2','DEL','transform_candidates','candidates_del_teev2_integrator');
    END IF;
END//
DELIMITER ;

CALL provision_teev2_temp_172();
DROP PROCEDURE provision_teev2_temp_172;
