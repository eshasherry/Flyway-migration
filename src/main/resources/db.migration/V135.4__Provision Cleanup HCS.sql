DELETE FROM `trading_partners`
 WHERE `partner_id` IN ('hcs');

DELETE FROM `package_definitions`
 WHERE `package_id` IN ('hcs_api');

DELETE FROM `package_texts`
 WHERE `package_id` IN ('hcs_api');

DELETE FROM `service_definitions`
 WHERE `service_tp_id` IN ('hcs');
 
DELETE FROM `service_texts`
 WHERE `service_tp_id` IN ('hcs');

DELETE FROM `service_mappings`
 WHERE (`package_id`='hcs_api' AND `service_tp_id`='hcs' AND `client_group_id`='' AND `client_user_id`='');

DELETE FROM `xslt_versions`
 WHERE (`xslt_id` LIKE '%_hcs%' AND `xslt_path` LIKE '/artifacts/hcs_%');
 
DELETE FROM `integration_transform_settings`
 WHERE (    `service_tp_id`  ='ttc_api_gateway'
        AND `client_group_id`='test_client_ttc'
        AND `client_user_id` =''
        AND `source_tp_id`   ='ttc_agent'
        AND `system_id`      ='SYS_HCS');
