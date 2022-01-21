#!/bin/bash
# sudo chmod +x vps.sh
sudo apt -y update && sudo apt -y upgrade
sudo apt install -y wget 
sudo apt install -y curl
# node js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source ~/.bashrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm list
nvm install lts/fermium  # nvm install lts/gallium 
nvm use lts/fermium
# angular cli
npm install -g @angular/cli
# mongo
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
sudo apt-get install -y gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
sudo apt-get -y update 
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl daemon-reload
# sudo systemctl status mongod
sudo systemctl enable mongod
# git
sudo apt --fix-broken install
sudo apt install -y git
# nginx
sudo apt-get install nginx
sudo systemctl start nginx
sudo systemctl enable nginx
# apache2 -------------
sudo apt update
sudo apt install apache2
sudo ufw app list
# see apache2.sh file 

# sudo systemctl status nginx
sudo ufw app list
sudo ufw allow 'nginx http'
sudo ufw reload
sudo ufw allow 'nginx https'
curl -i 127.0.0.1
sudo nginx -t
# sudo mkdir -p /var/www/test_domain.com/html
# sudo chown -R $USER:$USER /var/www/test_domain.com
# sudo chmod -R 755 /var/www/test_domain.com
# sudo nano /etc/nginx/sites-available/test_domain.com
# server    {
# listen 80;
 
# root /var/www/test_domain.com/html;
# index index.html index.htm index.nginx.debian.html;
 
# server_name test_domain.com www.test_domain.com;
# location /          {
# try_files $uri $uri/ =404;
#       }
# }

# sudo ln –s /etc/nginx/sites-available/test_domain.com /etc/nginx/sites-enabled
# sudo systemctl restart nginx
# sudo nginx –t
# hostname -i

# sudo nano /etc/hosts
# 127.0.1.1 test_domain.com www.test_domain.com

# npm i -g pm2

# Checklist
# /var/www/html – Website content as seen by visitors.
# /etc/nginx – Location of the main Nginx application files.
# /etc/nginx/nginx.conf – The main Nginx configuration file.
# /etc/nginx/sites-available – List of all websites configured through Nginx.
# /etc/nginx/sites-enabled – List of websites actively being served by Nginx.
# /var/log/nginx/access.log – Access logs tracking every request to your server.
# /var/log/ngins/error.log – A log of any errors generated in Nginx.

echo "git version------- $(git --version)" 
echo "node version------- $(node -v)" 
echo "npm version------- $(npm -v)"
echo "ng version------- $(ng --version | grep 'Angular CLI' )"
echo "mongo version------- $(mongo --version | grep 'shell version' )"
echo "nginx version------- $(nginx -v)" 
# Port Forwading in Virtual Box - NAT network > Port forward > Host - 8080 > Guest 80 > It will show nginx in host machine

# mongodump --archive=db_oh_new  --uri=mongodb+srv://oh:oh@clustername.1cqxju.mongodb.net/db_oh
# mongorestore --archive="db_oh_new" mongodb+srv://oh:oh@clustername.12l8kp.mongodb.net/db_oh
# mongorestore --archive="db_oh_new" mongodb://127.0.0.1:27017/?readPreference=primary&ssl=false 
# mongorestore --archive="db_oh_new" mongodb://localhost:27017/?readPreference=primary&appname=MongoDB%20Compass&ssl=false  
# show dbs
# show databases
# use ohc
# db.dropDatabase()
# show tables
# show collections

# EC2 new password
sudo nano /etc/ssh/sshd_config
# PasswordAuthentication yes
sudo passwd ubuntu # provide new password

# github ssh key add in github.com 
ssh-keygen -t ed25519 -C "your_email@example.com"
# Note: If you are using a legacy system that doesn't support the Ed25519 algorithm, use:
# $ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
eval "$(ssh-agent -s)"   # Start the ssh-agent in the background.
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
# Then select and copy the contents of the id_ed25519.pub file
# displayed in the terminal to your clipboard
# Click New SSH key or Add SSH key in github-settings
ssh -T git@github.com # Attempts to ssh to GitHub
ssh -vT git@github.com  # Attempts to ssh to GitHub
ssh -T GITHUB-USERNAME@github.com # Permission denied (publickey).
git remote add origin https://github.com/user/repo.git
# chown -R ubuntu foldername
