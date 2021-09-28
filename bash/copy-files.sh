[root@ip-100-200-100-200 script]# cat copyscript9.sh 
#!/bin/bash

for ath in $(cat /root/script/list9); do
value1=$(cp -n -v /mnt/mb-img-bucket/FULL/$ath/* /mnt/mb-iamg-bucket/images/.)
echo Status:,$ath:,$value1 >> /root/script/over9

done
