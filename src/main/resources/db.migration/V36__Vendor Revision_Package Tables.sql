/**
 * The following describes the properties of the package. For example,
 * the default package would be selected/normal, while any system
 * managed package would be disallowed/hidden. Disallowed is mainly
 * for API package where we want to deliberately prevent it from being
 * ordered.
 * 
 *    package_select  (byte): 0 unselected, 1 selected, 2 disallowed
 *    package_display (byte): 0 hidden, 1 normal
 * 
 * The ordering is determined first at the group level then within the
 * group at the order level.
 * 
 *    package_group (short)
 *    package_order (short)
 */
CREATE TABLE `package_mappings` (
  `package_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`client_group_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`client_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`package_select` TINYINT(4) NOT NULL DEFAULT 0
 ,`package_display` TINYINT(4) NOT NULL DEFAULT 1
 ,`enabled` TINYINT(4) NOT NULL DEFAULT 1
 ,`package_group` SMALLINT(6) NOT NULL DEFAULT 0
 ,`package_order` SMALLINT(6) NOT NULL DEFAULT 0
 ,`created_date` TIMESTAMP NOT NULL DEFAULT NOW()
 ,`created_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`created_tp_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`updated_date` TIMESTAMP NOT NULL DEFAULT NOW()
 ,`updated_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`updated_tp_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,PRIMARY KEY (`client_group_id`,`client_user_id`,`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;

/**
 * owning_service_tp_id is simply the owner of the package - ie. the
 * tp who could modify the package in Management Console. It does not
 * indicate the info of the record is necessarily related to such tp.
 * 
 * The vendor package ids (ie external ids) is a json encoded string
 * that maps a service_tp_id to the external vendor id. In cases where
 * multiple vendors share the same id (such as usafacts+quest), the
 * id may be repeated, or the code will use tp="" as default.
 */
CREATE TABLE `package_definitions` (
  `package_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`owning_service_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`vendor_package_ids` MEDIUMTEXT NOT NULL
 ,`created_date` TIMESTAMP NOT NULL DEFAULT NOW()
 ,`created_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`created_tp_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`updated_date` TIMESTAMP NOT NULL DEFAULT NOW()
 ,`updated_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`updated_tp_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,PRIMARY KEY (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;

/**
 * language: the 2 letter language code for now, lowercase.
 */
CREATE TABLE `package_texts` (
  `package_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`client_group_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`client_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`language` VARCHAR(6) NOT NULL DEFAULT ''
 ,`package_name` VARCHAR(255) NOT NULL DEFAULT ''
 ,`created_date` TIMESTAMP NOT NULL DEFAULT NOW()
 ,`created_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`created_tp_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`updated_date` TIMESTAMP NOT NULL DEFAULT NOW()
 ,`updated_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`updated_tp_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,PRIMARY KEY (`client_group_id`,`client_user_id`,`package_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
