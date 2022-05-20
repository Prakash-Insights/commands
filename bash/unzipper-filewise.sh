#!/bin/bash
#TESTED
for file in $(ls /media/u21-test/Elements/done/*.zip)
do
# cd ..
 mkdir -p /media/u21-test/Elements/extract-zips/$(basename "$file") 
 unzip ${file} -d /media/u21-test/Elements/extract-zips/$(basename "$file") 
#pwd
#echo $(basename "$file")
#break;
done 
