# how-to-install-and-configure-elasticsearch-on-ubuntu-20-04
# URL : https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-elasticsearch-on-ubuntu-20-04#step-4-testing-elasticsearch


curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt update
sudo apt install elasticsearch

# Step 2 — Configuring Elasticsearch
sudo nano /etc/elasticsearch/elasticsearch.yml
# ---------------------------------- Network 
#
# Set the bind address to a specific IP (IPv4 or IPv6):
#
network.host: localhost
# you can specify its IP in place of localhost.

sudo systemctl start elasticsearch
sudo systemctl enable elasticsearch

# Step 3 — Securing Elasticsearch
sudo ufw allow from 198.51.100.0 to any port 9200
sudo ufw enable
sudo ufw status

# ---------------------------------- External Network 
# but external connections don’t work.
# So first add your IP address to the firewall
# sudo ufw allow from xxx.yyy.aaa.bbb to any port 9200
# then edit the elasticsearch.yml configuration file. Change network.host: localhost to network.host: 0.0.0.0
# If you restart the service with systemctl restart elasticsearch you’ll get an error.
# You need to add this at the bottom of the .yml file:
discovery.type: single-node
#then restart 
systemctl restart elasticsearch

# ---------------------------------- Security
# You can set a password for native and built-in users using these commands: 
bin/elasticsearch-reset-password -u user1
bin/elasticsearch-reset-password -u user1 -i <password>
POST /_security/user/user1/_password { "password" : "new-test-password" }

# Step 4 — Testing Elasticsearch
curl -X GET 'http://localhost:9200'
#Output
#{
#  "name" : "elasticsearch-ubuntu20-04",
#  "cluster_name" : "elasticsearch",
#  "cluster_uuid" : "qqhFHPigQ9e2lk-a7AvLNQ",
#  "version" : {
#    "number" : "7.6.2",
#    "build_flavor" : "default",
#    "build_type" : "deb",
#    "build_hash" : "ef48eb35cf30adf4db14086e8aabd07ef6fb113f",
#    "build_date" : "2020-03-26T06:34:37.794943Z",
#    "build_snapshot" : false,
#    "lucene_version" : "8.4.0",
#    "minimum_wire_compatibility_version" : "6.8.0",
#    "minimum_index_compatibility_version" : "6.0.0-beta1"
#  },
#  "tagline" : "You Know, for Search"
#}
#
