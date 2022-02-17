ALTER TABLE `q_processing` ADD COLUMN `tp_id` VARCHAR(45) NULL  AFTER `REQUESTOR_ID` ;
ALTER TABLE `q_processing` 
DROP INDEX `transaction_activity_uniq_key` 
, ADD UNIQUE INDEX `transaction_activity_uniq_key` (`client_group_id` ASC, `tp_id` ASC, `tp_activity_uqid` ASC) ;
