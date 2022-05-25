#https://www.tecmint.com/install-free-ssl-certificate-for-nginx-on-debian-10/
sudo apt update
sudo apt install python3-acme python3-certbot python3-mock python3-openssl python3-pkg-resources python3-pyparsing python3-zope.interface
sudo apt install python3-certbot-nginx
 
/etc/nginx/sites-available/default
server_name tecmint.in www.tecmint.in;
sudo nginx -t

server_name tecmint.in www.tecmint.in;

sudo certbot --nginx -d mbwarehouse.tecmint.in 
sudo certbot --nginx -d mbmsb.tecmint.in 
sudo certbot --nginx -d mbmsb-admin.tecmint.in 
sudo certbot --nginx -d mbwr-api.tecmint.in
sudo certbot --nginx -d mbmsb-api.tecmint.in