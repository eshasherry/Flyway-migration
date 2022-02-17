CREATE INDEX q_incoming_idx_10 ON q_incoming (txn_id, hrnx_status, tp_id, client_group_id, receipt_timedatestamp) ALGORITHM=INPLACE LOCK=NONE;
ALTER TABLE `q_incoming` 
DROP INDEX `tp_client_idx` ;