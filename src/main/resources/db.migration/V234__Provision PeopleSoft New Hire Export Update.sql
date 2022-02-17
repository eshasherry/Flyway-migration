DELIMITER //
CREATE PROCEDURE provision_peoplesofthcm_temp_234()
BEGIN
    
    UPDATE `service_texts` set service_name='New Hire Export' where service_name='New Hire Export (JV to PSFT)';
    

END//
DELIMITER ;

CALL provision_peoplesofthcm_temp_234();
DROP PROCEDURE provision_peoplesofthcm_temp_234;