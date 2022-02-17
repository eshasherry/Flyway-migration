CALL VerifyEZClient('seagate','Seagate','1YRlbrzsNJ0xFYHzroOnz00r8skWpusFhktiuqI6we71WqyP4gtNgmMKEVdzmxLk');
CALL VerifyEZClient('seagate_dev','Seagate (Dev)','A6whTA1C/qlXLp3aDbW71a9l+Hd6QGy1y0yztfA5ReZ1ZqhEA4XV7PosTuw09fzv');

INSERT INTO `package_mappings` (
   `package_id`
  ,`client_group_id`
  ,`client_user_id`
  ,`package_select`
  ,`package_display`
  ,`enabled`
  ,`package_group`
  ,`package_order`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   'ttc_api_gateway_api'
  ,'seagate'
  ,''
  ,2
  ,0
  ,1
  ,100
  ,50
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);
INSERT INTO `package_mappings` (
   `package_id`
  ,`client_group_id`
  ,`client_user_id`
  ,`package_select`
  ,`package_display`
  ,`enabled`
  ,`package_group`
  ,`package_order`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   'ttc_api_gateway_api'
  ,'seagate_dev'
  ,''
  ,2
  ,0
  ,1
  ,100
  ,50
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);

INSERT INTO `integration_transform_settings`
(`service_tp_id`, `client_group_id`, `client_user_id`, `source_tp_id`, `system_id`, `action`, `service_id`, `xslt_id`)
VALUES
('ttc_api_gateway', 'seagate', '', 'ttc_integrator', '', 'ADD', 'transform_candidates','candidates_add_tee'),
('ttc_api_gateway', 'seagate', '', 'ttc_integrator', '', 'DEL', 'transform_candidates','candidates_del_tee'),
('ttc_api_gateway', 'seagate', '', 'ttc_integrator', '', 'DEL', 'transform_jobs','jobs_del_tee'),
('ttc_api_gateway', 'seagate', '', 'ttc_integrator', '', 'ADD', 'transform_jobs','jobs_add_tee'),
('ttc_api_gateway', 'seagate_dev', '', 'ttc_integrator', '', 'ADD', 'transform_candidates','candidates_add_tee'),
('ttc_api_gateway', 'seagate_dev', '', 'ttc_integrator', '', 'DEL', 'transform_candidates','candidates_del_tee'),
('ttc_api_gateway', 'seagate_dev', '', 'ttc_integrator', '', 'DEL', 'transform_jobs','jobs_del_tee'),
('ttc_api_gateway', 'seagate_dev', '', 'ttc_integrator', '', 'ADD', 'transform_jobs','jobs_add_tee');
