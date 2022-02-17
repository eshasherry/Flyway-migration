ALTER TABLE `integration_job_status`
  ADD COLUMN `action` VARCHAR(20) NULL AFTER `txn_id`;
