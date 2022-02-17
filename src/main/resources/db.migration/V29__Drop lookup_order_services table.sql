drop table `lookup_order_services`;
ALTER TABLE `q_processing` ADD COLUMN `subject_id1` BLOB NULL DEFAULT NULL  AFTER `tp_id` , ADD COLUMN `subject_id2` BLOB NULL DEFAULT NULL  AFTER `subject_id1` , ADD COLUMN `subject_id3` BLOB NULL DEFAULT NULL  AFTER `subject_id2` ;
