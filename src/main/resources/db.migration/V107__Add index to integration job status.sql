ALTER TABLE `integration_job_status`
  ADD INDEX `agent_id_index` (`agent_id`),
  ADD INDEX `last_updated_index` (`last_updated` DESC);
