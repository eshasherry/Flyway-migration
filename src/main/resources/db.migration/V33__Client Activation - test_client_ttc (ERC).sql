-- Assuming the user test_client_ttc already exists
INSERT INTO `service_settings` (
   `tp_id`
  ,`client_group_id`
  ,`client_user_id`
  ,`key`
  ,`value`
  ,`enabled`
) VALUES (
   'erc_assessments'
  ,'test_client_ttc'
  ,NULL
  ,'apikey'
  ,'72292f712e633048334e343e2c'
  ,1
);

INSERT INTO `partner_service_mappings` (
   `client_group_id`
  ,`client_user_id`
  ,`service_tp_id`
  ,`date_created`
  ,`date_activated`
  ,`service_id`
  ,`enabled`
) VALUES (
   'test_client_ttc'
  ,NULL
  ,'erc_assessments'
  ,NOW()
  ,NOW()
  ,'citizens_teller'
  ,1
),(
   'test_client_ttc'
  ,NULL
  ,'erc_assessments'
  ,NOW()
  ,NOW()
  ,'citizens_banker'
  ,1
);

INSERT INTO `settings_endpoints` (
   `endpoint_category`
  ,`partner_id`
  ,`client_group_id`
  ,`client_user_id`
  ,`address`
  ,`enabled`
) VALUES (
   'createOrder'
  ,'erc_assessments'
  ,'test_client_ttc'
  ,NULL
  ,'https://talemetry.qa.ercdataplus.com/connector.php'
  ,1
);
