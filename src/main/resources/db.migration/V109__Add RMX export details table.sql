CREATE TABLE `rmx_export_details` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rmx_guid` VARCHAR(45) NOT NULL,
  `txn_id` VARCHAR(45) NOT NULL,
  `attachment_id` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL,
  `last_name` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL,
  `email` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL,
  `client_group_id` VARCHAR(45) NOT NULL,
  `client_user_id` VARCHAR(45) NOT NULL,
  `agent_id` VARCHAR(45) NULL,
  `application_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  `process_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_idx` (`rmx_guid`, `attachment_id`),
  INDEX `client_idx` (`client_group_id`, `client_user_id`),
  INDEX `agent_idx` (`agent_id`),
  INDEX `search_idx` (`first_name` ASC, `last_name` ASC, `email` ASC),
  INDEX `status_idx` (`status`),
  INDEX `process_idx` (`process_date` DESC)
  );
