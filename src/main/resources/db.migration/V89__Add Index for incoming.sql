ALTER TABLE `q_incoming` 
 ADD INDEX `txn_results_idx` (`txn_id` ASC, `attempt` ASC, `receipt_timedatestamp` ASC) ;
