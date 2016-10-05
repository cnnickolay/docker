#!/bin/bash 

/etc/init.d/mysql start
sleep 2s
mysql -uroot -e "DROP SCHEMA test; UPDATE mysql.user set password=password('root') WHERE user='root'; DELETE FROM mysql.user WHERE user=''; FLUSH PRIVILEGES;"
mysql -uroot -p'root' < prepare-db.sql
/etc/init.d/mysql stop
