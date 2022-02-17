INSERT INTO `clients` (
   `client_group_id`
  ,`clientname`
  ,`createdDate`
  ,`activatedDate`
  ,`createdUser`
  ,`createdTp`
  ,`password`
  ,`groupAuthAllowed`
  ,`groupAuthAutoCreateUser`
  ,`reviewCpSubmission`
  ,`enabled`
  ,`timezone`
  ,`client_options`
  ,`data_retention_days`
) VALUES (
   'test_client_qa'
  ,'Talemetry QA Client'
  ,now()
  ,now()
  ,'admin'
  ,'HRNX AWACS'
  ,'BJtW3x1LusaodsQaZXnWBxhCv8wtsvBCqebXBq2T68kJ2kPoscObd2VhJg+f1XzO'
  ,1
  ,0
  ,0
  ,1
  ,null
  ,''
  ,365);
	
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
  ,'test_client_qa'
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

UPDATE `service_settings`
  SET `key`='XSLT_transform_jobs|ttc_integrator|ADD|SYS_EBS', `value`='/artifacts/ebs_default_jobadd.xslt'
  WHERE `service_tp_id`='ttc_api_gateway' AND `client_group_id`='test_client_ttc' AND `client_user_id`='' AND `key`='XSLT_transform_jobs|ttc_integrator|ADD|';

UPDATE `service_settings`
  SET `key`='XSLT_transform_jobs|ttc_integrator|DEL|SYS_EBS', `value`='/artifacts/ebs_default_jobdelete.xslt'
  WHERE `service_tp_id`='ttc_api_gateway' AND `client_group_id`='test_client_ttc' AND `client_user_id`='' AND `key`='XSLT_transform_jobs|ttc_integrator|DEL|';

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
) VALUES (
   'ttc_api_gateway'
  ,'test_client_ttc'
  ,''
  ,'XSLT_transform_jobs|ttc_integrator|ADD|SYS_TEE'
  ,'/artifacts/tee_default_jobadd.xslt'
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
  ,'XSLT_transform_jobs|ttc_integrator|DEL|SYS_TEE'
  ,'/artifacts/tee_default_jobdelete.xslt'
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
  ,'XSLT_transform_jobs|ttc_integrator|ADD|SYS_EBS'
  ,'/artifacts/ebs_default_jobadd.xslt'
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
  ,'XSLT_transform_jobs|ttc_integrator|DEL|SYS_EBS'
  ,'/artifacts/ebs_default_jobdelete.xslt'
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
  ,'XSLT_transform_jobs|ttc_integrator|ADD|SYS_TEE'
  ,'/artifacts/tee_default_jobadd.xslt'
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
  ,'XSLT_transform_jobs|ttc_integrator|DEL|SYS_TEE'
  ,'/artifacts/tee_default_jobdelete.xslt'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);
INSERT INTO `service_settings` (`service_tp_id`, `client_group_id`, `client_user_id`, `key`, `value`, `created_date`, `created_tp_id`, `created_tp_user_id`, `updated_date`, `updated_tp_id`) VALUES ('ttc_api_gateway', 'test_client_ttc', '', 'XSLT_transform_jobs|ttc_verify|ADD|', '/artifacts/ebs_default_jobadd.xslt', now(), 'ttc_verify', 'ttc_verify', now(), 'ttc_verify');
INSERT INTO `service_settings` (`service_tp_id`, `client_group_id`, `client_user_id`, `key`, `value`, `created_date`, `created_tp_id`, `created_tp_user_id`, `updated_date`, `updated_tp_id`) VALUES ('ttc_api_gateway', 'test_client_ttc', '', 'XSLT_transform_jobs|ttc_verify|DEL|', '/artifacts/ebs_default_jobdelete.xslt', now(), 'ttc_verify', 'ttc_verify', now(), 'ttc_verify');


