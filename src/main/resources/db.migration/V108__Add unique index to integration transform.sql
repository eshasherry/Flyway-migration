ALTER TABLE `integration_transform_settings`
  ADD UNIQUE INDEX `unique_index` (`service_tp_id`, `service_id`, `source_tp_id`, `client_group_id`, `client_user_id`, `action`, `system_id`);
