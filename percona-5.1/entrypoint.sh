#!/bin/bash

#/etc/init.d/mysql start
mysqld_safe

exec "$@"
