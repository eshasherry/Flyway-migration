DELIMITER //
CREATE PROCEDURE provision_peoplesofthcm_temp_219()
BEGIN
	
     UPDATE `service_texts` set service_name='Position Import' where service_name='Position Import (PSFT to JV)';
    
END//
DELIMITER ;

CALL provision_peoplesofthcm_temp_219();
DROP PROCEDURE provision_peoplesofthcm_temp_219;