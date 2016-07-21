FROM centos:6

ADD prerequisites /percona
RUN cd /percona

# MySQL pre-requisites
# --------------------
RUN yum -y upgrade
RUN yum -y install epel-release
RUN yum repolist
RUN yum install -y /percona/Percona-Server-shared-compat-51-5.1.73-rel14.12.624.rhel6.x86_64.rpm
RUN yum install -y /percona/Percona-Server-shared-51-5.1.73-rel14.12.624.rhel6.x86_64.rpm
RUN yum install -y /percona/Percona-Server-client-51-5.1.73-rel14.12.624.rhel6.x86_64.rpm
RUN yum install -y /percona/Percona-Server-server-51-5.1.73-rel14.12.624.rhel6.x86_64.rpm

# MySQL Server
# ------------
# 
RUN mkdir -p /var/lib/mysql/dat && \
    mkdir -p /var/lib/mysql/binlog && \
    mkdir -p /var/lib/mysql/log && \
    mkdir -p /var/lib/mysql/innodb && \
    chown mysql:mysql /var/lib/mysql -R

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
