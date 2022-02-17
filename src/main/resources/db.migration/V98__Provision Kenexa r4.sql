-- Provisioning involves a few steps
-- 1. Create the new TP
-- 2. Create the new Service (and add Service mapping)
-- 3. Create the package
-- 4. Create the new Fields for the Service (and add Service -> Field mapping)
--
-- STEP 1 ---
INSERT INTO `trading_partners`
(`partner_id`, `partner_name`, `date_started`, `partner_type`, `password`, `logo_large`, `logo_sp`, `logo_small`, `contact_info`, `enabled`,
	`city`, `state`, `enroll_html`, `fields_reqd`, `fields_optl`, `custom_bottom`, `custom_top`, `custom_top_enroll`, `credit_cards`,
	`custom_bottom_enroll`, `notification_level`, `notification_recipients`)
VALUES
(
'kenexa_assessments_r4', 'Kenexa Assessments r4', NULL, 'assessment', 'dQadHfDHRr4VUO6qorBS6V40DVJXr9q62MFYOw7MxE+CJDqRqdZOn2BuJ90nyUeq', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL
);
--
-- STEP 2 ----
--
--
INSERT INTO `service_definitions` (
   `service_tp_id`,`service_id`,`service_category_id`,`repeatable`,`vendor_service_id`,`created_date`,`created_tp_id`
  ,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`) VALUES 
  ('kenexa_assessments_r4','_core','_core',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('kenexa_assessments_r4','_core_vendor','_core',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('kenexa_assessments_r4','test_assessment','assessment',0,'d3586758d9904698aa72706485ff1aa5',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('kenexa_assessments_r4','rbs_assessment','assessment',0,'af1093350d824c4ead08b09cd7d895df',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_texts` (
   `service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`language`,`service_name`,`service_diz`
  ,`instructions_widget`,`instructions_candidate`,`created_date`,`created_tp_id`,`created_tp_user_id`
  ,`updated_date`,`updated_tp_id`,`updated_tp_user_id`) VALUES 
  ('kenexa_assessments_r4','_core','','','en','Built-in','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('kenexa_assessments_r4','_core_vendor','','','en','Built-in (Vendor)','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('kenexa_assessments_r4','test_assessment','','','en','Test Assessment','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
  ('kenexa_assessments_r4','rbs_assessment','','','en','RBS Assessment r4','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_mappings`
(`package_id`,`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`service_select`,`service_display`,`enabled`,
	`service_group`,`service_order`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`,
	`updated_tp_user_id`,`result_validity_days`,`order_validity_days`,`max_retry_attempts`,`retry_interval_multiplier`)
VALUES
('kenexa_assessments_r4_api','kenexa_assessments_r4','rbs_assessment','','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1),
('kenexa_assessments_r4_api','kenexa_assessments_r4','test_assessment','','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1),
('kenexa_assessments_r4_api','kenexa_assessments_r4','_core','','',2,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1),
('kenexa_assessments_r4_api','kenexa_assessments_r4','_core_vendor','','',2,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1);

--
--
-- STEP 3
--

INSERT INTO `package_definitions` (
   `package_id`,`owning_service_tp_id`,`vendor_package_ids`,`created_date`,`created_tp_id`,`created_tp_user_id`
  ,`updated_date`,`updated_tp_id`,`updated_tp_user_id`
) VALUES (
   'kenexa_assessments_r4_api','ttc_verify','{"":""}',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `package_texts` (
   `package_id`,`client_group_id`,`client_user_id`,`language`,`package_name`,`created_date`,`created_tp_id`,`created_tp_user_id`
  ,`updated_date`,`updated_tp_id`,`updated_tp_user_id`
) VALUES (
   'kenexa_assessments_r4_api','','','en','API only',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'
);
INSERT INTO `package_mappings`
(`package_id`,`client_group_id`,`client_user_id`,`package_select`,`package_display`,`enabled`,`package_group`,`package_order`,
`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES
('kenexa_assessments_r4_api','rbs','',2,0,1,100,100,NOW(),'ttc_verify', 'ttc_verify', NOW(), 'ttc_verify', 'ttc_verify'),
('kenexa_assessments_r4_api','test_client_ttc','',2,0,1,100,100,NOW(),'ttc_verify', 'ttc_verify', NOW(), 'ttc_verify', 'ttc_verify');

--
-- STEP 4
--
INSERT INTO `field_mappings` (
   `service_tp_id`,`service_id`,`field_id`,`client_group_id`,`client_user_id`,`field_state`,`field_display`,`field_sensitivity`
  ,`field_cp_state`,`field_cp_display`,`field_cp_sensitivity`,`enabled`,`field_group`,`field_order`,`field_default`,`created_date`
  ,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`) VALUES 
('kenexa_assessments_r4','rbs_assessment','completion_url','','',1,0,1,1,0,1,1,400,100,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
('kenexa_assessments_r4','test_assessment','request_locale','','',1,0,1,1,0,1,1,400,100,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
('kenexa_assessments_r4','test_assessment','completion_url','','',1,0,1,1,0,1,1,400,100,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
('kenexa_assessments_r4','rbs_assessment','request_locale','','',1,0,1,1,0,1,1,400,100,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');


INSERT INTO `field_texts`
(`field_id`,`client_group_id`,`client_user_id`,`language`,`field_name`,`field_tooltip`,`field_comment`,`created_date`,
`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES
('request_locale','','','en','Locale of assessment to request','','',NOW(),'ttc_verify','',NOW(),'ttc_verify','');

INSERT INTO `field_definitions`
(`field_id`,`field_level`,`field_type`,`field_size`,`regex_check`,`vendor_field_id`,`created_date`,
`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES
('request_locale',4,0,0,'','',NOW(),'ttc_verify','',NOW(),'ttc_verify','');


INSERT INTO `service_settings`
(`service_tp_id`,`client_group_id`,`client_user_id`,`key`,`value`,`created_date`,`created_tp_id`,`created_tp_user_id`,
`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES
('kenexa_assessments_r4','rbs','','default_locale','en-GB',NOW(),'ttc_verify','',NOW(),'ttc_verify',''),
('kenexa_assessments_r4','test_client_ttc','','default_locale','en-GB',NOW(),'ttc_verify','',NOW(),'ttc_verify','');

