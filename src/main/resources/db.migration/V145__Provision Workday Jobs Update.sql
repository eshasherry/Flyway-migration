DELIMITER //
CREATE PROCEDURE provision_workday_temp_145()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='wd';
    IF var_count = 1 THEN
        INSERT INTO `xslt_versions`
            (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
        VALUES
            ('jobs_export_wd_eve_ids_fullsync',0,'Initial Workday Request for Job Export (Retrieve Evergreen Requisitions Full Sync)','ttc_verify',NOW(),'/artifacts/wd_default_job_export_eve_ids_fullsync.xml',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('jobs_export_wd_eve_ids_active',  0,'Initial Workday Request for Job Export (Retrieve Evergreen Requisitions Active)',   'ttc_verify',NOW(),'/artifacts/wd_default_job_export_eve_ids_active.xml',  0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('jobs_export_wd_eve_ids_upsert',  0,'Initial Workday Request for Job Export (Retrieve Evergreen Requisitions Updated)',  'ttc_verify',NOW(),'/artifacts/wd_default_job_export_eve_ids_upsert.xml',  0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
            ('jobs_export_wd_eve_pfl_fetch',   0,'Initial Workday Request for Job Export (Retrieve Evergreen Requisition Details)',   'ttc_verify',NOW(),'/artifacts/wd_default_job_export_eve_pfl_fetch.xml',   0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
    END IF;
END//
DELIMITER ;

CALL provision_workday_temp_145();
DROP PROCEDURE provision_workday_temp_145;
