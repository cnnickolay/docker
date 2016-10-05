MySQL install
-------------
yum -y install epel-release
yum repolist
yum install -y --nogpgcheck /install-source/Percona-SQL-shared-compat-5.0.92-b23.85.rhel6.x86_64.rpm
yum install -y --nogpgcheck /install-source/Percona-SQL-shared-50-5.0.92-b23.85.rhel6.x86_64.rpm
yum install -y --nogpgcheck /install-source/Percona-SQL-client-50-5.0.92-b23.85.rhel6.x86_64.rpm
yum install -y --nogpgcheck /install-source/Percona-SQL-server-50-5.0.92-b23.85.rhel6.x86_64.rpm

{mysql starts automatically}


Set MySQL root account
----------------------
mysql -uroot
UPDATE mysql.user set password=password('squiffy') WHERE user='root';
DELETE FROM mysql.user WHERE user='';
FLUSH PRIVILEGES;
exit


replace MySQL my.cnf
------------------------------
/etc/init.d/mysql stop
{Copy new my.cnf into place}
/etc/init.d/mysql start
