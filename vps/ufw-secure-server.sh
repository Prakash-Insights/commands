# https://kb.worldstream.com/how-to-change-the-ssh-port/
# https://kb.worldstream.com/how-to-improve-your-ssh-security/

# Last day SSH logs
journalctl --since "today"
sudo lsof -i -P -n | grep LISTEN 

# SSH Secure
sudo nano /etc/ssh/sshd_config 
PermitRootLogin no # If root login OFF and key ON
PermitEmptyPasswords no
MaxAuthTries 3
AllowUsers [USER]
PasswordAuthentication no
X11Forwarding no
# What ports, IPs and protocols we listen for
Port 22  # 22/2022/2233

# Restart
sudo systemctl restart sshd.service 
sudo service ssh restart

# https://kb.worldstream.com/creating-an-openssh-keypair/
~/.ssh/authorized_keys
su username
cd /home/username
mkdir .ssh
chmod 700 .ssh
cd .ssh

# UFW ---------------------------------
#sudo ufw deny from IP_ADDRESS 
#sudo ufw deny from IP_ADDRESS to IP_ADDRESS
#sudo ufw delete allow from IP_ADDRESS
#sudo ufw deny out 25 #SMTP traffic
#sudo ufw disable

#firewall: https://www.cyberciti.biz/faq/how-to-configure-firewall-with-ufw-on-ubuntu-20-04-lts/
 
sudo ufw status
sudo nano /etc/default/ufw
sudo ufw default allow outgoing
sudo ufw default deny incoming
sudo ufw logging on
sudo ufw allow ssh
sudo ufw limit ssh
sudo ufw status
sudo systemctl status ufw.service
sudo ufw status verbose
sudo ufw status numbered
#sudo ufw delete 11
sudo ufw show raw 

sudo more /var/log/ufw.log
sudo tail -f /var/log/ufw.log
sudo ufw show listening
sudo ufw show added
sudo iptables -L | grep -i "log"
sudo iptables -S | grep ACCEPT

# PORT Attack IP list
grep 'DPT=22' /var/log/ufw.log | egrep -o 'SRC=([0-9]{1,3}[\.]){3}[0-9]{1,3}' | awk -F'=' '{ print $2 }' | sort -u

sudo ufw allow proto tcp from IP_ADDRESS port 22 &&
sudo ufw allow proto tcp from IP_ADDRESS port 27017 &&
sudo ufw allow proto tcp from IP_ADDRESS &&

sudo ufw app list
sudo ufw allow 'Nginx Full'
sudo ufw allow http
sudo ufw allow https
sudo ufw allow proto tcp from any to any port 80,443
#sudo ufw allow 'OpenSSH'
sudo ufw status
sudo nano /etc/ufw/user.rules
sudo nano /etc/ufw/before.rules
sudo ufw --dry-run enable
#After Confirm
sudo ufw enable
sudo systemctl restart nginx
sudo systemctl reload nginx
sudo systemctl status nginx
#sudo ufw deny from IP_ADDRESS
#sudo ufw disable

# Logs extra
grep -i ufw /var/log/syslog
grep -i ufw /var/log/messages
grep -i ufw /var/log/kern.log

# log status
sudo service rsyslog status
