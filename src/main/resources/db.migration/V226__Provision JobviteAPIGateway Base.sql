DELIMITER //
CREATE PROCEDURE provision_jobviteapigateway_temp_226()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='tee';
    IF var_count = 1 THEN

		INSERT INTO `trading_partners` (`partner_id`, `partner_name`, `partner_type`, `password`, `logo_large`, `logo_sp`, `logo_small`, `enabled`) 
                 VALUES ('jobviteapigateway', 'Jobvite API Gateway', 'integration', 'Can9YfLjUrFX0b2Cj7uAsD/GvyeJCgqnj1IabodVpe0dl9EEMamipDrDHnDvnX/q', null, null, null, '1');


        INSERT INTO `service_definitions`
            (`service_tp_id`,`service_id`,`service_category_id`,`repeatable`,`vendor_service_id`,`created_date`,`created_tp_id`
            ,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
        VALUES
            ('jobviteapigateway','_core',       '_core',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
            ('jobviteapigateway','_core_vendor','_core',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');
        
        INSERT INTO `service_texts`
            (`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`language`,`service_name`,`service_diz`
            ,`instructions_widget`,`instructions_candidate`,`created_date`,`created_tp_id`,`created_tp_user_id`
            ,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
        VALUES
            ('jobviteapigateway','_core',       '','','en','Built-in',         '','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
            ('jobviteapigateway','_core_vendor','','','en','Built-in (Vendor)','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');
          
        INSERT INTO `package_definitions` 
            (`package_id`, `owning_service_tp_id`, `vendor_package_ids`, `created_date`, `created_tp_id`, 
			`created_tp_user_id`, `updated_date`, `updated_tp_id`, `updated_tp_user_id`) 
		VALUES 
            ('jobviteapigateway_api', 'ttc_verify', '{\"\":\"\"}', NOW(), 'ttc_verify', 'ttc_verify', NOW(), 'ttc_verify', 'ttc_verify');

        INSERT INTO `package_texts` 
             (`package_id`, `client_group_id`, `client_user_id`, `language`, `package_name`, `created_date`, 
            `created_tp_id`, `created_tp_user_id`, `updated_date`, `updated_tp_id`, `updated_tp_user_id`) 
        VALUES
             ('jobviteapigateway_api', '', '', 'en', 'API only', NOW(), 'ttc_verify', 'ttc_verify', NOW(), 'ttc_verify', 'ttc_verify');

	    INSERT INTO `service_mappings`
            (`package_id`,`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`service_select`,`service_display`,`enabled`
            ,`service_group`,`service_order`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`
            ,`updated_tp_user_id`,`result_validity_days`,`order_validity_days`,`max_retry_attempts`,`retry_interval_multiplier`)
        VALUES
            ('jobviteapigateway_api','jobviteapigateway','_core',       '','',2,1,1,0,0,NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify',-1,-1,0,1),
            ('jobviteapigateway_api','jobviteapigateway','_core_vendor','','',2,1,1,0,0,NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify',-1,-1,0,1);
        
    END IF;
END//
DELIMITER ;

CALL provision_jobviteapigateway_temp_226();
DROP PROCEDURE provision_jobviteapigateway_temp_226;