DELIMITER $$
-- Create a temporary stored procedure for checking if Indexes exist before attempting to re-create them.
DROP PROCEDURE IF EXISTS `spCreateIndex` $$
CREATE PROCEDURE `spCreateIndex` (tableName VARCHAR(128), in indexName VARCHAR(128), in indexColumns VARCHAR(128), in sortOrder VARCHAR(4))
BEGIN
  IF((SELECT COUNT(*) AS index_exists FROM information_schema.statistics WHERE TABLE_SCHEMA = DATABASE() AND table_name = tableName AND index_name = indexName)  = 0) THEN
    SET @sqlCommand = CONCAT('CREATE INDEX ' , indexName , ' ON ' , tableName, '(', indexColumns, ' ', sortOrder, ')');
    PREPARE _preparedStatement FROM @sqlCommand;
    EXECUTE _preparedStatement;
  END IF;
END $$
DELIMITER ;

-- Create the Indexes if they do not exist already.
CALL spCreateIndex('hrnx_error_stack', 'recent_errors', 'error_timedatestamp', 'DESC');
CALL spCreateIndex('hrnx_error_stack', 'txn', 'txn_id', 'ASC');

DELIMITER $$
-- Drop the temporary stored procedure.
DROP PROCEDURE IF EXISTS `spCreateIndex` $$
DELIMITER ;
