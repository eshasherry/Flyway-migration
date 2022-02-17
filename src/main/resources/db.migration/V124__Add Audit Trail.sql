CREATE TABLE `audit_trail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `action` VARCHAR(6) NOT NULL,
  `date` TIMESTAMP NOT NULL,
  `user` VARCHAR(45) NOT NULL,
  `path` VARCHAR(255) NOT NULL,
  `value` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `date` (`date` ASC),
  INDEX `user` (`user` ASC),
  INDEX `path` (`path` ASC));
