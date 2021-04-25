#!/bin/bash
#sudo chmod +x vps.sh
sudo apt -y update && sudo apt -y upgrade
sudo apt install -y wget 
sudo apt install -y curl
#node js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source ~/.bashrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm list
nvm install lts/fermium
nvm use lts/fermium
# angular cli
npm install -g @angular/cli
#mongo
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
sudo apt-get install -y gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
sudo apt-get -y update 
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl daemon-reload
#sudo systemctl status mongod
sudo systemctl enable mongod
#git
sudo apt --fix-broken install
sudo apt install -y git
#nginx
sudo apt-get install nginx
sudo systemctl start nginx
sudo systemctl enable nginx
#sudo systemctl status nginx
sudo ufw app list
sudo ufw allow 'nginx http'
sudo ufw reload
sudo ufw allow 'nginx https'
curl -i 127.0.0.1
sudo nginx -t

echo "git version------- $(git --version)" 
echo "node version------- $(node -v)" 
echo "npm version------- $(npm -v)"
echo "ng version------- $(ng --version | grep 'Angular CLI' )"
echo "mongo version------- $(mongo --version | grep 'shell version' )"
echo "nginx version------- $(nginx -v)" 

