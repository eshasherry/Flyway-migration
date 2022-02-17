INSERT INTO `xslt_versions` (
  `xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
VALUES
  ('jobs_export_tee_ids_active_cs',0,'Initial TEE Query for Job Export (Retrieve Posted and Active Requisitions)', 'ttc_verify',NOW(),'/artifacts/tee_default_job_export_ids_active_cs.xml',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('jobs_export_tee_ids_upsert_cs',0,'Initial TEE Query for Job Export (Retrieve Posted and Updated Requisitions)','ttc_verify',NOW(),'/artifacts/tee_default_job_export_ids_upsert_cs.xml',0,'com.talemetry.verify.serviceprovider.talemetryapigateway'),
  ('jobs_export_tee_pfl_fetch_cs', 0,'Initial TEE Query for Job Export (Retrieve Posted Requisition Details)',     'ttc_verify',NOW(),'/artifacts/tee_default_job_export_pfl_fetch_cs.xml', 0,'com.talemetry.verify.serviceprovider.talemetryapigateway');
