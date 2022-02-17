DELIMITER //
CREATE PROCEDURE provision_peoplesofthcm_temp_220()
BEGIN
	
    UPDATE `service_texts` set service_name='Location Import' where service_name='Location Import (PSFT to JV)';
    
END//
DELIMITER ;

CALL provision_peoplesofthcm_temp_220();
DROP PROCEDURE provision_peoplesofthcm_temp_220;