DELIMITER //
CREATE PROCEDURE provision_peoplesofthcm_temp_267()
BEGIN
    
    UPDATE `service_definitions` SET `service_id`='list_import' WHERE `service_tp_id`='jobviteapigateway' AND `service_id`='field_import';
	UPDATE `service_texts` SET `service_id`='list_import' , `service_name`= 'List Import' WHERE `service_tp_id`='jobviteapigateway' AND `service_id`='field_import';
	UPDATE `service_mappings` SET `service_id`='list_import' WHERE `service_tp_id`='jobviteapigateway' AND `service_id`='field_import';
	UPDATE `service_definitions` SET `service_id`='list_import' WHERE `service_tp_id`='peoplesofthcm' AND `service_id`='field_import';
	UPDATE `service_texts` SET `service_id`='list_import', `service_name`= 'List Import' WHERE `service_tp_id`='peoplesofthcm' AND `service_id`='field_import';
	UPDATE `service_mappings` SET `service_id`='list_import' WHERE `service_tp_id`='peoplesofthcm' AND `service_id`='field_import';

END//
DELIMITER ;

CALL provision_peoplesofthcm_temp_267();
DROP PROCEDURE provision_peoplesofthcm_temp_267;

