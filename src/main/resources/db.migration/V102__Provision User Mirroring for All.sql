DELETE FROM integration_transform_settings
  WHERE xslt_id='mirroring_users_tee'
    AND service_id='mirror_users'
    AND client_group_id='test_client_ttc'
    AND system_id='';

CREATE TABLE `integration_transform_settings_tmp` (
  `service_tp_id` varchar(45) COLLATE utf8_bin NOT NULL,
  `client_group_id` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `client_user_id` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `source_tp_id` varchar(45) COLLATE utf8_bin NOT NULL,
  `system_id` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `action` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `service_id` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `xslt_id` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO integration_transform_settings_tmp
(
`service_tp_id`,
`client_group_id`,
`client_user_id`,
`source_tp_id`,
`system_id`,
`action`,
`service_id`,
`xslt_id`)
  SELECT `service_tp_id`,
  `client_group_id`,
  `client_user_id`,
  `source_tp_id` ,
  `system_id` ,
  `action` ,
  `service_id`,
  `xslt_id` FROM integration_transform_settings where xslt_id='candidates_add_tee';

UPDATE integration_transform_settings_tmp
  SET xslt_id='mirroring_users_tee',
      action='UPDATE',
      service_id='mirror_users';

INSERT INTO integration_transform_settings
  SELECT 0,x.*
  FROM integration_transform_settings_tmp x;

DROP TABLE integration_transform_settings_tmp;
