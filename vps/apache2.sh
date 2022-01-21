# apache2 -------------
sudo apt update
sudo apt install apache2
sudo ufw app list
# Output
# Available applications:
#   Apache
#   Apache Full
#   Apache Secure
#   OpenSSH
# As indicated by the output, there are three profiles available for Apache:
# Apache: This profile opens only port 80 (normal, unencrypted web traffic)
# Apache Full: This profile opens both port 80 (normal, unencrypted web traffic) and port 443 (TLS/SSL encrypted traffic)
# Apache Secure: This profile opens only port 443 (TLS/SSL encrypted traffic)
sudo ufw allow 'Apache Full'
sudo ufw status
# The output will provide a list of allowed HTTP traffic:
# Output
# Status: active
# To                         Action      From
# --                         ------      ----
# OpenSSH                    ALLOW       Anywhere                  
# Apache                     ALLOW       Anywhere                
# OpenSSH (v6)               ALLOW       Anywhere (v6)             
# Apache (v6)                ALLOW       Anywhere (v6)

# Checking your Web Server
sudo systemctl status apache2
hostname -I
curl -4 icanhazip.com
http://your_server_ip

# Managing the Apache Process
sudo systemctl stop apache2
sudo systemctl start apache2
sudo systemctl restart apache2
sudo systemctl reload apache2
sudo systemctl disable apache2
sudo systemctl enable apache2

# Setting Up Virtual Hosts (Recommended)
sudo mkdir /var/www/your_domain
sudo chown -R $USER:$USER /var/www/your_domain
sudo chmod -R 755 /var/www/your_domain
sudo nano /var/www/your_domain/index.html
sudo nano /etc/apache2/sites-available/your_domain.conf
sudo apache2ctl configtest
# You should enable proxy. Run a command:
sudo a2enmod proxy
sudo /etc/init.d/apache2 restart
sudo systemctl restart apache2

# Enable headers module
sudo a2enmod headers
sudo a2dismod headers # Disable headers module
apache2ctl -M | grep headers  # Check if mod_headers is working
sudo a2enmod proxy
sudo a2enmod proxy_http
# Header add Access-Control-Allow-Origin "example.com";
sudo service apache2 restart
# LoadModule headers_module modules/mod_headers.so

# Content
# /var/www/html: The actual web content, which by default only consists of the default Apache page you saw earlier, is served out of the /var/www/html directory. This can be changed by altering Apache configuration files.

# Server Configuration
# /etc/apache2: The Apache configuration directory. All of the Apache configuration files reside here.
# /etc/apache2/apache2.conf: The main Apache configuration file. This can be modified to make changes to the Apache global configuration. This file is responsible for loading many of the other files in the configuration directory.
# /etc/apache2/ports.conf: This file specifies the ports that Apache will listen on. By default, Apache listens on port 80 and additionally listens on port 443 when a module providing SSL capabilities is enabled.
# /etc/apache2/sites-available/: The directory where per-site virtual hosts can be stored. Apache will not use the configuration files found in this directory unless they are linked to the sites-enabled directory. Typically, all server block configuration is done in this directory, and then enabled by linking to the other directory with the a2ensite command.
# /etc/apache2/sites-enabled/: The directory where enabled per-site virtual hosts are stored. Typically, these are created by linking to configuration files found in the sites-available directory with the a2ensite. Apache reads the configuration files and links found in this directory when it starts or reloads to compile a complete configuration.
# /etc/apache2/conf-available/, /etc/apache2/conf-enabled/: These directories have the same relationship as the sites-available and sites-enabled directories, but are used to store configuration fragments that do not belong in a virtual host. Files in the conf-available directory can be enabled with the a2enconf command and disabled with the a2disconf command.
# /etc/apache2/mods-available/, /etc/apache2/mods-enabled/: These directories contain the available and enabled modules, respectively. Files ending in .load contain fragments to load specific modules, while files ending in .conf contain the configuration for those modules. Modules can be enabled and disabled using the a2enmod and a2dismod command.

# Server Logs
# /var/log/apache2/access.log: By default, every request to your web server is recorded in this log file unless Apache is configured to do otherwise.
# /var/log/apache2/error.log: By default, all errors are recorded in this file. The LogLevel directive in the Apache configuration specifies how much detail the error logs will contain.

# apache2 -------------
