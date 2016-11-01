FROM centos:7

# MySQL pre-requisites
# --------------------
RUN yum -y upgrade
RUN yum -y install epel-release
RUN yum install -y https://www.percona.com/downloads/Percona-Server-5.6/Percona-Server-5.6.33-79.0/binary/redhat/7/x86_64/Percona-Server-shared-56-5.6.33-rel79.0.el7.x86_64.rpm
RUN yum install -y https://www.percona.com/downloads/Percona-Server-5.6/Percona-Server-5.6.33-79.0/binary/redhat/7/x86_64/Percona-Server-client-56-5.6.33-rel79.0.el7.x86_64.rpm
RUN yum install -y which

# MySQL Server
# ------------
# 
RUN mkdir -p /var/lib/mysql/binlog
RUN mkdir -p /var/lib/mysql/log
RUN mkdir -p /var/lib/mysql/innodb
RUN mkdir -p /var/lib/mysql/tokudb
RUN yum install -y https://www.percona.com/downloads/Percona-Server-5.6/Percona-Server-5.6.33-79.0/binary/redhat/7/x86_64/Percona-Server-server-56-5.6.33-rel79.0.el7.x86_64.rpm
RUN chown mysql:mysql /var/lib/mysql -R

# MySQL TokuDB
# ------------
RUN yum install -y https://www.percona.com/downloads/Percona-Server-5.6/Percona-Server-5.6.33-79.0/binary/redhat/7/x86_64/Percona-Server-tokudb-56-5.6.33-rel79.0.el7.x86_64.rpm

RUN mkdir /bootstrap

ADD my.cnf /etc/

ADD prepare-db.sql /

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

VOLUME /var/lib/mysql/log

#USER mysql
EXPOSE 3306 

ENTRYPOINT ["/entrypoint.sh"]
