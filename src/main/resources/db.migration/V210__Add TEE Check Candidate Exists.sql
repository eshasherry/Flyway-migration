INSERT INTO `xslt_versions` (
  `xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
VALUES
  ('candidates_import_tee_check_if_exists',               0,'Check if Candidate Exists in TEE before Importing',                  'ttc_verify',NOW(),'/artifacts/tee_default_candidate_import_pfl_check_exists.xslt',               0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
  