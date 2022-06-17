#!/bin/bash
# TESTED
echo "$(date)" >> /root/zip-extract/extracted.txt
FOLDER=/root/zip-extract/zip/
cd $FOLDER
expect << 'EOS'
spawn sftp Myb2202@IPorHOST:/1643888740_IMAGES/
set timeout 300
expect "Password:"
send "PASSWORD\n"
expect "sftp>"
send "pwd\n"
expect "sftp>"
send "lpwd\n"
expect "sftp>"
send "mget * \r"
expect "sftp>"
send "bye\r"
EOS
echo "$(date)" >> /root/zip-extract/extracted.txt
# TESTED



#export HOST="localhost"
#export USER="myuname"
#export PASS="mypassword"
#script=<<'END_OF_SCRIPT'
#    set timeout 120
#    sftp my2022@eumft.com:/1643888740_IMAGES/
#    expect "Password:"
#    send "PASSWORD+\n"
#    expect "sftp>"
#    send "ls\r"
#    expect -re "$env(USER).*"
#    send "bye /r"
#    expect eof
#END_OF_SCRIPT
#VAR=$(expect -c "$script")
#echo "==============="
#echo "$VAR"

##  !/bin/bash
#  !/usr/bin/expect

#send "ls -ahl >> test.txt  \n"
# 'ls -1' will show filenames line by line
#send "ls -1\r"

# ignore echo of command from sftp
#expect -re {ls -1\r?\n}

# init empty list for filename collecting
#set files {}
#expect -re {([^\r\n]+)\r?\n} {
#    # catch each filename line by line and put it to list 'files'
#    lappend files $expect_out(1,string)
#    # run current 'expect' again to catch next filename
#    exp_continue
#}
#expect "sftp>"
#send "!cat 'ls -1' testt.txt\n"
# -ex $sftp_prompt {
#    # catch sftp prompt to break
#}
#foreach f $files {
#    puts $f
#       get $f
#cat $f >> test.txt
#}


#send "!sed -i '' '/ls -ahl/' ./RemoteFileList.txt\n"
#send "find -mtime +7 -ls -ahl \n"
#send "dir  *.* > dirlist.txt\n"
#send "ls\n"
#expect "sftp>"
#send "get *"
#send "get 393122_2022_20220525_00000.500.img.zip\n"
#rm -rf $FOLDER
# loop over example :)

#PASSWORD="PASSWORD+"
#sftp my2022@eumft.com << EOF
#$PASSWORD
#EOF




#HOST = "eumft.com"
#USER = "my2022"
#PASSWORD = "PASSWORD+"

#SOURCE = 1643888740_IMAGES
#ALL_FILES = "${@:2}"

#ftp -inv $HOST <<EOF
#user $USER $PASSWORD
#cd $SOURCE
#mget $ALL_FILES
#bye
#EOF


#sftp -n "My2202"@ eumft.com <<EOF
#quote USER "my2022"
#"PASSWORD+"
#cd /1643888740_IMAGES
#lcd /mnt/scp-bucket/
#get BkImages_wk.zip
#EOF

# SFTP TO remote server
#USER="ITO"
#PASSWORD="abcd@1234"
#HOST="12.18.1.20"

#sftp $USER@$HOST << EOF
#$PASSWORD
#cd LOG
#put *.tar.gz*
#quit
#EOF
