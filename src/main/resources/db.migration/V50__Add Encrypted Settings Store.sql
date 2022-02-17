CREATE TABLE `service_credentials` (
  `service_tp_id` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT '',
  `client_group_id` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT '',
  `client_user_id` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT '',
  `key` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` blob,
  `created_date` timestamp NOT NULL DEFAULT NOW(),
  `created_tp_id` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created_tp_user_id` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT '',
  `updated_date` timestamp NOT NULL DEFAULT NOW(),
  `updated_tp_id` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT '',
  `updated_tp_user_id` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`client_group_id`,`client_user_id`,`service_tp_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;