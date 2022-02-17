ALTER TABLE `q_processing` ADD INDEX `activity_id_idx` (`tp_activity_uqid` ASC, `attempt` ASC) ;
ALTER TABLE `q_processing` DROP INDEX `transaction_activity_uniq_key` ;
