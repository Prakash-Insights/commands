#!/bin/bash
ftp -n covers.gars.com << EOF
quote USER ZIFTP
quote PASS 1w999nr7
cd /Books/Update/
lcd /mnt/scp-bucket/
get BkImages_wk.zip
EOF
