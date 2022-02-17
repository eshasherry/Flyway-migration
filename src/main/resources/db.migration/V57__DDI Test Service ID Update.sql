DELETE FROM `service_definitions` WHERE service_tp_id='ddi' AND service_id='ddi_assessment';
DELETE FROM `service_texts` WHERE service_tp_id='ddi' AND service_id='ddi_assessment';
DELETE FROM `service_mappings` WHERE package_id='ddi_api' AND service_tp_id='ddi' AND service_id='ddi_assessment';

DELETE FROM `service_definitions` WHERE service_tp_id='ddi' AND service_id='customer_service';
DELETE FROM `service_texts` WHERE service_tp_id='ddi' AND service_id='customer_service';
DELETE FROM `service_mappings` WHERE package_id='ddi_api' AND service_tp_id='ddi' AND service_id='customer_service';
DELETE FROM `service_definitions` WHERE service_tp_id='ddi' AND service_id='patient_service';
DELETE FROM `service_texts` WHERE service_tp_id='ddi' AND service_id='patient_service';
DELETE FROM `service_mappings` WHERE package_id='ddi_api' AND service_tp_id='ddi' AND service_id='patient_service';

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
  ,'grady_customer_service'
  ,'assessment'
  ,0
  ,'747f5b10-e777-47ff-acec-259ad3c18808'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
),(
   'ddi'
  ,'grady_patient_service'
  ,'assessment'
  ,0
  ,'85b12d21-8362-4b6b-bb47-19fa75ef9dd9'
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
  ,'grady_customer_service'
  ,''
  ,''
  ,'en'
  ,'Customer Service Career Battery'
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
  ,'grady_patient_service'
  ,''
  ,''
  ,'en'
  ,'Patient Service Career Battery'
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
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   'ddi_api'
  ,'ddi'
  ,'grady_customer_service'
  ,''
  ,''
  ,0
  ,1
  ,1
  ,200
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
  ,'grady_patient_service'
  ,''
  ,''
  ,0
  ,1
  ,1
  ,200
  ,200
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);
