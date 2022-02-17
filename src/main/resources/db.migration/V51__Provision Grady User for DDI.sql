INSERT INTO `clients`
(`client_group_id`,
`clientname`,
`createdDate`,
`activatedDate`,
`createdUser`,
`createdTp`,
`password`,
`groupAuthAllowed`,
`groupAuthAutoCreateUser`,
`reviewCpSubmission`,
`enabled`,
`timezone`,
`client_options`,
`data_retention_days`)
VALUES
('grady_health_system', 
'Grady Health System', now(), now(), 'admin', 'HRNX AWACS', 
'QaGnYFQjtj6Zz0NlUG114oTecxliQhFRL8Hm+D0a5EUilP0BGMw1orjJtnYswq0p', 1, 0, 0, 1, null, '', 365);

-- Map Package to Client
INSERT INTO `package_mappings` (`package_id`, `client_group_id`, `package_select`, `package_display`, `enabled`, `package_group`, `package_order`, `created_date`, `created_tp_id`, `created_tp_user_id`, `updated_date`, `updated_tp_id`, `updated_tp_user_id`) VALUES ('ddi_api', 'grady_health_system', 0, 0, 1, 100, 100, now(), 'ttc_verify', 'ttc_verify', now(), 'ttc_verify', 'ttc_verify');

