DELIMITER //
CREATE PROCEDURE provision_peoplesofthcm_temp_216()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    SELECT COUNT(1) INTO var_count FROM `trading_partners` WHERE partner_id='tee';
    IF var_count = 1 THEN

		INSERT INTO `trading_partners` (`partner_id`, `partner_name`, `partner_type`, `password`, `logo_large`, `logo_sp`, `logo_small`, `enabled`) 
                 VALUES ('peoplesofthcm', 'PeopleSoft HCM', 'jvintegration', 'Can9YfLjUrFX0b2Cj7uAsD/GvyeJCgqnj1IabodVpe0dl9EEMamipDrDHnDvnX/q', null, null, null, '1');


        INSERT INTO `service_definitions`
            (`service_tp_id`,`service_id`,`service_category_id`,`repeatable`,`vendor_service_id`,`created_date`,`created_tp_id`
            ,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
        VALUES
            ('peoplesofthcm','_core',       '_core',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
            ('peoplesofthcm','_core_vendor','_core',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');
        
        INSERT INTO `service_texts`
            (`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`language`,`service_name`,`service_diz`
            ,`instructions_widget`,`instructions_candidate`,`created_date`,`created_tp_id`,`created_tp_user_id`
            ,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
        VALUES
            ('peoplesofthcm','_core',       '','','en','Built-in',         '','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify'),
            ('peoplesofthcm','_core_vendor','','','en','Built-in (Vendor)','','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');
          
        INSERT INTO `package_definitions` 
            (`package_id`, `owning_service_tp_id`, `vendor_package_ids`, `created_date`, `created_tp_id`, 
			`created_tp_user_id`, `updated_date`, `updated_tp_id`, `updated_tp_user_id`) 
		VALUES 
            ('peoplesofthcm_api', 'ttc_verify', '{\"\":\"\"}', NOW(), 'ttc_verify', 'ttc_verify', NOW(), 'ttc_verify', 'ttc_verify');

        INSERT INTO `package_texts` 
             (`package_id`, `client_group_id`, `client_user_id`, `language`, `package_name`, `created_date`, 
            `created_tp_id`, `created_tp_user_id`, `updated_date`, `updated_tp_id`, `updated_tp_user_id`) 
        VALUES
             ('peoplesofthcm_api', '', '', 'en', 'API only', NOW(), 'ttc_verify', 'ttc_verify', NOW(), 'ttc_verify', 'ttc_verify');

	    INSERT INTO `service_mappings`
            (`package_id`,`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`service_select`,`service_display`,`enabled`
            ,`service_group`,`service_order`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`
            ,`updated_tp_user_id`,`result_validity_days`,`order_validity_days`,`max_retry_attempts`,`retry_interval_multiplier`)
        VALUES
            ('peoplesofthcm_api','peoplesofthcm','_core',       '','',2,1,1,0,0,NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify',-1,-1,0,1),
            ('peoplesofthcm_api','peoplesofthcm','_core_vendor','','',2,1,1,0,0,NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify',-1,-1,0,1);
        
    END IF;
END//
DELIMITER ;

CALL provision_peoplesofthcm_temp_216();
DROP PROCEDURE provision_peoplesofthcm_temp_216;