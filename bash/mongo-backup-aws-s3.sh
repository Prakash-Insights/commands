# TESTED OK
# Backup and upload into s3
today=`date +%Y-%m-%d`
db_name="ws_myb_$today"
now=$(date +"%T")
mkdir /root/db_backup/aws-s3
mongodump  --archive="/root/db_backup/aws-s3/$db_name" --host="localhost" --port=27017 --db DB_NM --username=USERNM --authenticationDatabase=admin --password=PASSWORD
aws configure set aws_access_key_id KEY && aws configure set aws_secret_access_key KEY && aws configure set eu-central-1
aws s3 cp /root/db_backup/aws-s3/$db_name s3://ws-db-backup/
rm -rf /root/db_backup/aws-s3
echo "$db_name/$now" >> /root/db_backup/backup.txt

# crontab -e
# 0 03 * * * /xyz.sh  # Daily 3 oclock

# Download from S3 and restore locally
aws s3 cp s3://backupnm/DOWNLOAD_ARCHIVE_DB .
mongorestore --nsInclude 'DOWNLOAD_DB_NM.*' --nsFrom='DOWNLOAD_DB_NM.*' --nsTo='NEW_DB_NM.*' --archive="DOWNLOAD_ARCHIVE_DB" localhost:27017