ALTER TABLE `service_mappings` ADD COLUMN `max_retry_attempts` SMALLINT NOT NULL DEFAULT 0  AFTER `order_validity_days` ;
ALTER TABLE `service_mappings` ADD COLUMN `retry_interval_multiplier` SMALLINT NOT NULL DEFAULT 1  AFTER `max_retry_attempts` ;

ALTER TABLE `q_incoming` ADD COLUMN `attempt` TINYINT UNSIGNED NOT NULL DEFAULT 1  AFTER `receipt_timedatestamp` ;
ALTER TABLE `q_processing` CHANGE COLUMN `attempt` `attempt` TINYINT UNSIGNED NULL DEFAULT 1  ;


ALTER TABLE `q_incoming` ADD INDEX `txn_attempt_idx` (`txn_id` ASC, `attempt` ASC) ;
ALTER TABLE `q_processing` ADD COLUMN `recovery_enabled` TINYINT(1) NOT NULL DEFAULT 1  AFTER `order_expiry_processed` ;
