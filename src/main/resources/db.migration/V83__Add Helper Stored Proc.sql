DELIMITER $$ 
CREATE PROCEDURE VerifyEZClient( 
IN clientGroupId VARCHAR(45), 
IN clientName VARCHAR(255), 
IN passwordHash VARCHAR(255)) 
BEGIN 
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
   clientGroupId
  ,clientName
  ,now()
  ,now()
  ,'admin'
  ,'HRNX AWACS'
  ,passwordHash
  ,1
  ,0
  ,0
  ,1
  ,null
  ,''
  ,365);
END$$ 

CREATE PROCEDURE VerifyEZTP( 
IN partnerId VARCHAR(45), 
IN partnerName VARCHAR(255), 
IN partnerType VARCHAR(45), 
IN passwordHash VARCHAR(125)) 
BEGIN 
INSERT INTO `trading_partners` (
   `partner_id`
  ,`partner_name`
  ,`partner_type`
  ,`password`
  ,`enabled`
) VALUES (
   partnerId
  ,parterName
  ,partnerType
  ,passwordHash
  ,1
);

END$$ 

CREATE PROCEDURE VerifyEZPackage(
IN packageId VARCHAR(45),
IN packageName VARCHAR(255),
IN clientGroupId VARCHAR(45))
BEGIN
INSERT INTO `package_definitions` (
   `package_id`
  ,`owning_service_tp_id`
  ,`vendor_package_ids`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   packageId
  ,'ttc_verify'
  ,'{"":""}'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);
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
   packageId
  ,clientGroupId
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

INSERT INTO `package_texts` (
   `package_id`
  ,`client_group_id`
  ,`client_user_id`
  ,`language`
  ,`package_name`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   packageId
  ,''
  ,''
  ,'en'
  ,packageName
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);
END$$

CREATE PROCEDURE VerifyEZField(
IN fieldId VARCHAR(45),
IN fieldName VARCHAR(255),
IN tpId VARCHAR(45),
IN serviceId VARCHAR(45),
IN clientGroupId VARCHAR(45))
BEGIN
INSERT INTO `field_definitions`
(`field_id`,
`field_level`,
`field_type`,
`field_size`,
`regex_check`,
`vendor_field_id`,
`created_date`,
`created_tp_id`,
`created_tp_user_id`,
`updated_date`,
`updated_tp_id`,
`updated_tp_user_id`)
VALUES
(
fieldId,
4,
0,
0,
'',
'',
NOW(),
'ttc_verify',
'ttc_verify',
NOW(),
'ttc_verify',
'ttc_verify'
);

INSERT INTO `field_mappings` (
   `service_tp_id`
  ,`service_id`
  ,`field_id`
  ,`client_group_id`
  ,`client_user_id`
  ,`field_state`
  ,`field_display`
  ,`field_sensitivity`
  ,`field_cp_state`
  ,`field_cp_display`
  ,`field_cp_sensitivity`
  ,`enabled`
  ,`field_group`
  ,`field_order`
  ,`field_default`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   tpId
  ,serviceId
  ,fieldId
  ,clientGroupId
  ,''
  ,1
  ,0
  ,1
  ,1
  ,0
  ,1
  ,1
  ,400
  ,100
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);

INSERT INTO `field_texts` (
   `field_id`
  ,`client_group_id`
  ,`client_user_id`
  ,`language`
  ,`field_name`
  ,`field_tooltip`
  ,`field_comment`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   fieldId
  ,clientGroupId
  ,''
  ,'en'
  ,fieldName
  ,''
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);
END$$

CREATE PROCEDURE VerifyEZService(
IN tpId VARCHAR(45),
IN serviceId VARCHAR(45),
IN serviceCategoryId VARCHAR(45),
IN serviceName VARCHAR(255),
IN packageId VARCHAR(45),
IN clientGroupId VARCHAR(45))
BEGIN

INSERT INTO `service_definitions` (
   `service_tp_id`
  ,`service_id`
  ,`service_category_id`
  ,`repeatable`
  ,`vendor_service_id`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   tpId
  ,serviceId
  ,serviceCategoryId
  ,0
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);

INSERT INTO `service_texts` (
   `service_tp_id`
  ,`service_id`
  ,`client_group_id`
  ,`client_user_id`
  ,`language`
  ,`service_name`
  ,`service_diz`
  ,`instructions_widget`
  ,`instructions_candidate`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   tpId
  ,serviceId
  ,clientGroupId
  ,''
  ,'en'
  ,serviceName
  ,''
  ,''
  ,''
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);

INSERT INTO `service_mappings` (
   `package_id`
  ,`service_tp_id`
  ,`service_id`
  ,`client_group_id`
  ,`client_user_id`
  ,`service_select`
  ,`service_display`
  ,`enabled`
  ,`service_group`
  ,`service_order`
  ,`result_validity_days`
  ,`order_validity_days`
  ,`created_date`
  ,`created_tp_id`
  ,`created_tp_user_id`
  ,`updated_date`
  ,`updated_tp_id`
  ,`updated_tp_user_id`
) VALUES (
   packageId
  ,tpId
  ,serviceId
  ,clientGroupId
  ,''
  ,2
  ,0
  ,1
  ,100
  ,100
  ,-1
  ,-1
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
  ,NOW()
  ,'ttc_verify'
  ,'ttc_verify'
);
END$$

DELIMITER ; 