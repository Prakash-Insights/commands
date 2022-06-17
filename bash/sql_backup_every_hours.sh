#!/bin/sh
# This script will help to create MySQL auto backup on every hour
# Database Details goes here
db_host="localhost"
db_name="DBBACKUP"
db_username="busr11"
db_password='qy$H711'
backup_location='/mnt/backup-bucket'
today=`date +%Y-%m-%d`
sql_file=$backup_location/$today/$db_name-`date "+%F-%H-%M-%S"`.sql
tar_file=$backup_location/$today/$db_name-`date "+%F-%H-%M-%S"`.tar.gz
if [ ! -d $backup_location/$today ]
then
mkdir -p $backup_location/$today
/usr/bin/mysqldump -h $db_host -u $db_username -p$db_password --all-databases > $sql_file
tar zcf $tar_file $sql_file
rm $sql_file
else
/usr/bin/mysqldump -h $db_host -u $db_username -p$db_password --all-databases > $sql_file
tar zcf $tar_file $sql_file
rm $sql_file
fi
