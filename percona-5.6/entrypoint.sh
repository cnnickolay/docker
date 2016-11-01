#!/bin/bash

shopt -s nullglob

function db_update 
{
  if [ ! -f '/initialized' ];then
    ps_tokudb_admin --enable
    mysql -uroot -e "DROP SCHEMA test; UPDATE mysql.user set password=password('root') WHERE user='root'; DELETE FROM mysql.user WHERE user=''; FLUSH PRIVILEGES;"
    mysql -uroot -p'root' < prepare-db.sql
    for SQL in /bootstrap/*.sql; do
      echo "Applying sql file $SQL"
      mysql -uroot -p'root' < "$SQL"
    done
    echo '' > /initialized
  fi
}

if [[ $# -eq 0 ]]; then
  mysqld_safe & &> /dev/null;sleep 3s
  db_update
  /usr/bin/mysqladmin -uroot -proot shutdown
  su - mysql -c "/usr/sbin/mysqld"
else 
  mysqld_safe & &> /dev/null;sleep 3s
  db_update
  exec "$@"
fi 
