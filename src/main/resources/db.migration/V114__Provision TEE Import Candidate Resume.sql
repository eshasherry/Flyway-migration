INSERT INTO `xslt_versions` (
  `xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
VALUES
  ('candidates_import_tee_pfl_file',   0,'Initial TEE Transform for Candidate Import (Upload Resume and Attachment)','ttc_verify',NOW(),'/artifacts/tee_default_candidate_import_pfl_file.xslt',  0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_import_tee_pfl_resume', 0,'Initial TEE Transform for Candidate Import (Upload Resume to Profile)',    'ttc_verify',NOW(),'/artifacts/tee_default_candidate_import_pfl_resume.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('candidates_import_tee_app_resume', 0,'Initial TEE Transform for Candidate Import (Upload Resume to Application)','ttc_verify',NOW(),'/artifacts/tee_default_candidate_import_app_resume.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');

UPDATE `xslt_versions`
SET    `description`='Initial TEE Transform for Candidate Import (Upload Attachment to Profile)'
WHERE  `xslt_id`='candidates_import_tee_pfl_attach';
