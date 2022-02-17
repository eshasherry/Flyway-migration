ALTER TABLE `clients` ADD INDEX `data_retention_idx` (`client_group_id` ASC, `data_retention_days` ASC) ;
ALTER TABLE `q_processing` ADD INDEX `data_expiry_idx` (`txn_id` ASC, `client_group_id` ASC, `req_timedatestamp` ASC) ;
