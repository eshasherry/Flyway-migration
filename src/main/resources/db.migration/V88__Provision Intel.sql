CALL VerifyEZClient('intel','Intel','bZCYbV3Nq3g4QMXWq1UuG3nDZjtohhOSv1vGMWZ1hh+NvIbUdC4ng/01watmbORf');
CALL VerifyEZClient('intel_dev','Intel (Dev)','m6JDIu6y3hwnT6J2SElLyeIP05AZYcdXDCl49y5jN5TOGe4NLsD58+d+fnamc+/z');

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
  ,'intel'
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
  ,'intel_dev'
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
('ttc_api_gateway', 'intel', '', 'ttc_integrator', '', 'ADD', 'transform_candidates','candidates_add_tee'),
('ttc_api_gateway', 'intel', '', 'ttc_integrator', '', 'DEL', 'transform_candidates','candidates_del_tee'),
('ttc_api_gateway', 'intel', '', 'ttc_integrator', '', 'DEL', 'transform_jobs','jobs_del_tee'),
('ttc_api_gateway', 'intel', '', 'ttc_integrator', '', 'ADD', 'transform_jobs','jobs_add_tee'),
('ttc_api_gateway', 'intel_dev', '', 'ttc_integrator', '', 'ADD', 'transform_candidates','candidates_add_tee'),
('ttc_api_gateway', 'intel_dev', '', 'ttc_integrator', '', 'DEL', 'transform_candidates','candidates_del_tee'),
('ttc_api_gateway', 'intel_dev', '', 'ttc_integrator', '', 'DEL', 'transform_jobs','jobs_del_tee'),
('ttc_api_gateway', 'intel_dev', '', 'ttc_integrator', '', 'ADD', 'transform_jobs','jobs_add_tee');
