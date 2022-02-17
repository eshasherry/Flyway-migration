DELIMITER //

CREATE PROCEDURE update_all_mappings_temp_105()
BEGIN
    DECLARE var_done TINYINT(4) DEFAULT 0;
	DECLARE var_count TINYINT(4) DEFAULT 0;
    DECLARE var_client_group_id VARCHAR(45);
    DECLARE var_package_id VARCHAR(45);
    DECLARE var_service_tp_id VARCHAR(45);
    DECLARE var_service_id VARCHAR(45);
    DECLARE var_service_select TINYINT(4) DEFAULT 0;
    DECLARE var_service_display TINYINT(4) DEFAULT 1;
    DECLARE var_service_group SMALLINT(6) DEFAULT 0;
    DECLARE var_service_order SMALLINT(6) DEFAULT 0;
    DECLARE var_enabled TINYINT(4) DEFAULT 1;
    DECLARE var_result_validity_days SMALLINT(6) DEFAULT -1;
    DECLARE var_order_validity_days SMALLINT(6) DEFAULT -1;
    DECLARE var_max_retry_attempts SMALLINT(6) DEFAULT 0;
    DECLARE var_retry_interval_multiplier SMALLINT(6) DEFAULT 1;
    
    DECLARE all_mappings CURSOR FOR
    SELECT
        `package_mappings`.`client_group_id`,
        `service_mappings`.`package_id`,
        `service_mappings`.`service_tp_id`,
        `service_mappings`.`service_id`,
        `service_mappings`.`service_select`,
        `service_mappings`.`service_display`,
        `service_mappings`.`service_group`,
        `service_mappings`.`service_order`,
        `service_mappings`.`enabled`,
        `service_mappings`.`result_validity_days`,
        `service_mappings`.`order_validity_days`,
        `service_mappings`.`max_retry_attempts`,
        `service_mappings`.`retry_interval_multiplier`
    FROM `package_mappings` INNER JOIN `service_mappings` ON `package_mappings`.`package_id` = `service_mappings`.`package_id`
    WHERE
        `package_mappings`.`client_user_id` = ''
    AND `service_mappings`.`client_user_id` = ''
    AND `service_mappings`.`client_group_id` = ''
    AND `service_mappings`.`service_id` NOT IN ('_core', '_core_vendor');
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_done = 1;

    OPEN all_mappings;
    update_mappings: LOOP
        FETCH all_mappings INTO var_client_group_id, var_package_id, var_service_tp_id, var_service_id, var_service_select, var_service_display, var_service_group, var_service_order, var_enabled, var_result_validity_days, var_order_validity_days, var_max_retry_attempts, var_retry_interval_multiplier;
        IF var_done = 1 THEN
            LEAVE update_mappings;
        END IF;
        
        SELECT
            COUNT(1) INTO var_count
        FROM
            `service_mappings`
        WHERE
            `service_mappings`.`package_id`      = var_package_id
        AND `service_mappings`.`service_tp_id`   = var_service_tp_id
        AND `service_mappings`.`service_id`      = var_service_id
        AND `service_mappings`.`client_group_id` = var_client_group_id
        AND `service_mappings`.`client_user_id`  = '';
        
        IF var_count = 0 THEN
            INSERT INTO `service_mappings` (
                `package_id`,
                `service_tp_id`,
                `service_id`,
                `client_group_id`,
                `client_user_id`,
                `service_select`,
                `service_display`,
                `service_group`,
                `service_order`,
                `enabled`,
                `result_validity_days`,
                `order_validity_days`,
                `max_retry_attempts`,
                `retry_interval_multiplier`,
                `created_date`,
                `created_tp_id`,
                `created_tp_user_id`,
                `updated_date`,
                `updated_tp_id`,
                `updated_tp_user_id`
            ) VALUES (
                var_package_id,
                var_service_tp_id,
                var_service_id,
                var_client_group_id,
                '',
                var_service_select,
                var_service_display,
                var_service_group,
                var_service_order,
                var_enabled,
                var_result_validity_days,
                var_order_validity_days,
                var_max_retry_attempts,
                var_retry_interval_multiplier,
                NOW(),
                'ttc_verify',
                'ttc_verify',
                NOW(),
                'ttc_verify',
                'ttc_verify'
            );
        END IF;
    END LOOP update_mappings;
    CLOSE all_mappings;
END//
DELIMITER ;

CALL update_all_mappings_temp_105();
DROP PROCEDURE update_all_mappings_temp_105;

