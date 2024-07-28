drop procedure if exists mysql_autoingest_admin.refresh_manager_list;
DELIMITER //
CREATE PROCEDURE mysql_autoingest_admin.refresh_manager_list()
BEGIN
	select * from mysql_autoingest_admin.refresh_manager;
END
//
delimiter ;
