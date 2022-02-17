INSERT INTO `xslt_versions` (
  `xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
VALUES
  ('mirror_questions_wd_upsert',0,'Upsert WD Questions to Talemetry','ttc_verify',NOW(),'/artifacts/wd_default_question_export_del_agent.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
  
  INSERT INTO `xslt_versions` (
  `xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
VALUES
  ('mirror_questions_wd_del',0,'Delete WD Questions to talemetry','ttc_verify',NOW(),'/artifacts/wd_default_question_export_upsert_agent.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
  