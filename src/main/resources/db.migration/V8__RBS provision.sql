INSERT INTO `clients`
(`client_group_id`,
`clientname`,
`createdDate`,
`activatedDate`,
`createdUser`,
`createdTp`,
`password`,
`groupAuthAllowed`,
`groupAuthLogUser`,
`groupAuthAutoCreateUser`,
`reviewCpSubmission`,
`rowEnc`,
`enabled`,
`timezone`)
VALUES
('rbs','RBS','2012-8-23','2012-8-23',NULL,'HRNX AWACS','VVWouZ7lqF0fUynQ',1,1,0,0,NULL,1,NULL);

INSERT INTO `partner_service_mappings`
(
`date_created`,
`date_activated`,
`partner_id`,
`client_group_id`,
`client_user_id`,
`createdUser`,
`createdTp`,
`service_categoryid`,
`service_id`,
`enabled`)
VALUES
(
'2012-08-23 00:00:00', '2012-08-23 00:00:00', 'ka1_qa', 'rbs', NULL, NULL, NULL, 'assessment', NULL, '1'
);


INSERT INTO `partner_service_mappings`
(
`date_created`,
`date_activated`,
`partner_id`,
`client_group_id`,
`client_user_id`,
`createdUser`,
`createdTp`,
`service_categoryid`,
`service_id`,
`enabled`)
VALUES
(
'2012-08-23 00:00:00', '2012-08-23 00:00:00', 'ka1_prod', 'rbs', NULL, NULL, NULL, 'assessment', NULL, '1'
);
