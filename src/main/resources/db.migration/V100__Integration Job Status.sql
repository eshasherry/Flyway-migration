CREATE TABLE `integration_job_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `agent_id` INT NOT NULL,
  `txn_id` VARCHAR(45) NOT NULL,
  `status` VARCHAR(20) NULL,
  `status_msg` VARCHAR(255) NULL DEFAULT '',
  `last_updated` TIMESTAMP NULL DEFAULT NOW(),
  `num_processed` INT NULL DEFAULT 0,
  `num_completed` INT NULL DEFAULT 0,
  `num_pending` INT NULL DEFAULT 0,
  `num_failed` INT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `txn_id_UNIQUE` (`txn_id` ASC));

CREATE TABLE `integration_agent_status` (
  `agent_id` INT NOT NULL,
  `start_timestamp` TIMESTAMP NULL,
  `num_processed` INT NULL DEFAULT 0,
  `num_completed` INT NULL DEFAULT 0,
  `num_pending` INT NULL DEFAULT 0,
  `num_failed` INT NULL DEFAULT 0,
  UNIQUE INDEX `agent_id_UNIQUE` (`agent_id` ASC),
  PRIMARY KEY (`agent_id`));
