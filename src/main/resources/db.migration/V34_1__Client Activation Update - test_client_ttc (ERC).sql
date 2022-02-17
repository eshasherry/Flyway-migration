UPDATE `settings_endpoints`
SET `address`='https://talemetry.ercdataplus.com/connector.php'
WHERE `client_group_id`='test_client_ttc' AND `partner_id`='erc_assessments' AND `endpoint_category`='createOrder';
