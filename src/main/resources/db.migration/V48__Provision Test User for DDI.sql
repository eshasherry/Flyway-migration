INSERT INTO `trading_partners` (`partner_id`, `password`,`partner_name`, `partner_type`, `enabled`) VALUES ('ddi', 'RdS6gUsxwzGDvmKQpGEJTCLmRPR5e/wIiMsUD474aCfsMNPgZzVfijH+VbCIu85n','Development Dimensions International', 'assessment', 1);

-- Packages (ddi_api)
INSERT INTO `package_definitions` (`package_id`, `owning_service_tp_id`, `vendor_package_ids`, `created_date`, `created_tp_id`, `created_tp_user_id`, `updated_date`, `updated_tp_id`, `updated_tp_user_id`) VALUES ('ddi_api', 'ttc_verify', '{\"\":\"\"}', now(), 'ttc_verify', 'ttc_verify', now(), 'ttc_verify', 'ttc_verify');
INSERT INTO `package_texts` (`package_id`, `language`, `package_name`, `created_date`, `created_tp_id`, `created_tp_user_id`, `updated_date`, `updated_tp_id`, `updated_tp_user_id`) VALUES ('ddi_api', 'en', 'API only', now(), 'ttc_verify', 'ttc_verify', now(), 'ttc_verify', 'ttc_verify');

-- Map Package to Test Client
INSERT INTO `package_mappings` (`package_id`, `client_group_id`, `package_select`, `package_display`, `enabled`, `package_group`, `package_order`, `created_date`, `created_tp_id`, `created_tp_user_id`, `updated_date`, `updated_tp_id`, `updated_tp_user_id`) VALUES ('ddi_api', 'test_client_ttc', 0, 0, 1, 100, 100, now(), 'ttc_verify', 'ttc_verify', now(), 'ttc_verify', 'ttc_verify');

-- Services
INSERT INTO `service_definitions` (`service_tp_id`, `service_id`, `service_category_id`, `repeatable`, `vendor_service_id`, `created_date`, `created_tp_id`, `created_tp_user_id`, `updated_date`, `updated_tp_id`, `updated_tp_user_id`) VALUES ('ddi', 'ddi_assessment', 'assessment', 0, 'e610674a-e285-47ad-9ac4-9f3b9a348397', now(), 'ttc_verify', 'ttc_verify', now(), 'ttc_verify', 'ttc_verify');
INSERT INTO `service_texts` (`service_tp_id`, `service_id`, `language`, `service_name`, `created_date`, `created_tp_id`, `created_tp_user_id`, `updated_date`, `updated_tp_id`, `updated_tp_user_id`, `service_diz`, `instructions_widget`, `instructions_candidate`) VALUES ('ddi', 'ddi_assessment', 'en', 'Assessment', now(), 'ttc_verify', 'ttc_verify', now(), 'ttc_verify', 'ttc_verify', '','','');

-- Service Mapping to map package to services
INSERT INTO `service_mappings` (`package_id`, `service_tp_id`, `service_id`, `client_group_id`, `client_user_id`, `service_select`, `service_display`, `enabled`, `service_group`, `service_order`, `created_date`, `created_tp_id`, `created_tp_user_id`, `updated_date`, `updated_tp_id`, `updated_tp_user_id`) VALUES ('ddi_api', 'ddi', 'ddi_assessment', '', '', 0, 1, 1, 200, 100, now(), 'ttc_verify', 'ttc_verify', now(), 'ttc_verify', 'ttc_verify');

-- Map field to the service
INSERT INTO `field_mappings` (`service_tp_id`, `service_id`, `field_id`, `field_state`, `field_display`, `field_sensitivity`, `field_cp_state`, `field_cp_display`, `field_cp_sensitivity`, `enabled`, `field_group`, `field_order`, `created_date`, `created_tp_id`, `created_tp_user_id`, `updated_date`, `updated_tp_id`, `updated_tp_user_id`) VALUES ('ddi', 'ddi_assessment', 'email', 1, 0, 0, 1, 0, 0, 1, 400, 100, now(), 'ttc_verify', 'ttc_verify', now(), 'ttc_verify', 'ttc_verify');
INSERT INTO `field_mappings` (`service_tp_id`, `service_id`, `field_id`, `field_state`, `field_display`, `field_sensitivity`, `field_cp_state`, `field_cp_display`, `field_cp_sensitivity`, `enabled`, `field_group`, `field_order`, `created_date`, `created_tp_id`, `created_tp_user_id`, `updated_date`, `updated_tp_id`, `updated_tp_user_id`) VALUES ('ddi', 'ddi_assessment', 'first_name', 1, 0, 0, 1, 0, 0, 1, 400, 100, now(), 'ttc_verify', 'ttc_verify', now(), 'ttc_verify', 'ttc_verify');
INSERT INTO `field_mappings` (`service_tp_id`, `service_id`, `field_id`, `field_state`, `field_display`, `field_sensitivity`, `field_cp_state`, `field_cp_display`, `field_cp_sensitivity`, `enabled`, `field_group`, `field_order`, `created_date`, `created_tp_id`, `created_tp_user_id`, `updated_date`, `updated_tp_id`, `updated_tp_user_id`) VALUES ('ddi', 'ddi_assessment', 'last_name', 1, 0, 0, 1, 0, 0, 1, 400, 100, now(), 'ttc_verify', 'ttc_verify', now(), 'ttc_verify', 'ttc_verify');

