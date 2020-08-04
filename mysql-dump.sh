#!/bin/bash

LOGFILE=/var/log/mysqldump.log

# Database credentials
user="mysql_user"
password="mysql_user_password"
host="localhost"
db_name="mysql_database_name"

# Other options
backup_path="/home/sql-backups/"
# date=$(date +"&Y-%b-%d")
date=$(date +%F)

# Set default file permissions
umask 177

"$(date "+%Y%m%d %T") : Starting backup database $backup_path/$db_name\_$date.sql.gz" >> $LOGFILE 2>&1
# Dump database into SQL file
/usr/bin/mysqldump --user=$user --password=$password --host=$host $db_name | gzip > $backup_path/$db_name\_$date.sql.gz

"$(date "+%Y%m%d %T") : Complated backup database..." >> $LOGFILE 2>&1

"$(date "+%Y%m%d %T") : Delete files older than 30 days" >> $LOGFILE 2>&1
# Delete files older than 30 days
find $backup_path/* -mtime +30 -exec rm {} \;

"$(date "+%Y%m%d %T") : All complated mysql_dump.sh done." >> $LOGFILE 2>&1
