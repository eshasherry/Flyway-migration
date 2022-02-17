CREATE TABLE `agent_configurations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `agent_name` VARCHAR(100) NOT NULL,
  `agent_type` VARCHAR(100) NOT NULL,
  `client_group_id` VARCHAR(45) NOT NULL,
  `client_user_id` VARCHAR(45) NOT NULL,
  `agent_cron` VARCHAR(45) NOT NULL,
  `enabled` TINYINT(1) NOT NULL,
  `properties` MEDIUMBLOB NULL,
  PRIMARY KEY (`id`)) CHARACTER SET utf8 COLLATE utf8_bin;
