INSERT INTO `service_settings` (
   `service_tp_id`
  ,`client_group_id`
  ,`client_user_id`
  ,`key`
  ,`value`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES  (
   'ttc_api_gateway'
  ,'test_client_ttc'
  ,''
  ,'XSLT_transform_candidates|ttc_integrator|ADD|SYS_EBS'
  ,'/artifacts/ebs_default_candidate_add.xslt'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
),(
   'ttc_api_gateway'
  ,'test_client_ttc'
  ,''
  ,'XSLT_transform_candidates|ttc_integrator|DEL|SYS_EBS'
  ,'/artifacts/ebs_default_candidate_delete.xslt'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
),(
   'ttc_api_gateway'
  ,'test_client_ttc'
  ,''
  ,'XSLT_transform_candidates|ttc_integrator|ADD|SYS_TEE'
  ,'/artifacts/tee_default_candidate_add.xslt'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
),(
   'ttc_api_gateway'
  ,'test_client_ttc'
  ,''
  ,'XSLT_transform_candidates|ttc_integrator|DEL|SYS_TEE'
  ,'/artifacts/tee_default_candidate_delete.xslt'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);

UPDATE `service_definitions` SET `service_category_id`='integration'
WHERE `service_tp_id`='ttc_api_gateway' AND `service_id`='transform_candidates';

UPDATE `service_mappings` SET `service_order`=200
WHERE `package_id`='ttc_api_gateway_api' AND `service_tp_id`='ttc_api_gateway' AND `service_id`='transform_candidates';
