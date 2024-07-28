drop procedure if exists mysql_autoingest_admin.refresh_manager_remove;
DELIMITER //
CREATE PROCEDURE mysql_autoingest_admin.refresh_manager_remove(vdb_name char(15), vtable_name char(100))
BEGIN
        delete from mysql_autoingest_admin.refresh_manager where db_name=vdb_name and table_name=vtable_name;
END
//
delimiter ;
