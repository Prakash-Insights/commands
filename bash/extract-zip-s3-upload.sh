#!/bin/bash
for file in $(ls /media/u21-test/Elements/done/*.zip)
do
mkdir unzip_dir
unzip ${file} -d "unzip_dir"
aws configure set aws_access_key_id KEY && aws configure set aws_secret_access_key KEY
for image in $(ls unzip_dir/*)
do
    aws s3 ls s3://my-images/$(basename $image);
    if [ $? -ne 0 ]; then
     echo "File does not exist $image"
     aws s3 cp $image s3://my-images/$(basename $image)
    fi
done
rm -rf unzip_dir
done
