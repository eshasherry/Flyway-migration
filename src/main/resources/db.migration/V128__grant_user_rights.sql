-- by default, all rights granted
UPDATE `awacs_users` SET `user_rights`='sys_admin,cust_admin,partner_admin' WHERE user_id = 'admin';
UPDATE `awacs_users` SET `user_rights`='cust_admin' WHERE user_id != 'admin';

-- custSuma1
INSERT INTO `awacs_users`
(`user_id`,
`password`,
`user_rights`,
`enabled`)
VALUES
('custadmin',
'bWxmZEb6kvNM3uWw3GVDdONnUEgXElLm8ek9rRhp31QMemZpX4XNRcXB4hY8pn88',
'cust_admin',
1);
