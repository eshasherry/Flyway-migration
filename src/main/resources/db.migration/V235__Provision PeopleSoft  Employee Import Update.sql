DELIMITER //
CREATE PROCEDURE provision_peoplesofthcm_temp_235()
BEGIN
	
     UPDATE `service_texts` set service_name='Employee Import' where service_name='Employee Import (PSFT to JV)';
    
 
END//
DELIMITER ;

CALL provision_peoplesofthcm_temp_235();
DROP PROCEDURE provision_peoplesofthcm_temp_235;