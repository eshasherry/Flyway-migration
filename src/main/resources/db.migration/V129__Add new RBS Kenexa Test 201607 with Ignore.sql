INSERT IGNORE INTO `service_definitions` (
  `service_tp_id`,`service_id`,`service_category_id`,`repeatable`,`vendor_service_id`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`
) VALUES (
  'kenexa_assessments_r4','rbs_assessment_201607','assessment',0,'3987ea7835e34077905f03e01822114e',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'
);

INSERT IGNORE INTO `service_texts` (
  `service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`language`,`service_name`,`service_diz`,`instructions_widget`,`instructions_candidate`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`
) VALUES (
  'kenexa_assessments_r4','rbs_assessment_201607','','','en','RBS Assessment r4 (201607)','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'
);

INSERT IGNORE INTO `service_mappings` (
  `package_id`,`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`service_select`,`service_display`,`enabled`,`service_group`,`service_order`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`, `updated_tp_user_id`,`result_validity_days`,`order_validity_days`,`max_retry_attempts`,`retry_interval_multiplier`
) VALUES (
  'kenexa_assessments_r4_api','kenexa_assessments_r4','rbs_assessment_201607','','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1
),(
  'kenexa_assessments_r4_api','kenexa_assessments_r4','rbs_assessment_201607','rbs','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1
),(
  'kenexa_assessments_r4_api','kenexa_assessments_r4','rbs_assessment_201607','test_client_ttc','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1
);

INSERT IGNORE INTO `field_mappings` (
  `service_tp_id`,`service_id`,`field_id`,`client_group_id`,`client_user_id`,`field_state`,`field_display`,`field_sensitivity`,`field_cp_state`,`field_cp_display`,`field_cp_sensitivity`,`enabled`,`field_group`,`field_order`,`field_default`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`
) VALUES (
  'kenexa_assessments_r4','rbs_assessment_201607','completion_url','','',1,0,1,1,0,1,1,400,100,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'
),(
  'kenexa_assessments_r4','rbs_assessment_201607','request_locale','','',1,0,1,1,0,1,1,400,100,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'
);
