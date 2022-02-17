CALL VerifyEZService('ttc_api_gateway', 'validate_configuration', 'integration', 'Validate Configuration', 'ttc_api_gateway_api', '');
UPDATE `service_mappings` SET `service_select`='0' WHERE `client_group_id`='' and`client_user_id`='' and`package_id`='ttc_api_gateway_api' and`service_tp_id`='ttc_api_gateway' and`service_id`='validate_configuration';
