ALTER TABLE `q_incoming` 
ADD INDEX `txn_attempt_status` (`hrnx_status` ASC, `attempt` ASC, `txn_id` ASC, `receipt_timedatestamp` ASC);
