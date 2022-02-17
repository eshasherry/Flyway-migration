INSERT INTO `trading_partners` (`partner_id`, `password`,`partner_name`, `partner_type`, `enabled`) VALUES ('tbe', 'Can9YfLjUrFX0b2Cj7uAsD/GvyeJCgqnj1IabodVpe0dl9EEMamipDrDHnDvnX/q','Taleo Business Edition', 'ats', 1);
INSERT INTO `trading_partners` (`partner_id`, `password`,`partner_name`, `partner_type`, `enabled`) VALUES ('ttc_agent', 'yHiOwPo6Uegd7YgWftbzWsgnfQoqKt3KTWheds1+vi5rsEF2D2TrWXPZgSG3xHBa','Talemetry Integration Service Agent', 'ats', 1);

INSERT INTO `service_definitions` (
   `service_tp_id`,`service_id`,`service_category_id`,`repeatable`,`vendor_service_id`,`created_date`,`created_tp_id`
  ,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`) VALUES 
  ('tbe','_core','_core',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('tbe','_core_vendor','_core',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('tbe','export_candidates','integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('tbe','export_jobs','integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_texts` (
   `service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`language`,`service_name`,`service_diz`
  ,`instructions_widget`,`instructions_candidate`,`created_date`,`created_tp_id`,`created_tp_user_id`
  ,`updated_date`,`updated_tp_id`,`updated_tp_user_id`) VALUES 
  ('tbe','_core','','','en','Built-in','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('tbe','_core_vendor','','','en','Built-in (Vendor)','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('tbe','export_candidates','','','en','Export Candidates','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('tbe','export_jobs','','','en','Export Jobs','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_mappings`
(`package_id`,`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`service_select`,`service_display`,`enabled`,
	`service_group`,`service_order`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`,
	`updated_tp_user_id`,`result_validity_days`,`order_validity_days`,`max_retry_attempts`,`retry_interval_multiplier`)
VALUES
('tbe_api','tbe','export_jobs','','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1),
('tbe_api','tbe','export_candidates','','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1),
('tbe_api','tbe','export_candidates','test_client_ttc','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1),
('tbe_api','tbe','_core','','',2,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1),
('tbe_api','tbe','_core_vendor','','',2,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1);

INSERT INTO `package_definitions` (
   `package_id`,`owning_service_tp_id`,`vendor_package_ids`,`created_date`,`created_tp_id`,`created_tp_user_id`
  ,`updated_date`,`updated_tp_id`,`updated_tp_user_id`
) VALUES (
   'tbe_api','ttc_verify','{"":""}',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `package_texts` (
   `package_id`,`client_group_id`,`client_user_id`,`language`,`package_name`,`created_date`,`created_tp_id`,`created_tp_user_id`
  ,`updated_date`,`updated_tp_id`,`updated_tp_user_id`
) VALUES (
   'tbe_api','','','en','API only',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'
);


INSERT INTO `xslt_versions`
(`xslt_id`,
`version`,
`description`,
`last_modified_by`,
`last_modified_time`,
`xslt_path`,
`xslt_location`,
`originating_bundle`)
VALUES
('candidates_add_tbe',
0,
'Initial TBE Transform for Candidate Add',
'ttc_verify',
NOW(),
'/artifacts/tbe_default_candidate_add.xslt',
'0',
'com.talemetry.verify.serviceprovider.talemetryapigateway'),
('candidates_del_tbe',
0,
'Initial TBE Transform for Candidate Delete',
'ttc_verify',
NOW(),
'/artifacts/tbe_default_candidate_delete.xslt',
'0',
'com.talemetry.verify.serviceprovider.talemetryapigateway'),
('jobs_del_tbe',
0,
'Initial TBE Transform for Jobs Delete',
'ttc_verify',
NOW(),
'/artifacts/tbe_default_jobdelete.xslt',
'0',
'com.talemetry.verify.serviceprovider.talemetryapigateway'),
('jobs_add_tbe',
0,
'Initial TBE Transform for Jobs Add',
'ttc_verify',
NOW(),
'/artifacts/tbe_default_jobadd.xslt',
'0',
'com.talemetry.verify.serviceprovider.talemetryapigateway');

INSERT INTO `integration_transform_settings`
(
`service_tp_id`,
`client_group_id`,
`client_user_id`,
`source_tp_id`,
`system_id`,
`action`,
`service_id`,
`xslt_id`)
VALUES
(
'ttc_api_gateway',
'test_client_ttc',
'',
'ttc_agent',
'',
'ADD',
'transform_candidates',
'candidates_add_tbe'),
(
'ttc_api_gateway',
'test_client_ttc',
'',
'ttc_agent',
'',
'DEL',
'transform_candidates',
'candidates_del_tbe'),
(
'ttc_api_gateway',
'test_client_ttc',
'',
'ttc_agent',
'',
'ADD',
'transform_jobs',
'jobs_add_tbe'),
(
'ttc_api_gateway',
'test_client_ttc',
'',
'ttc_agent',
'',
'DEL',
'transform_jobs',
'jobs_del_tbe');

ALTER TABLE `agent_configurations` 
ADD COLUMN `shutdown` TINYINT(1) NOT NULL DEFAULT 0 AFTER `properties`;
