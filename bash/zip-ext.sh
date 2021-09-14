[root@ip-192-2-1-1 .data]# cat zipext.sh 
#!/bin/bash

#date=$(date '+%Y-%m-%d')
date=$(date -d "24 hours ago" '+%Y-%m-%d')

if [[ -f "$date.txt" ]]
then
for zext in $(cat /root/.data/$date.txt); do
value=$(unzip -o -qq $zext -d "/mnt/mb-images-bucket/images/" &)
rm /root/.data/$date.txt
done
fi
