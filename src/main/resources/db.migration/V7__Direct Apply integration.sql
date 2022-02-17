INSERT INTO `settings_endpoints`
(
`name`,
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
'ttc_apply_staging_ep2', 'passThruResponse', 'ttc_apply_staging', 'rbs', '/esb/ws/0Rrqr8jBiJT5PM/PostStatusUpdate.event', 'https://profile.talemetry-staging.net/assessment_results', 'FORM POST', 'txn_id=&payload=&endpoint_id=&client_group_id=', '10', '120', 'email', '60', '443', '1', NULL, '1', NULL, NULL, NULL
);

INSERT INTO `settings_endpoints`
(
`name`,
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
('ttc_apply_staging_ep1', 'loadWidget', 'ttc_apply_staging', NULL, NULL, NULL, NULL, NULL, '10', '120', 'email', '60', '443', '1', NULL, '1', NULL, NULL, NULL);

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
('ttc_apply_prod_ep2', 'passThruResponse', 'ttc_apply_prod', 'rbs', '/esb/ws/0Rrqr8jBiJT5PM/PostStatusUpdate.event', 'https://profile.talemetry.com/assessment_results', 'FORM POST', 'txn_id=&payload=&endpoint_id=&client_group_id=', '10', '120', 'email', '60', '443', '1', NULL, '1', NULL, NULL, NULL);

INSERT INTO `settings_endpoints`
(
`name`,
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
'ttc_apply_prod_ep1', 'loadWidget', 'ttc_apply_prod', NULL, NULL, NULL, NULL, NULL, '10', '120', 'email', '60', '443', '1', NULL, '1', NULL, NULL, NULL
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
'ttc_apply_prod', 'Talent Tech (Apply Production)', NULL, 'ats', 'yZNfHD5T/1u3pOPI4FXeMNhq7isVYQj1Wdw+NpIXQuMMK0GjvXXmBPouv1XBB+T0', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
'ttc_apply_staging', 'Talent Tech (Apply Staging)', NULL, 'ats', 'yZNfHD5T/1u3pOPI4FXeMNhq7isVYQj1Wdw+NpIXQuMMK0GjvXXmBPouv1XBB+T0', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL
);
