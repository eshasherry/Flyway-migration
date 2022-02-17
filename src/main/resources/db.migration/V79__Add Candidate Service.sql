INSERT INTO `service_definitions` (
   `service_tp_id`
  ,`service_id`
  ,`service_category_id`
  ,`repeatable`
  ,`vendor_service_id`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   'ttc_api_gateway'
  ,'transform_candidates'
  ,'_core'
  ,0
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);

INSERT INTO `service_texts` (
   `service_tp_id`
  ,`service_id`
  ,`client_group_id`
  ,`client_user_id`
  ,`language`
  ,`service_name`
  ,`service_diz`
  ,`instructions_widget`
  ,`instructions_candidate`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   'ttc_api_gateway'
  ,'transform_candidates'
  ,''
  ,''
  ,'en'
  ,'Candidate Submission Service'
  ,''
  ,''
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);

INSERT INTO `service_mappings` (
   `package_id`
  ,`service_tp_id`
  ,`service_id`
  ,`client_group_id`
  ,`client_user_id`
  ,`service_select`
  ,`service_display`
  ,`enabled`
  ,`service_group`
  ,`service_order`
  ,`result_validity_days`
  ,`order_validity_days`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   'ttc_api_gateway_api'
  ,'ttc_api_gateway'
  ,'transform_candidates'
  ,''
  ,''
  ,0
  ,1
  ,1
  ,200
  ,100
  ,-1
  ,-1
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);


INSERT INTO `field_mappings` (
   `service_tp_id`
  ,`service_id`
  ,`field_id`
  ,`client_group_id`
  ,`client_user_id`
  ,`field_state`
  ,`field_display`
  ,`field_sensitivity`
  ,`field_cp_state`
  ,`field_cp_display`
  ,`field_cp_sensitivity`
  ,`enabled`
  ,`field_group`
  ,`field_order`
  ,`field_default`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   'ttc_api_gateway'
  ,'transform_candidates'
  ,'integration_attachment_id'
  ,''
  ,''
  ,1
  ,0
  ,1
  ,1
  ,0
  ,1
  ,1
  ,400
  ,100
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
),(
   'ttc_api_gateway'
  ,'transform_candidates'
  ,'integration_variable_name'
  ,''
  ,''
  ,1
  ,0
  ,1
  ,1
  ,0
  ,1
  ,1
  ,400
  ,100
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
),(
   'ttc_api_gateway'
  ,'transform_candidates'
  ,'integration_variable_value'
  ,''
  ,''
  ,1
  ,0
  ,1
  ,1
  ,0
  ,1
  ,1
  ,400
  ,100
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
),(
   'ttc_api_gateway'
  ,'transform_candidates'
  ,'integration_system_id'
  ,''
  ,''
  ,1
  ,0
  ,1
  ,1
  ,0
  ,1
  ,1
  ,400
  ,100
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
),(
   'ttc_api_gateway'
  ,'transform_candidates'
  ,'integration_action'
  ,''
  ,''
  ,1
  ,0
  ,1
  ,1
  ,0
  ,1
  ,1
  ,400
  ,100
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);


UPDATE `service_mappings` SET `max_retry_attempts`=3 WHERE `client_group_id`='' and`client_user_id`='' and`package_id`='ttc_api_gateway_api' and`service_tp_id`='ttc_api_gateway' and`service_id`='transform_candidates';


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
  ,'test_client_qa'
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
  ,'test_client_qa'
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
  ,'test_client_qa'
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
  ,'test_client_qa'
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
