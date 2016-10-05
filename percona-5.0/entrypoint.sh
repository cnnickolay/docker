#!/bin/bash

shopt -s nullglob

function db_update 
{
  for SQL in /bootstrap/*.sql; do
    echo "Applying sql file $SQL"
    mysql -uroot -p'root' < "$SQL"
  done
}

if [[ $# -eq 0 ]]; then
  /etc/init.d/mysql start
  db_update
  /etc/init.d/mysql stop
  mysqld_safe
else 
  /etc/init.d/mysql start
  db_update
  exec "$@"
fi 
