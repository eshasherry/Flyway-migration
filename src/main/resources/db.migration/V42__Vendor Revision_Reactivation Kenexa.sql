/**
 * Define the standard built-in packages
 * - API   : for enabling services usable through the API (unselected, hidden)
 * - Custom: for enabling a la carte ordering TBD         (unselected, normal)
 */
INSERT INTO `package_definitions` (
   `package_id`
  ,`owning_service_tp_id`
  ,`vendor_package_ids`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   'kenexa_assessments_api'
  ,'ttc_verify'
  ,'{"":""}'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);

INSERT INTO `package_texts` (
   `package_id`
  ,`client_group_id`
  ,`client_user_id`
  ,`language`
  ,`package_name`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   'kenexa_assessments_api'
  ,''
  ,''
  ,'en'
  ,'API only'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);

/**
 * Mappings between packages and services
 */
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
   'kenexa_assessments_api'
  ,'kenexa_assessments'
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
   'kenexa_assessments_api'
  ,'kenexa_assessments'
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
),(
   'kenexa_assessments_api'
  ,'kenexa_assessments'
  ,'rbs_assessment'
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
);

/**
 * Define the standard built-in services plus vendor services
 * - _core  : for specifying standard fields (selected, hidden)
 */
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
   'kenexa_assessments'
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
   'kenexa_assessments'
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
),(
   'kenexa_assessments'
  ,'rbs_assessment'
  ,'assessment'
  ,0
  ,'30500'
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
   'kenexa_assessments'
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
   'kenexa_assessments'
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
),(
   'kenexa_assessments'
  ,'rbs_assessment'
  ,''
  ,''
  ,'en'
  ,'RBS Assessment'
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

/**
 * Define the mapping between services and fields.
 */
INSERT INTO `field_mappings` (
   `service_tp_id`
  ,`service_id`
  ,`field_id`
  ,`client_group_id`
  ,`client_user_id`
  ,`field_state`
  ,`field_display`
  ,`field_sensitivity`
  ,`field_cp_state`
  ,`field_cp_display`
  ,`field_cp_sensitivity`
  ,`enabled`
  ,`field_group`
  ,`field_order`
  ,`field_default`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   'kenexa_assessments'
  ,'_core'
  ,'first_name'
  ,''
  ,''
  ,0
  ,1
  ,1
  ,0
  ,1
  ,1
  ,1
  ,200
  ,100
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
),(
   'kenexa_assessments'
  ,'_core'
  ,'last_name'
  ,''
  ,''
  ,0
  ,1
  ,1
  ,0
  ,1
  ,1
  ,1
  ,200
  ,200
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
),(
   'kenexa_assessments'
  ,'rbs_assessment'
  ,'completion_url'
  ,''
  ,''
  ,1
  ,0
  ,1
  ,1
  ,0
  ,1
  ,1
  ,400
  ,100
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);