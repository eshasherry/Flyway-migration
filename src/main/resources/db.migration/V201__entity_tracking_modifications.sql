ALTER TABLE `entity_tracking` 
DROP COLUMN `client_user_id`,
DROP INDEX `search`;

ALTER TABLE `entity_tracking` 
ADD COLUMN `type` VARCHAR(45) NOT NULL AFTER `status`,
ADD COLUMN `action` VARCHAR(45) NOT NULL AFTER `type`,
DROP INDEX `talemetry_unique`,
ADD UNIQUE INDEX `talemetry_unique` (`client_group_id` ASC, `external_id` ASC, `type` ASC, `scope` ASC);

ALTER TABLE `entity_tracking` 
ADD INDEX `search_client_group_id` (`client_group_id` ASC),
ADD INDEX `search_client_type` (`client_group_id` ASC, `type` ASC, `order_date` ASC),
ADD INDEX `search_client_ext_id` (`client_group_id` ASC, `type` ASC, `external_id` ASC);
