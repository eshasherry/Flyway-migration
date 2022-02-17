CREATE TABLE `integration_transform_settings` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `service_tp_id` VARCHAR(45) NOT NULL ,
  `client_group_id` VARCHAR(45) NULL ,
  `client_user_id` VARCHAR(45) NULL ,
  `source_tp_id` VARCHAR(45) NOT NULL ,
  `system_id` VARCHAR(45) NULL ,
  `action` VARCHAR(45) NULL ,
  `service_id` VARCHAR(45) NULL ,
  `xslt_id` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) );

CREATE TABLE `xslt_versions` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `xslt_id` VARCHAR(45) NOT NULL ,
  `version` INT UNSIGNED NOT NULL ,
  `description` VARCHAR(255) NOT NULL ,
  `last_modified_by` VARCHAR(45) NOT NULL ,
  `last_modified_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `xslt_path` VARCHAR(45) NOT NULL ,
  `xslt_location` TINYINT UNSIGNED NOT NULL ,
  `originating_bundle` VARCHAR(100) NULL,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `xslt_version_uniq` (`xslt_id` ASC, `version` ASC) ,
  INDEX `retrieval` (`xslt_id` ASC) );

delete from service_settings where service_tp_id='ttc_api_gateway';

INSERT INTO `xslt_versions`
(`xslt_id`,`version`,`description`,`last_modified_by`,`last_modified_time`,`xslt_path`,`xslt_location`,`originating_bundle`)
VALUES
('candidates_add_ebs',0,'Initial EBS Transform for Candidate Add','ttc_verify',CURRENT_TIMESTAMP,'/artifacts/ebs_default_candidate_add.xslt',0, 'com.talemetry.verify.serviceprovider.talemetryapigateway'),
('candidates_add_tee',0,'Initial TEE Transform for Candidate Add','ttc_verify',CURRENT_TIMESTAMP,'/artifacts/tee_default_candidate_add.xslt',0, 'com.talemetry.verify.serviceprovider.talemetryapigateway'),
('candidates_del_ebs',0,'Initial EBS Transform for Candidate Delete','ttc_verify',CURRENT_TIMESTAMP,'/artifacts/ebs_default_candidate_delete.xslt',0, 'com.talemetry.verify.serviceprovider.talemetryapigateway'),
('candidates_del_tee',0,'Initial TEE Transform for Candidate Delete','ttc_verify',CURRENT_TIMESTAMP,'/artifacts/tee_default_candidate_delete.xslt',0, 'com.talemetry.verify.serviceprovider.talemetryapigateway'),
('jobs_add_ebs',0,'Initial EBS Transform for Job Add','ttc_verify',CURRENT_TIMESTAMP,'/artifacts/ebs_default_jobadd.xslt',0, 'com.talemetry.verify.serviceprovider.talemetryapigateway'),
('jobs_add_tee',0,'Initial TEE Transform for Job Add','ttc_verify',CURRENT_TIMESTAMP,'/artifacts/tee_default_jobadd.xslt',0, 'com.talemetry.verify.serviceprovider.talemetryapigateway'),
('jobs_del_ebs',0,'Initial EBS Transform for Job Delete','ttc_verify',CURRENT_TIMESTAMP,'/artifacts/ebs_default_jobdelete.xslt',0, 'com.talemetry.verify.serviceprovider.talemetryapigateway'),
('jobs_del_tee',0,'Initial TEE Transform for Job Delete','ttc_verify',CURRENT_TIMESTAMP,'/artifacts/tee_defaultjobdelete.xslt',0, 'com.talemetry.verify.serviceprovider.talemetryapigateway');
 
INSERT INTO `integration_transform_settings`
(`service_tp_id`, `client_group_id`, `client_user_id`, `source_tp_id`, `system_id`, `action`, `service_id`, `xslt_id`)
VALUES
('ttc_api_gateway', 'test_client_qa', '', 'ttc_integrator', 'SYS_EBS', 'ADD', 'transform_candidates','candidates_add_ebs'),
('ttc_api_gateway', 'test_client_qa', '', 'ttc_integrator', 'SYS_TEE', 'ADD', 'transform_candidates','candidates_add_tee'),
('ttc_api_gateway', 'test_client_qa', '', 'ttc_integrator', 'SYS_EBS', 'DEL', 'transform_candidates','candidates_del_ebs'),
('ttc_api_gateway', 'test_client_qa', '', 'ttc_integrator', 'SYS_TEE', 'DEL', 'transform_candidates','candidates_del_tee'),
('ttc_api_gateway', 'test_client_qa', '', 'ttc_integrator', 'SYS_EBS', 'DEL', 'transform_jobs','jobs_del_ebs'),
('ttc_api_gateway', 'test_client_qa', '', 'ttc_integrator', 'SYS_TEE', 'DEL', 'transform_jobs','jobs_del_tee'),
('ttc_api_gateway', 'test_client_qa', '', 'ttc_integrator', 'SYS_EBS', 'ADD', 'transform_jobs','jobs_add_ebs'),
('ttc_api_gateway', 'test_client_qa', '', 'ttc_integrator', 'SYS_TEE', 'ADD', 'transform_jobs','jobs_add_tee'),
('ttc_api_gateway', 'test_client_ttc', '', 'ttc_integrator', 'SYS_EBS', 'ADD', 'transform_candidates','candidates_add_ebs'),
('ttc_api_gateway', 'test_client_ttc', '', 'ttc_integrator', 'SYS_TEE', 'ADD', 'transform_candidates','candidates_add_tee'),
('ttc_api_gateway', 'test_client_ttc', '', 'ttc_integrator', 'SYS_EBS', 'DEL', 'transform_candidates','candidates_del_ebs'),
('ttc_api_gateway', 'test_client_ttc', '', 'ttc_integrator', 'SYS_TEE', 'DEL', 'transform_candidates','candidates_del_tee'),
('ttc_api_gateway', 'test_client_qa_ebs', '', 'ttc_integrator', 'SYS_EBS', 'ADD', 'transform_candidates','candidates_add_ebs'),
('ttc_api_gateway', 'test_client_qa_ebs', '', 'ttc_integrator', 'SYS_TEE', 'ADD', 'transform_candidates','candidates_add_tee'),
('ttc_api_gateway', 'test_client_qa_ebs', '', 'ttc_integrator', 'SYS_EBS', 'DEL', 'transform_candidates','candidates_del_ebs'),
('ttc_api_gateway', 'test_client_qa_ebs', '', 'ttc_integrator', 'SYS_TEE', 'DEL', 'transform_candidates','candidates_del_tee'),
('ttc_api_gateway', 'test_client_qa_ebs', '', 'ttc_integrator', 'SYS_EBS', 'DEL', 'transform_jobs','jobs_del_ebs'),
('ttc_api_gateway', 'test_client_qa_ebs', '', 'ttc_integrator', 'SYS_TEE', 'DEL', 'transform_jobs','jobs_del_tee'),
('ttc_api_gateway', 'test_client_qa_ebs', '', 'ttc_integrator', 'SYS_EBS', 'ADD', 'transform_jobs','jobs_add_ebs'),
('ttc_api_gateway', 'test_client_qa_ebs', '', 'ttc_integrator', 'SYS_TEE', 'ADD', 'transform_jobs','jobs_add_tee');
