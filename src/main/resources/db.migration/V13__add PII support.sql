ALTER TABLE `q_processing` ADD COLUMN `payload_hrnx_pii` BLOB NULL DEFAULT NULL  AFTER `applicant_email` ;

ALTER TABLE `q_incoming` DROP COLUMN `payload_original` , ADD COLUMN `payload_hrnx_pii` BLOB NULL DEFAULT NULL  AFTER `payload_hrnx`;

ALTER TABLE `q_sent` DROP COLUMN `payload_hrnx` , ADD COLUMN `payload_translated_pii` BLOB NULL DEFAULT NULL  AFTER `ip_address`;

ALTER TABLE `q_processing` DROP COLUMN `applicant_email` , DROP COLUMN `applicant_last_name` , DROP COLUMN `applicant_first_name` , DROP COLUMN `ip_address` 
, DROP INDEX `candidate_email` 
, DROP INDEX `candidate_name` 
, DROP INDEX `candidate_id` 
, DROP INDEX `index1` ;

ALTER TABLE `q_incoming` DROP COLUMN `ip_address` ;
ALTER TABLE `q_sent` DROP COLUMN `ip_address` ;
ALTER TABLE `q_sent` DROP COLUMN `payload_translated` ;
ALTER TABLE `hrnx_error_stack` CHANGE COLUMN `error_blob_2` `error_blob_pii` BLOB NULL DEFAULT NULL  ;
