ALTER PROCEDURE VerifyEZService SQL SECURITY INVOKER;
ALTER PROCEDURE VerifyEZField SQL SECURITY INVOKER;
ALTER PROCEDURE VerifyEZPackage SQL SECURITY INVOKER;
ALTER PROCEDURE VerifyEZTP SQL SECURITY INVOKER;
ALTER PROCEDURE VerifyEZClient SQL SECURITY INVOKER;

CALL VerifyEZService('ttc_api_gateway', 'mirror_users', 'integration', 'User Mirroring', 'ttc_api_gateway_api', '');
UPDATE `service_mappings` SET `service_select`='0' WHERE `client_group_id`='' and`client_user_id`='' and`package_id`='ttc_api_gateway_api' and`service_tp_id`='ttc_api_gateway' and`service_id`='mirror_users';

INSERT INTO `service_settings`
(`service_tp_id`,`client_group_id`,`client_user_id`,`key`,`value`,`created_date`,`created_tp_id`,`created_tp_user_id`,
`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES
('ttc_api_gateway','test_client_ttc','','num_days_before_delete','30',NOW(),'ttc_verify','',NOW(),'ttc_verify','');

INSERT INTO `xslt_versions`
(
`xslt_id`,
`version`,
`description`,
`last_modified_by`,
`last_modified_time`,
`xslt_path`,
`xslt_location`,
`originating_bundle`)
VALUES
(
'mirroring_users_tee',
0,
'Initial TEE Transform for User Mirroring',
'ttc_verify',
NOW(),
'/artifacts/tee_default_user_add.xslt',
0,
'com.talemetry.verify.serviceprovider.talemetryapigateway');


INSERT INTO `integration_transform_settings`
(`service_tp_id`, `client_group_id`, `client_user_id`, `source_tp_id`, `system_id`, `action`, `service_id`, `xslt_id`)
VALUES
('ttc_api_gateway', 'test_client_ttc', '', 'ttc_integrator', '', 'UPDATE', 'mirror_users','mirroring_users_tee');
