INSERT INTO `xslt_versions` (
  `xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
VALUES
  ('mirror_questions_wd_rpt_fetch',0,'Fetch questions lists from RAAS report','ttc_verify',NOW(),'/artifacts/wd_default_question_export_rpt_fetch.xml',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
  