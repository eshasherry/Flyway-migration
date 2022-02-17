CREATE  TABLE `maintenance_schedules` (
  `id` INT NOT NULL ,
  `tp_id` VARCHAR(45) NOT NULL ,
  `client_group_id` VARCHAR(45) NOT NULL DEFAULT '' ,
  `client_user_id` VARCHAR(45) NOT NULL DEFAULT '' ,
  `start` TIMESTAMP NULL ,
  `end` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) );

ALTER TABLE `maintenance_schedules` 
	ADD INDEX `expiry` (`end` ASC) ;
ALTER TABLE `maintenance_schedules` CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT  ;
