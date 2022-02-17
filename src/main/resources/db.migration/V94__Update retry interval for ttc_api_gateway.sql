UPDATE `service_mappings` SET `retry_interval_multiplier`=2 WHERE `package_id`='ttc_api_gateway_api' and`service_tp_id`='ttc_api_gateway' and`service_id`='transform_jobs';
UPDATE `service_mappings` SET `retry_interval_multiplier`=2 WHERE `package_id`='ttc_api_gateway_api' and`service_tp_id`='ttc_api_gateway' and`service_id`='transform_candidates';

