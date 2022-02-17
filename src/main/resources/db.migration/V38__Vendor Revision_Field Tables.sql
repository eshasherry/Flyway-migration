/**
 * The following describes the properties of the field.
 * 
 *    field_state          (byte): 0 optional, 1 required
 *    field_display        (byte): 0 hidden, 1 normal, 2 readonly
 *    field_sensitivity    (byte): 0 password, 1 normal, 2 redacted
 *    field_cp_state       (byte): 0 optional, 1 required, 2 disallowed
 *    field_cp_display     (byte): 0 hidden, 1 normal, 2 readonly
 *    field_cp_sensitivity (byte): 0 password, 1 normal, 2 redacted
 * 
 * The ordering is determined first at the group level then within the
 * group at the order level.
 * 
 *    field_group (short)
 *    field_order (short)
 * 
 * The field_default does not capture type information, but the value
 * should be parsable to the correct field type. It is in the mapping
 * table since each service could assume a different default for the
 * same field.
 */
CREATE TABLE `field_mappings` (
  `service_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`service_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`field_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`client_group_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`client_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`field_state` TINYINT(4) NOT NULL DEFAULT 0
 ,`field_display` TINYINT(4) NOT NULL DEFAULT 1
 ,`field_sensitivity` TINYINT(4) NOT NULL DEFAULT 1
 ,`field_cp_state` TINYINT(4) NOT NULL DEFAULT 0
 ,`field_cp_display` TINYINT(4) NOT NULL DEFAULT 1
 ,`field_cp_sensitivity` TINYINT(4) NOT NULL DEFAULT 1
 ,`enabled` TINYINT(4) NOT NULL DEFAULT 1
 ,`field_group` SMALLINT(6) NOT NULL DEFAULT 0
 ,`field_order` SMALLINT(6) NOT NULL DEFAULT 0
 ,`field_default` VARCHAR(255) NOT NULL DEFAULT ''
 ,`created_date` TIMESTAMP NOT NULL DEFAULT NOW()
 ,`created_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`created_tp_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`updated_date` TIMESTAMP NOT NULL DEFAULT NOW()
 ,`updated_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`updated_tp_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,PRIMARY KEY (`client_group_id`,`client_user_id`,`service_tp_id`,`service_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;

/**
 * field_level (byte): 0 system, 1 ats, 2 subject, 3 vendor, 4 service
 * field_type (byte): 0 string, 1 integer, 2 double, 3 date, 4 datetime, 5 list, 6 radio, 7 check, 8 combo, 9 custom
 */
CREATE TABLE `field_definitions` (
  `field_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`field_level` TINYINT(4) NOT NULL DEFAULT 4
 ,`field_type` TINYINT(4) NOT NULL DEFAULT 0
 ,`field_size` INT(11) NOT NULL DEFAULT 0
 ,`regex_check` VARCHAR(255) NOT NULL DEFAULT ''
 ,`vendor_field_id` VARCHAR(255) NOT NULL DEFAULT ''
 ,`created_date` TIMESTAMP NOT NULL DEFAULT NOW()
 ,`created_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`created_tp_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`updated_date` TIMESTAMP NOT NULL DEFAULT NOW()
 ,`updated_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`updated_tp_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,PRIMARY KEY (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;

/**
 * field_name: Name of the field
 * field_tooltip: Display in widget and candidate portal
 * field_comment: Display in management console
 * language: the 2 letter language code for now, lowercase.
 */
CREATE TABLE `field_texts` (
  `field_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`client_group_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`client_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`language` VARCHAR(6) NOT NULL DEFAULT ''
 ,`field_name` VARCHAR(255) NOT NULL DEFAULT ''
 ,`field_tooltip` VARCHAR(255) NOT NULL DEFAULT ''
 ,`field_comment` MEDIUMTEXT NOT NULL
 ,`created_date` TIMESTAMP NOT NULL DEFAULT NOW()
 ,`created_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`created_tp_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`updated_date` TIMESTAMP NOT NULL DEFAULT NOW()
 ,`updated_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`updated_tp_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,PRIMARY KEY (`client_group_id`,`client_user_id`,`field_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
