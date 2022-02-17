CREATE TABLE `entity_tracking` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `txn_id` VARCHAR(45) NOT NULL,
  `order_date` TIMESTAMP NOT NULL,
  `external_id` VARCHAR(45) NOT NULL,
  `scope` VARCHAR(45) NOT NULL,
  `client_group_id` VARCHAR(45) NOT NULL,
  `client_user_id` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `talemetry_unique` (`scope` ASC, `external_id` ASC),
  INDEX `search` (`client_group_id` ASC, `client_user_id` ASC, `external_id` ASC));
