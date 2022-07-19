# NGINX setup
sudo service nginx restart 
sudo service nginx start 
sudo service nginx stop 

# Config File
sudo nano /etc/nginx/nginx.conf

# Logs
sudo nano access_log /var/log/nginx/access.log;
sudo nano error_log /var/log/nginx/error.log;

# NGINX Default file
sudo nano /etc/nginx/sites-available/default

# Angular / React
server {
        listen 80 default_server;
        # listen [::]:80 default_server;
        root /var/www/html/WR/WR-S123-FE/dist/fuse;
        index index.html index.htm index.nginx-debian.html;
        server_name DOMAIN_NAME.com;
        location / {
                try_files $uri $uri/ /index.html;
        }
}
# Node API / Next JS
server {
        listen 80;
        server_name DOMAIN_NAME.com;
        location / {
           #  client_max_body_size 5M;  
           proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
           proxy_set_header Host $host;
           proxy_pass http://127.0.0.1:3000;
           proxy_set_header Upgrade $http_upgrade;
           proxy_set_header Connection "upgrade";
           # location /overview {
           #     proxy_pass http://127.0.0.1:3000$request_uri;
           #     proxy_redirect off;
           # }
       }
}

