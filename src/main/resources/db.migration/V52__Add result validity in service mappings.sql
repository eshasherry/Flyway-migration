ALTER TABLE `service_mappings` ADD COLUMN `result_validity_days` SMALLINT(6) NOT NULL DEFAULT -1  AFTER `updated_tp_user_id` ;
