today=`date +%Y-%m-%d`
db_name="ws_myboeken_$today"
now=$(date +"%T")
mkdir /root/db_backup/aws-s3
mongodump  --archive="/root/db_backup/aws-s3/$db_name" --host="localhost" --port=27017 --db DB_NM --username=USERNM --authenticationDatabase=admin --password=PASSWORD
aws configure set aws_access_key_id KEY && aws configure set aws_secret_access_key KEY && aws configure set eu-central-1
aws s3 cp /root/db_backup/aws-s3/$db_name s3://ws-db-backup/
rm -rf /root/db_backup/aws-s3
echo "$db_name/$now" >> /root/db_backup/backup.txt

# crontab -e
# 0 03 * * * /xyz.sh  # Daily 3 oclock