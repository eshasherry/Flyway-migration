DELIMITER //
CREATE PROCEDURE provision_peoplesofthcm_temp_252()
BEGIN
    UPDATE `trading_partners` SET `partner_type`='integration' WHERE `partner_id`='peoplesofthcm';
    UPDATE `trading_partners` SET `partner_type`='ats' WHERE `partner_id`='jobviteapigateway';
    UPDATE `integration_transform_settings` SET `source_tp_id`='jobviteapigateway', `action`='EMPLOYEE_UPSERT_DELETE'
    WHERE `xslt_id` = 'employee_import_peoplesoft_agent';
END//
DELIMITER ;

CALL provision_peoplesofthcm_temp_252();
DROP PROCEDURE provision_peoplesofthcm_temp_252;

