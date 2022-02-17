-- Password: genericats
INSERT INTO `trading_partners`
    (`partner_id`, `password`,`partner_name`, `partner_type`, `enabled`)
VALUES
    ('genericats','vjvwjLBvTUv39eSP+5y/CUaEbssXiiCj9PuACz69peUwkJ6Z4XBmJgAmezbxKks8','Generic ATS', 'ats', 1);

INSERT INTO `xslt_versions`
    (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
VALUES
    ('jobs_add_generic_genericats',      0,'Initial Generic Transform for Job Add by Generic ATS',         'ttc_verify',NOW(),'/artifacts/generic_default_job_export_add_genericats.xslt',      0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
    ('jobs_del_generic_genericats',      0,'Initial Generic Transform for Job Delete by Generic ATS',      'ttc_verify',NOW(),'/artifacts/generic_default_job_export_del_genericats.xslt',      0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
    ('candidates_add_generic_genericats',0,'Initial Generic Transform for Candidate Add by Generic ATS',   'ttc_verify',NOW(),'/artifacts/generic_default_candidate_export_add_genericats.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
    ('candidates_del_generic_genericats',0,'Initial Generic Transform for Candidate Delete by Generic ATS','ttc_verify',NOW(),'/artifacts/generic_default_candidate_export_del_genericats.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
