ALTER TABLE `q_email_outbox` 
ADD COLUMN `client_group_id` VARCHAR(45) NULL DEFAULT NULL AFTER `sent_timedatestamp`,
ADD COLUMN `client_user_id` VARCHAR(45) NULL DEFAULT NULL AFTER `client_group_id`,
ADD COLUMN `agent_id` INT(11) NULL DEFAULT NULL AFTER `client_user_id`,
ADD COLUMN `status` VARCHAR(45) NULL AFTER `agent_id`;

