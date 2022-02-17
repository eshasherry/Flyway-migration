ALTER TABLE q_processing ADD UNIQUE KEY `transaction_activity_uniq_key` (
  client_group_id, tp_activity_uqid
);
ALTER TABLE `q_processing` 
DROP INDEX `activity_id` ;
