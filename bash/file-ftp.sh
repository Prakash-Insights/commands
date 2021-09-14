[root@ip-192-2-1-1 .data]# cat ftpsearch.sh 
#!/bin/bash
#date=$(date -d "24 hours ago" '+%Y-%m-%d')
date=$(date '+%Y-%m-%d')
find /mnt/my_ftp_path/Books/Update/ -maxdepth 1 -newermt "$date" | sed 's|^./||' | grep -i zip > /root/.data/$date.txt

cp /root/.data/$date.txt /root/.data/zipdata/.
