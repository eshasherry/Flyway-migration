DELIMITER //
CREATE PROCEDURE provision_talemetry_employees_csv__sync_271()
BEGIN
    DECLARE var_count TINYINT(4) DEFAULT 0;
    
UPDATE `integration_transform_settings` SET `action` = 'UPSERT' WHERE (`xslt_id` = 'csv_employee_transform_agent');
    
INSERT INTO `xslt_versions`
 (`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
VALUES
 ('csv_employee_as_candidate_transform_agent', 0,'Initial CSV Employee as Candidate Transform by Agent','ttc_verify',NOW(),'/artifacts/csv_default_employee_as_candidate_export_upsert_agent.xslt',0,'com.talemetry.verify.serviceprovider.talemetryapigateway');

INSERT INTO `integration_transform_settings`
 (`service_tp_id`,`client_group_id`,`client_user_id`,`source_tp_id`,`system_id`,`action`,`service_id`,`xslt_id`)
VALUES
 ('ttc_api_gateway','test_client_ttc','','ttc_agent','','ADD','employee_import','csv_employee_as_candidate_transform_agent');
END//
DELIMITER ;

CALL provision_talemetry_employees_csv__sync_271();
DROP PROCEDURE provision_talemetry_employees_csv__sync_271;