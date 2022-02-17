DELIMITER //
CREATE PROCEDURE provision_jobviteapigateway_temp_233()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='peoplesofthcm';
    IF var_count = 1 THEN
		INSERT INTO `service_definitions` (`service_tp_id`, `service_id`, `service_category_id`, `repeatable`, `created_date`, `created_tp_id`, `created_tp_user_id`,        `updated_date`, `updated_tp_id`, `updated_tp_user_id`) 
        VALUES ('jobviteapigateway', 'field_import', 'integration', '0', NOW(), 'ttc_verify', 'ttc_verify', NOW(), 'ttc_verify', 'ttc_verify');

        INSERT INTO `service_texts` (`service_tp_id`, `service_id`, `client_group_id`, `client_user_id`, `language`, `service_name`, `service_diz`, `instructions_widget`        , `instructions_candidate`, `created_date`, `created_tp_id`, `created_tp_user_id`, `updated_date`, `updated_tp_id`, `updated_tp_user_id`) 
        VALUES ('jobviteapigateway', 'field_import', '', '', 'en', 'Field Import', '', '', '', NOW(), 'ttc_verify', 'ttc_verify', NOW(), 'ttc_verify', 'ttc_verify');
             
	    INSERT INTO `service_mappings`
            (`package_id`,`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`service_select`,`service_display`,`enabled`
            ,`service_group`,`service_order`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`
            ,`updated_tp_user_id`,`result_validity_days`,`order_validity_days`,`max_retry_attempts`,`retry_interval_multiplier`)
	    VALUES
            ('jobviteapigateway_api','jobviteapigateway','field_import','','',0,1,1,0,0,now(),'ttc_verify','ttc_verify',now(),'ttc_verify','ttc_verify',-1,-1,0,1);
    END IF;
END//
DELIMITER ;

CALL provision_jobviteapigateway_temp_233();
DROP PROCEDURE provision_jobviteapigateway_temp_233;