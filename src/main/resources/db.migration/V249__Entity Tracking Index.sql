ALTER TABLE `entity_tracking` 
DROP INDEX `talemetry_unique`,
ADD INDEX `search_client_txn_id` (`client_group_id` ASC, `txn_id` ASC, `type` ASC),
ADD INDEX `search_txn_id` (`txn_id` ASC, `type` ASC),
ADD INDEX `search_client_status` (`client_group_id` ASC, `type` ASC, `status` ASC, `order_date` ASC);
