#!/bin/bash
#sudo chmod +x install.sh
lsb_release -a // check ubuntu version
sudo apt -y update && sudo apt -y upgrade
sudo apt install -y wget 
sudo apt install -y curl
#vs code
sudo wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg 
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/ 
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list' 
sudo apt install -y apt-transport-https 
sudo apt update 
sudo apt install -y code # or code-insiders  
#node js
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm list
nvm install lts/fermium
nvm use lts/fermium  # lts/gallium 
#curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
#curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
#sudo apt-get update
#sudo apt-get install nodejs
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
#mongo-compass
wget https://downloads.mongodb.com/compass/mongodb-compass_1.24.6_amd64.deb 
sudo dpkg -i mongodb-compass_1.24.6_amd64.deb
#git
sudo apt --fix-broken install
sudo apt install -y git
#skype
wget https://go.skype.com/skypeforlinux-64.deb 
sudo apt install -y ./skypeforlinux-64.deb
sudo apt-get update 
#notepad
sudo apt-get install -y notepadqq
sudo apt-get update 
sudo apt install -y wget 
#google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo add-apt-repository ppa:videolan/stable-daily 
sudo apt-get update 
sudo apt --fix-broken install
#postman
sudo snap install postman
#edge
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
sudo rm microsoft.gpg
sudo apt update
sudo apt install -y microsoft-edge-dev
#vlc
sudo apt-get install -y vlc
#favorite-apps ubuntu-desktop
gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'org.gnome.Nautilus.desktop', 'libreoffice-writer.desktop', 'google-chrome.desktop', 'code.desktop', 'mongodb-compass.desktop', 'notepadqq.desktop', 'skypeforlinux.desktop']"
echo "git version------- $(git --version)" 
echo "node version------- $(node -v)" 
echo "npm version------- $(npm -v)"
echo "ng version------- $(ng --version | grep 'Angular CLI' )"
echo "mongo version------- $(mongo --version | grep 'shell version' )"
echo "google-chrome version------- $(google-chrome --version)"
echo "code version------- $(code --version)"
echo "notepadqq version------- $(notepadqq --version)"
