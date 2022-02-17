UPDATE `integration_transform_settings`
SET    `system_id`      ='SYS_TBE'
WHERE  `service_tp_id`  ='ttc_api_gateway'
  AND  `client_group_id`='test_client_ttc'
  AND  `client_user_id` =''
  AND  `source_tp_id`   ='ttc_agent'
  AND  `system_id`      =''
  AND  `action`       IN ('ADD','DEL')
  AND  `service_id`   IN ('transform_candidates','transform_jobs')
  AND  `xslt_id`      IN ('candidates_add_tbe','candidates_del_tbe','jobs_add_tbe','jobs_del_tbe');
  
INSERT INTO `integration_transform_settings` (
  `service_tp_id`,`client_group_id`,`client_user_id`,`source_tp_id`,`system_id`,`action`,`service_id`,`xslt_id`
) VALUES (
  'ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_TEE','ADD','transform_jobs','jobs_add_tee_agent'
),(
  'ttc_api_gateway','test_client_ttc','','ttc_agent','SYS_TEE','DEL','transform_jobs','jobs_del_tee_agent'
);
