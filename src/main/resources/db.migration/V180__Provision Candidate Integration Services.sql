INSERT INTO `service_definitions`
    (`service_tp_id`,`service_id`,`service_category_id`,`repeatable`,`vendor_service_id`,`created_date`,`created_tp_id`
    ,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES
    ('ttc_api_gateway','candidate_int_extract', 'integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
    ('ttc_api_gateway','candidate_int_upload',  'integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
    ('ttc_api_gateway','candidate_int_retrieve','integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_texts`
    (`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`language`,`service_name`,`service_diz`
    ,`instructions_widget`,`instructions_candidate`,`created_date`,`created_tp_id`,`created_tp_user_id`
    ,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES
    ('ttc_api_gateway','candidate_int_extract', '','','en','Candidate Integration Extraction Service','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
    ('ttc_api_gateway','candidate_int_upload',  '','','en','Candidate Integration Upload Service',    '','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
    ('ttc_api_gateway','candidate_int_retrieve','','','en','Candidate Integration Retrieval Service', '','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_mappings`
    (`package_id`,`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`service_select`,`service_display`,`enabled`
    ,`service_group`,`service_order`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`
    ,`updated_tp_user_id`,`result_validity_days`,`order_validity_days`,`max_retry_attempts`,`retry_interval_multiplier`)
VALUES
    ('ttc_api_gateway_api','ttc_api_gateway','candidate_int_extract', '','',0,1,1,300,100,NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify',-1,-1,0,1),
    ('ttc_api_gateway_api','ttc_api_gateway','candidate_int_upload',  '','',0,1,1,300,200,NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify',-1,-1,5,2),
    ('ttc_api_gateway_api','ttc_api_gateway','candidate_int_retrieve','','',0,1,1,300,300,NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify',-1,-1,0,1);
