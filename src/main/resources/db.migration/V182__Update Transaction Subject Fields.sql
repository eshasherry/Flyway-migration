ALTER TABLE q_processing
MODIFY COLUMN subject_id1 VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL,
MODIFY COLUMN subject_id2 VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL,
MODIFY COLUMN subject_id3 VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL DEFAULT NULL,
ADD INDEX subject_id1_index (subject_id1),
ADD INDEX subject_id2_index (subject_id2),
ADD INDEX subject_id3_index (subject_id3);
