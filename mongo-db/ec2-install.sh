wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
sudo apt-get install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list

sudo apt-get update
sudo apt-get install -y mongodb-org
sudo apt autoremove
pwd
echo "deb http://security.ubuntu.com/ubuntu impish-security main" | sudo tee /etc/apt/sources.list.d/impish-security.list
sudo apt-get update
sudo apt-get install libssl1.1
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl daemon-reload
sudo systemctl status mongod
sudo systemctl enable mongod

#--------

mongo >
db.createUser(
  {
    user: "addminn",
    pwd: "pwwd",
    roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
  }
)
mongo -u addminn -p --authenticationDatabase admin --host 127.0.0.1

#--------

mongo >
use admin // admin
show users // 
db.grantRolesToUser("addminn", [{role: "root", db: "admin"}]);
use NEW_DB   // New DB
db.test.insert({name: "test"})
use NEW_DB
db.createUser(
  {
    user: "1111",
    pwd: "pwwwd",
     roles: [ { role: "userAdmin", db: "NEW_DB" }, {role: "readWrite", db: "NEW_DB"} ]
  }
)
show users

#--------

sudo nano /etc/mongod.conf
# network interfaces
net:
  port: 27017
  bindIp: 127.0.0.1,17.3.1.3  #MONGO_PRIVATE_PC_IP
# how the process runs
processManagement:
  timeZoneInfo: /usr/share/zoneinfo
#security:
security:
  authorization: "enabled"

sudo systemctl restart mongod
sudo systemctl status mongod
