CREATE TABLE `agent_entity_recovery` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `agent_id` INT NOT NULL,
  `action` VARCHAR(45) NULL,
  `group` VARCHAR(45) NULL,
  `external_id` VARCHAR(128) NOT NULL,
  `creation_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  `last_updated_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
  `cnt` INT NOT NULL DEFAULT 1,  
  `retry` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UQ` (`agent_id` ASC, `action` ASC, `group` ASC, `external_id` ASC));
