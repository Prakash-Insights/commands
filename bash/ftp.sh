#!/bin/bash
ftp -n covers.com << EOF
quote USER ZIFTPaa
quote PASS 1w999nr7aa
cd /Books/Update/
lcd /mnt/scp-bucket/
get BkImages_wk.zip
EOF
