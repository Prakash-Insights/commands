#https://www.tecmint.com/install-free-ssl-certificate-for-nginx-on-debian-10/
# sudo apt update
# sudo apt install python3-acme python3-certbot python3-mock python3-openssl python3-pkg-resources python3-pyparsing python3-zope.interface
# sudo apt install python3-certbot-nginx
 
# /etc/nginx/sites-available/default
# server_name tecmint.in www.tecmint.in;
# sudo nginx -t

# server_name tecmint.in www.tecmint.in;

# sudo certbot --nginx -d mbwarehouse.tecmint.in 
# sudo certbot --nginx -d mbmsb.tecmint.in 
# sudo certbot --nginx -d mbmsb-admin.tecmint.in 
# sudo certbot --nginx -d mbwr-api.tecmint.in
# sudo certbot --nginx -d mbmsb-api.tecmint.in

# TESTED on EC2
#https://www.nginx.com/blog/using-free-ssltls-certificates-from-lets-encrypt-with-nginx/
sudo apt-get update
sudo apt-get install certbot
sudo apt-get install python3-certbot-nginx
sudo nginx -t && nginx -s reload
sudo certbot --nginx -d abc.com
sudo certbot --nginx -d mbpanel.abc.com
sudo certbot --nginx -d rest.abc.com
cat /etc/nginx/sites-available/default
# Let’s Encrypt certificates expire after 90 days. 
# We encourage you to renew your certificates automatically. 
# Here we add a cron job to an existing crontab file to do this.
crontab -e
0 12 * * * /usr/bin/certbot renew --quiet


# Delete SSL
sudo certbot delete --cert-name DOMAIN-NAME

