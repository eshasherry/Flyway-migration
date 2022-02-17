INSERT INTO service_settings (service_tp_id,client_group_id,client_user_id,`key`,value,created_date,created_tp_id,created_tp_user_id,updated_date,updated_tp_id,updated_tp_user_id) VALUES
	 ('jobviteapigateway','exportfrompsandimportintojv','','jobvite_url','https://api.jviqa.com','2021-07-14 00:00:00','ttc_verify','ttc_verify','2021-07-14 00:00:00','ttc_verify','ttc_verify');

INSERT INTO clients (`client_group_id`, `clientname`, `createdDate`, `activatedDate`, `createdTp`, `password`, `groupAuthAllowed`, `groupAuthAutoCreateUser`, `reviewCpSubmission`, `enabled`, `data_retention_days`) VALUES
	 ('exportfrompsandimportintojv', 'exportfrompsandimportintojv', '2021-07-15 00:00:00', '2021-07-15 00:00:00', 'MUKMUK', 'testpassword', '1', '0', '0', '1', '180');
