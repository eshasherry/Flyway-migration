DELIMITER //

CREATE PROCEDURE verify_temp_62()
BEGIN
	DECLARE cond INT DEFAULT 0;
		
	SELECT COUNT(*) INTO cond FROM `clients` WHERE `client_group_id`='test_client_pen';
	IF cond = 0 THEN
		INSERT INTO `clients` (
		   `client_group_id`
		  ,`clientname`
		  ,`createdDate`
		  ,`activatedDate`
		  ,`createdUser`
		  ,`createdTp`
		  ,`password`
		  ,`groupAuthAllowed`
		  ,`groupAuthAutoCreateUser`
		  ,`reviewCpSubmission`
		  ,`enabled`
		  ,`timezone`
		  ,`client_options`
		  ,`data_retention_days`
		) VALUES (
		   'test_client_pen'
		  ,'Pen Test Client'
		  ,now()
		  ,now()
		  ,'admin'
		  ,'HRNX AWACS'
		  ,'qPXc6DaHfoMdX1O2MoqnrovFYBkgZovlnOkTf3sPoGJCMkCHWHsFsk8n/lxt6WSV'
		  ,1
		  ,0
		  ,0
		  ,1
		  ,null
		  ,''
		  ,365);
	END IF;
	
	SELECT COUNT(*) INTO cond FROM `package_mappings` WHERE `client_group_id`='test_client_pen' AND `package_id`='ttc_verify_test_api';
	IF cond = 0 THEN
		INSERT INTO `package_mappings` (
		   `package_id`
		  ,`client_group_id`
		  ,`client_user_id`
		  ,`package_select`
		  ,`package_display`
		  ,`enabled`
		  ,`package_group`
		  ,`package_order`
		  ,`created_date`
		  ,`created_tp_id`
		  ,`created_tp_user_id`
		  ,`updated_date`
		  ,`updated_tp_id`
		  ,`updated_tp_user_id`
		) VALUES (
		   'ttc_verify_test_api'
		  ,'test_client_pen'
		  ,''
		  ,2
		  ,0
		  ,1
		  ,100
		  ,50
		  ,NOW()
		  ,'ttc_verify'
		  ,'ttc_verify'
		  ,NOW()
		  ,'ttc_verify'
		  ,'ttc_verify'
		);
	END IF;
END//

DELIMITER ;

CALL verify_temp_62();

DROP PROCEDURE verify_temp_62;
