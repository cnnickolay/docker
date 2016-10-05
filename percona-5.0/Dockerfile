FROM centos:6

ADD prerequisites /percona
RUN cd /percona

# MySQL pre-requisites
# --------------------
RUN yum -y upgrade
RUN yum -y install epel-release
RUN yum repolist
RUN yum install -y --nogpgcheck /percona/Percona-SQL-shared-compat-5.0.92-b23.85.rhel6.x86_64.rpm
RUN yum install -y --nogpgcheck /percona/Percona-SQL-shared-50-5.0.92-b23.85.rhel6.x86_64.rpm
RUN yum install -y --nogpgcheck /percona/Percona-SQL-client-50-5.0.92-b23.85.rhel6.x86_64.rpm

RUN mkdir -p /var/lib/mysql/binlog && \
    mkdir -p /var/lib/mysql/log && \
    mkdir -p /var/lib/mysql/innodb

RUN yum install -y --nogpgcheck /percona/Percona-SQL-server-50-5.0.92-b23.85.rhel6.x86_64.rpm
#RUN /etc/init.d/mysql stop 
RUN    chown mysql:mysql /var/lib/mysql -R

RUN mkdir /bootstrap

ADD my.cnf /etc/

ADD prepare-db.sql /

ADD init-database.sh /
RUN chmod +x init-database.sh
RUN /init-database.sh

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

VOLUME /var/lib/mysql/log

USER mysql
EXPOSE 3306 

ENTRYPOINT ["/entrypoint.sh"]
