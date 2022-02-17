INSERT INTO `settings_endpoints`
(`name`,
`endpoint_category`,
`partner_id`,
`client_group_id`,
`address_preprocessing`,
`address`,
`endpoint_type`,
`endpoint_options`,
`retry`,
`retry_delay`,
`timeout_action`,
`timeout_duration`,
`port`,
`enabled`,
`critical`,
`priority`,
`xslt`,
`xslt_preprocessing`,
`allowed_ips`)
VALUES
(
'ka1_prod_ep1', 'passThru', 'ka1_prod', NULL, '/esb/ws/ka1/CreateOrder.event', 'http://qte5.psl.com/qte/system/pages/preCheck.asp', 'FORM POST', 'txn_id=&payload=&endpoint_id=&client_group_id=', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL
);

INSERT INTO `settings_endpoints`
(`name`,
`endpoint_category`,
`partner_id`,
`client_group_id`,
`address_preprocessing`,
`address`,
`endpoint_type`,
`endpoint_options`,
`retry`,
`retry_delay`,
`timeout_action`,
`timeout_duration`,
`port`,
`enabled`,
`critical`,
`priority`,
`xslt`,
`xslt_preprocessing`,
`allowed_ips`)
VALUES
(
'ka1_qa_ep1', 'passThru', 'ka1_qa', NULL, '/esb/ws/ka1/CreateOrder.event', 'http://qte5.psl.com/qte/system/pages/preCheck.asp', 'FORM POST', 'txn_id=&payload=&partner_id=&endpoint_id=&client_group_id=', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL
);

INSERT INTO `trading_partners`
(`partner_id`,
`partner_name`,
`date_started`,
`partner_type`,
`password`,
`logo_large`,
`logo_sp`,
`logo_small`,
`contact_info`,
`enabled`,
`city`,
`state`,
`enroll_html`,
`fields_reqd`,
`fields_optl`,
`custom_bottom`,
`custom_top`,
`custom_top_enroll`,
`credit_cards`,
`custom_bottom_enroll`,
`notification_level`,
`notification_recipients`)
VALUES
(
'ka1_prod', 'Kenexa Assessments', NULL, 'assessment', 'dQadHfDHRr4VUO6qorBS6V40DVJXr9q62MFYOw7MxE+CJDqRqdZOn2BuJ90nyUeq', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL
);

INSERT INTO `trading_partners`
(`partner_id`,
`partner_name`,
`date_started`,
`partner_type`,
`password`,
`logo_large`,
`logo_sp`,
`logo_small`,
`contact_info`,
`enabled`,
`city`,
`state`,
`enroll_html`,
`fields_reqd`,
`fields_optl`,
`custom_bottom`,
`custom_top`,
`custom_top_enroll`,
`credit_cards`,
`custom_bottom_enroll`,
`notification_level`,
`notification_recipients`)
VALUES
(
'ka1_qa', 'Kenexa Assessments QA', NULL, 'assessment', 'dQadHfDHRr4VUO6qorBS6V40DVJXr9q62MFYOw7MxE+CJDqRqdZOn2BuJ90nyUeq', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL
);

INSERT INTO `service_settings` (`tp_id`, `client_group_id`, `key`, `value`) VALUES ('ka1_qa', 'rbs', '1', '30500');
INSERT INTO `service_settings` (`tp_id`, `client_group_id`, `key`, `value`) VALUES ('ka1_prod', 'rbs', '1', '30500');
