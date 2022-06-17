#!/bin/bash
#TESTED
#file_exist='0'
filename='/root/zip-extract/upload.txt'
for file in $(ls /root/zip-extract/zip/*.zip)
do
file_exist=0
#echo "$file"
bsezip=$(basename $file);
echo "$bsezip"

while read p; do
bsecompare=$(basename $p)
echo $bsecompare
    if [ $bsezip = $bsecompare ]
    then
       file_exist=1
       echo "1"
       rm -rf $file
       break;
    else
       file_exist=0
    fi
done < "$filename"

echo $file_exist;
#exit;
if [ $file_exist -eq 0 ]
then

mkdir /root/zip-extract/unzip_dir
cd /root/zip-extract/
unzip ${file} -d "unzip_dir"

aws configure set aws_access_key_id KEY && aws configure set aws_secret_access_key KEY
for image in $(ls unzip_dir/*)
do
    #aws s3 ls s3://myimage/$(basename $image);
    #if [ $? -ne 0 ]; then
    # echo "File does not exist $image"
     aws s3 cp $image s3://myimage/$(basename $image)
    #fi
done
rm -rf $file
rm -rf /root/zip-extract/unzip_dir
echo "$file" >> /root/zip-extract/upload.txt
fi
done
