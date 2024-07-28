drop procedure if exists mysql_autoingest_admin.refresh_manager_add;
DELIMITER //
CREATE PROCEDURE mysql_autoingest_admin.refresh_manager_add(db_name char(15), table_name char(100))
BEGIN
	insert into mysql_autoingest_admin.refresh_manager values (db_name, table_name);
END
//
delimiter ;
