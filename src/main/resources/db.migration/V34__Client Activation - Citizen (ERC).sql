INSERT INTO `clients` (
   `client_group_id`
  ,`clientname`
  ,`createdDate`
  ,`activatedDate`
  ,`createdUser`
  ,`createdTp`
  ,`password`
  ,`groupAuthAllowed`
  ,`groupAuthLogUser`
  ,`groupAuthAutoCreateUser`
  ,`reviewCpSubmission`
  ,`enabled`
) VALUES (
   'citizens'
  ,'Citizens Bank'
  ,NOW()
  ,NOW()
  ,'admin'
  ,'HRNX AWACS'
  ,'rvjfqtB/O9X8nI5pjwUGWjR+ELw3K/FlwL3uJILdLfA4oLdb8zALCiKj3WI8YqnD'
  ,1
  ,1
  ,0
  ,0
  ,1
);

INSERT INTO `service_settings` (
   `tp_id`
  ,`client_group_id`
  ,`client_user_id`
  ,`key`
  ,`value`
  ,`enabled`
) VALUES (
   'erc_assessments'
  ,'citizens'
  ,NULL
  ,'apikey'
  ,'72292f712e633048334e343e2c'
  ,1
);

INSERT INTO `partner_service_mappings` (
   `client_group_id`
  ,`client_user_id`
  ,`service_tp_id`
  ,`date_created`
  ,`date_activated`
  ,`service_id`
  ,`enabled`
) VALUES (
   'citizens'
  ,NULL
  ,'erc_assessments'
  ,NOW()
  ,NOW()
  ,'citizens_teller'
  ,1
),(
   'citizens'
  ,NULL
  ,'erc_assessments'
  ,NOW()
  ,NOW()
  ,'citizens_banker'
  ,1
);
