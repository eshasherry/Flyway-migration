CREATE TABLE `eligible_recovery_transactions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `txn_id` VARCHAR(45) NOT NULL,
  `attempt` INT NOT NULL,
  `status` VARCHAR(16) NOT NULL,
  `countdown` INT NOT NULL,
  `run_timestamp` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `unique` (`txn_id` ASC, `attempt` ASC),
  INDEX `query` (`status` ASC, `run_timestamp` ASC));
