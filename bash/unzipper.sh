#!/bin/bash
#TESTED
#481-600 601-1100 1101-1300 1301-1400 1401-2050 2797-2820 2051-3227 3228-3300  3301-3376 3377-3378

for file in $(ls /media/u21-test/Elements/nie-zip/1-480/*.zip)
do
 mkdir unzip_dir

 unzip ${file} -d "unzip_dir"
 mv ${file} /media/u21-test/Elements/done
 #mv -- unzip_dir/* /home/u21-test/s3-bucket/ #aws_test

 aws configure set aws_access_key_id KEY && aws configure set aws_secret_access_key KEY && aws configure set eu-central-1
 #aws s3 ls

 aws s3 cp ./unzip_dir s3://myb-images/ --recursive 
 rm -rf unzip_dir
 #break;
done

