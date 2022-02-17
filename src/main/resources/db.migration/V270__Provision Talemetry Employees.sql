DELIMITER //
CREATE PROCEDURE provision_talemetry_employees_270()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
    INSERT INTO `service_definitions`
    (`service_tp_id`,`service_id`,`service_category_id`,`repeatable`,`vendor_service_id`,`created_date`,`created_tp_id`
    ,`created_tp_user_id`,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES
    ('ttc_api_gateway','employee_import','integration',0,'',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_texts`
    (`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`language`,`service_name`,`service_diz`
    ,`instructions_widget`,`instructions_candidate`,`created_date`,`created_tp_id`,`created_tp_user_id`
    ,`updated_date`,`updated_tp_id`,`updated_tp_user_id`)
VALUES
    ('ttc_api_gateway','employee_import','','','en','Employee Import Service', '','','',NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify');

INSERT INTO `service_mappings`
    (`package_id`,`service_tp_id`,`service_id`,`client_group_id`,`client_user_id`,`service_select`,`service_display`,`enabled`
    ,`service_group`,`service_order`,`created_date`,`created_tp_id`,`created_tp_user_id`,`updated_date`,`updated_tp_id`
    ,`updated_tp_user_id`,`result_validity_days`,`order_validity_days`,`max_retry_attempts`,`retry_interval_multiplier`)
VALUES
    ('ttc_api_gateway_api','ttc_api_gateway','employee_import','','',0,1,1,300,300,NOW(),'ttc_verify','ttc_verify',NOW(),'ttc_verify','ttc_verify',-1,-1,0,1);

INSERT INTO `xslt_versions`
 (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
VALUES
 ('csv_employee_transform_agent', 0,'Initial CSV Employee Transform by Agent',    'ttc_verify',NOW(),'/artifacts/csv_default_employee_export_upsert_agent.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');

INSERT INTO `integration_transform_settings`
 (`service_tp_id`,`client_group_id`,`client_user_id`,`source_tp_id`,`system_id`,`action`,`service_id`,`xslt_id`)
VALUES
 ('ttc_api_gateway','test_client_ttc','','ttc_agent','','UPSERT','employee_import','csv_employee_transform_agent');
END//
DELIMITER ;

CALL provision_talemetry_employees_270();
DROP PROCEDURE provision_talemetry_employees_270;