DELIMITER //
CREATE PROCEDURE provision_peoplesofthcm_temp_221()
BEGIN
	
    UPDATE `service_texts` set service_name='Category Import' where service_name='Category Import (PSFT to JV)';
    
END//
DELIMITER ;

CALL provision_peoplesofthcm_temp_221();
DROP PROCEDURE provision_peoplesofthcm_temp_221;