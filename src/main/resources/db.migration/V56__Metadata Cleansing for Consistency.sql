/**
 * Overtime we have different meta data in our systems, mostly for fields we
 * do not currently use. Keep them consistent so in the future we won't be
 * confused about them.
 */
UPDATE `clients` SET createdUser='admin' WHERE client_group_id='rbs';
UPDATE `clients` SET groupAuthLogUser=NULL WHERE client_group_id IN ('rbs','citizens');
UPDATE `clients` SET client_options=NULL WHERE client_group_id IN ('grady_health_system','test_client_ttc');

UPDATE `field_mappings` SET service_id='_core', field_display=1, field_sensitivity=1, field_cp_display=1, field_cp_sensitivity=1, field_group=200, field_order=100 WHERE service_tp_id='ddi' AND service_id='ddi_assessment' AND field_id='first_name';
UPDATE `field_mappings` SET service_id='_core', field_display=1, field_sensitivity=1, field_cp_display=1, field_cp_sensitivity=1, field_group=200, field_order=200 WHERE service_tp_id='ddi' AND service_id='ddi_assessment' AND field_id='last_name';
UPDATE `field_mappings` SET service_id='_core', field_display=1, field_sensitivity=1, field_cp_display=1, field_cp_sensitivity=1, field_group=200, field_order=300, field_id='primary_email' WHERE service_tp_id='ddi' AND service_id='ddi_assessment' AND field_id='email';

UPDATE `package_mappings` SET package_select=2 WHERE package_id='ddi_api';
UPDATE `package_mappings` SET package_order=300 WHERE package_id='ddi_api' AND client_group_id='test_client_ttc';

INSERT INTO `settings_endpoints` (
   `endpoint_category`
  ,`tp_id`
  ,`client_group_id`
  ,`client_user_id`
  ,`address`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   'createOrder'
  ,'ddi'
  ,'test_client_ttc'
  ,''
  ,'https://pps.services.ddiworld.com/Ddi.Integration.Hrxml.V23/HRXMLService.asmx'
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
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   'ddi_api'
  ,'ddi'
  ,'_core'
  ,''
  ,''
  ,2
  ,0
  ,1
  ,100
  ,100
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
),(
   'ddi_api'
  ,'ddi'
  ,'_core_vendor'
  ,''
  ,''
  ,2
  ,0
  ,1
  ,100
  ,200
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);

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
   'ddi'
  ,'_core'
  ,'_core'
  ,0
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
),(
   'ddi'
  ,'_core_vendor'
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
   'ddi'
  ,'_core'
  ,''
  ,''
  ,'en'
  ,'Built-in'
  ,''
  ,''
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
),(
   'ddi'
  ,'_core_vendor'
  ,''
  ,''
  ,'en'
  ,'Built-in (Vendor)'
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
