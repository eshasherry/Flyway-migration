/**
 * Remove unused column and consistent naming
 */
ALTER TABLE `services_category`
  DROP COLUMN `enabled`
 ,CHANGE COLUMN `service_categoryid` `service_category_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,CHANGE COLUMN `service_categoryname` `service_category_name` VARCHAR(255) NOT NULL DEFAULT '';

RENAME TABLE `services_category` TO `service_categories`;

INSERT INTO `service_categories` (
   `service_category_id`
  ,`service_category_name`
) VALUES (
   '_core'
  ,'Built-in'
);

/**
 * The following describes the properties of the service. The disallowed
 * state is used for _core_subject and _core_vendor services, which cannot
 * be ordered explicitly. Plus they are system managed, meaning they would
 * automatically be added/removed by the system (such as when switching
 * between packages or when all services for a vendor is unselected). This
 * is different than selected/hidden in which it is still not managed by
 * the system. ie. If selected/hidden, it can never be unselected...
 * 
 *    service_select  (byte): 0 unselected, 1 selected, 2 disallowed
 *    service_display (byte): 0 hidden, 1 normal, 2 readonly
 * 
 * The ordering is determined first at the group level then within the
 * group at the order level.
 * 
 *    service_group (short)
 *    service_order (short)
 */
CREATE TABLE `service_mappings` (
  `package_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`service_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`service_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`client_group_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`client_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`service_select` TINYINT(4) NOT NULL DEFAULT 0
 ,`service_display` TINYINT(4) NOT NULL DEFAULT 1
 ,`enabled` TINYINT(4) NOT NULL DEFAULT 1
 ,`service_group` SMALLINT(6) NOT NULL DEFAULT 0
 ,`service_order` SMALLINT(6) NOT NULL DEFAULT 0
 ,`created_date` TIMESTAMP NOT NULL DEFAULT NOW()
 ,`created_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`created_tp_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`updated_date` TIMESTAMP NOT NULL DEFAULT NOW()
 ,`updated_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`updated_tp_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,PRIMARY KEY (`client_group_id`,`client_user_id`,`package_id`,`service_tp_id`,`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;

/**
 * repeatable is a boolean.
 */
CREATE TABLE `service_definitions` (
  `service_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`service_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`service_category_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`repeatable` TINYINT(4) NOT NULL DEFAULT 1
 ,`vendor_service_id` VARCHAR(255) NOT NULL DEFAULT ''
 ,`created_date` TIMESTAMP NOT NULL DEFAULT NOW()
 ,`created_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`created_tp_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`updated_date` TIMESTAMP NOT NULL DEFAULT NOW()
 ,`updated_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`updated_tp_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,PRIMARY KEY (`service_tp_id`,`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;

/**
 * language: the 2 letter language code for now, lowercase.
 */
CREATE TABLE `service_texts` (
  `service_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`service_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`client_group_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`client_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`language` VARCHAR(6) NOT NULL DEFAULT ''
 ,`service_name` VARCHAR(255) NOT NULL DEFAULT ''
 ,`service_diz` MEDIUMTEXT NOT NULL
 ,`instructions_widget` MEDIUMTEXT NOT NULL
 ,`instructions_candidate` MEDIUMTEXT NOT NULL
 ,`created_date` TIMESTAMP NOT NULL DEFAULT NOW()
 ,`created_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`created_tp_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`updated_date` TIMESTAMP NOT NULL DEFAULT NOW()
 ,`updated_tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,`updated_tp_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,PRIMARY KEY (`client_group_id`,`client_user_id`,`service_tp_id`,`service_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
