INSERT INTO `xslt_versions` (
  `xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
VALUES
  ('candidates_del_tee_agent',0,'Initial TEE Transform for Candidate Delete by Agent','ttc_verify',NOW(),'/artifacts/tee_default_candidate_export_del_agent.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');

INSERT INTO `integration_transform_settings` (
  `service_tp_id`,`client_group_id`,`client_user_id`,`source_tp_id`,`system_id`,`action`,`service_id`,`xslt_id`)
VALUES
  ('ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_TEE','DEL','transform_candidates','candidates_del_tee_agent');
