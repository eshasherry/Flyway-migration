INSERT INTO `services`
(
`service_id`,
`service_tp_id`,
`service_categoryid`,
`repeatable`,
`display`,
`enabled`,
`expressOk`,
`vendor_service_id`)
VALUES
(
'rbs_assessment',
'kenexa_assessments',
'assessment',
0,
0,
1,
0,
'30500'
);

INSERT INTO `services_text`
(`tp_id`,
`service_id`,
`client_group_id`,
`client_user_id`,
`service_name`,
`service_diz`,
`instructions_widget`,
`instructions_candidate`)
VALUES
(
'kenexa_assessments',
'rbs_assessment',
'rbs',
NULL,
'RBS Assessment',
NULL,
NULL,
NULL
);

UPDATE partner_service_mappings SET service_id = 'rbs_assessment' WHERE partner_id='kenexa_assessments' and client_group_id='rbs';

