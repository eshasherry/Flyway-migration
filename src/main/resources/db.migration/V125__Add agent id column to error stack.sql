ALTER TABLE `hrnx_error_stack`
  ADD COLUMN `agent_id` INT(11) DEFAULT NULL AFTER `txn_id`,
  ADD INDEX `agent_id_index` (`agent_id`);
