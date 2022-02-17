ALTER TABLE `q_email_outbox`
  ADD INDEX `txn_id_idx` (`txn_id`) USING BTREE
 ,ADD INDEX `email_ts_idx` (`email_timedatestamp`) USING BTREE
 ,ADD INDEX `sent_ts_idx` (`sent_timedatestamp`) USING BTREE;
 
ALTER TABLE `q_sent`
  CHANGE COLUMN `user_id` `client_user_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,MODIFY COLUMN `client_group_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,MODIFY COLUMN `tp_id` VARCHAR(45) NOT NULL DEFAULT ''
 ,MODIFY COLUMN `hrnx_status` VARCHAR(45) NOT NULL DEFAULT ''
 ,ADD INDEX `req_ts_idx` (`req_timedatestamp`) USING BTREE;

ALTER TABLE `q_processing`
  DROP INDEX `client_group`
 ,DROP INDEX `status`
 ,DROP INDEX `candidate_client`
 ,ADD INDEX `original_txn_idx` (`original_txn_id`, `order_expiry_processed`, `order_expiry_date`)
 ,ADD INDEX `equivalency_idx` (`client_group_id`, `tp_id`, `user_id`, `tp_uqid`, `equivalency_code`, `original_txn_id`, `req_timedatestamp`);
 
ALTER TABLE `q_incoming`
  DROP KEY `index1`
 ,DROP KEY `index2`
 ,ADD INDEX `txn_status_idx` (`txn_id`,`hrnx_status`)
 ,ADD INDEX `tp_client_idx` (`tp_id`,`client_group_id`,`client_user_id`,`service_provider_id`)
 ,ADD INDEX `receipt_date_idx` (`receipt_timedatestamp`);
