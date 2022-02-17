ALTER TABLE `service_mappings` ADD COLUMN `order_validity_days` SMALLINT(6) NOT NULL DEFAULT -1  AFTER `result_validity_days` ;
