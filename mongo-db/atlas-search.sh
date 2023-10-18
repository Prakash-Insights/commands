#https://www.mongodb.com/docs/atlas/cli/stable/install-atlas-cli/
sudo apt-get install gnupg
wget -qO - https://pgp.mongodb.com/server-6.0.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y mongodb-atlas
sudo apt-get install -y mongodb-atlas-cli
#Run the atlas command from any directory:
atlas --version
# https://www.mongodb.com/community/forums/t/atlas-search-local-development/606/3
# There currently isn’t an on-prem equivalent of Atlas Search, so the solutions are also unchanged: use an Atlas cluster
# (Atlas Search is now available on all clusters tiers running MongoDB 4.2 or later) or implement a fallback query for local testing.
