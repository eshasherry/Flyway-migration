ALTER TABLE `entity_tracking` 
ADD COLUMN `agent_id` INT NULL DEFAULT NULL AFTER `client_group_id`,
ALGORITHM=INPLACE, LOCK=NONE;