INSERT INTO `integration_transform_settings`
(`service_tp_id`, `client_group_id`, `client_user_id`, `source_tp_id`, `system_id`, `action`, `service_id`, `xslt_id`)
VALUES
('ttc_api_gateway', 'test_client_ttc', '', 'ttc_integrator', 'SYS_EBS', 'DEL', 'transform_jobs','jobs_del_ebs'),
('ttc_api_gateway', 'test_client_ttc', '', 'ttc_integrator', 'SYS_TEE', 'DEL', 'transform_jobs','jobs_del_tee'),
('ttc_api_gateway', 'test_client_ttc', '', 'ttc_integrator', 'SYS_EBS', 'ADD', 'transform_jobs','jobs_add_ebs'),
('ttc_api_gateway', 'test_client_ttc', '', 'ttc_integrator', 'SYS_TEE', 'ADD', 'transform_jobs','jobs_add_tee');
