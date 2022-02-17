ALTER TABLE `q_incoming` 
ADD INDEX `txn_status_date_idx` (`txn_id` ASC, `hrnx_status` ASC, `receipt_timedatestamp` ASC) ;
