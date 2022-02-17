INSERT INTO `trading_partners` (
   `partner_id`
  ,`partner_name`
  ,`partner_type`
  ,`password`
  ,`enabled`
) VALUES (
   'erc_assessments'
  ,'ERC Assessments'
  ,'assessment'
  ,'4h+iqx0v2V43PX9ZpZqwaIPAHU2/rMTdSb2F5Dy/oNremWyrVLbEERqNsLtuIHBP'
  ,1
);

INSERT INTO `services` (
   `service_tp_id`
  ,`service_id`
  ,`service_categoryid`
  ,`vendor_service_id`
  ,`repeatable`
  ,`display`
  ,`expressOk`
  ,`enabled`
) VALUES (
   'erc_assessments'
  ,'citizens_teller'
  ,'assessment'
  ,'TELLER'
  ,0
  ,0
  ,0
  ,1
),(
   'erc_assessments'
  ,'citizens_banker'
  ,'assessment'
  ,'BANKER'
  ,0
  ,0
  ,0
  ,1
);

INSERT INTO `services_text` (
   `tp_id`
  ,`service_id`
  ,`service_name`
  ,`client_group_id`
  ,`client_user_id`
) VALUES (
   'erc_assessments'
  ,'citizens_teller'
  ,'Assessment for Teller'
  ,NULL
  ,NULL
),(
   'erc_assessments'
  ,'citizens_banker'
  ,'Assessment for Banker'
  ,NULL
  ,NULL
);
