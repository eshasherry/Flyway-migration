ALTER TABLE `awacs_users`
 CHANGE `username` `user_id` VARCHAR(45) NOT NULL;

ALTER TABLE `client_users`
 DROP `username`
,CHANGE `user_id` `client_user_id` VARCHAR(45) NOT NULL
,DROP PRIMARY KEY
,ADD PRIMARY KEY(`client_group_id`, `client_user_id`);

ALTER TABLE `packages`
 MODIFY `service_id` VARCHAR(45) NOT NULL;

ALTER TABLE `partner_custom_questions`
 CHANGE `partner_id` `service_tp_id` VARCHAR(45) NOT NULL
,CHANGE `client_id` `client_group_id` VARCHAR(45) DEFAULT NULL
,MODIFY `service_id` VARCHAR(45) DEFAULT NULL
,MODIFY `service_categoryid` VARCHAR(45) DEFAULT NULL;

ALTER TABLE `partner_service_mappings`
 CHANGE `partner_id` `service_tp_id` VARCHAR(45) NOT NULL
,MODIFY `service_id` VARCHAR(45) DEFAULT NULL;
