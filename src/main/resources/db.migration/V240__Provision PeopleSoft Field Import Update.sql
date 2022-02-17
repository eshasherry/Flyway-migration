DELIMITER //
CREATE PROCEDURE provision_peoplesofthcm_temp_223()
BEGIN
	
     UPDATE `service_texts` set service_name='Field Import' where service_name='Field Import (PSFT to JV)';
   
END//
DELIMITER ;

CALL provision_peoplesofthcm_temp_223();
DROP PROCEDURE provision_peoplesofthcm_temp_223;