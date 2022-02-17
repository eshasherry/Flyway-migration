ALTER TABLE `entity_tracking` 
ADD COLUMN `first_name` VARCHAR(100) NULL DEFAULT NULL AFTER `action`,
ADD COLUMN `last_name` VARCHAR(100) NULL DEFAULT NULL AFTER `first_name`,
ADD COLUMN `email` VARCHAR(100) NULL DEFAULT NULL AFTER `last_name`,
ADD INDEX `search_client_email` (`client_group_id` ASC, `type` ASC, `email` ASC),
ADD INDEX `search_client_name` (`client_group_id` ASC, `type` ASC, `first_name` ASC, `last_name` ASC);