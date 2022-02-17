ALTER TABLE `q_processing` ADD COLUMN `equivalency_code` INT NOT NULL DEFAULT 0  AFTER `subject_id3` , ADD COLUMN `original_txn_id` VARCHAR(45) NOT NULL DEFAULT '' AFTER `equivalency_code`;
