DELIMITER //
CREATE PROCEDURE provision_peoplesofthcm_temp_222()
BEGIN
	
    UPDATE `service_texts` set service_name='Department Import' where service_name='Department Import (PSFT to JV)';
   
END//
DELIMITER ;

CALL provision_peoplesofthcm_temp_222();
DROP PROCEDURE provision_peoplesofthcm_temp_222;