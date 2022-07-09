sudo apt list --installed | grep openssh-server
sudo apt install openssh-server
sudo apt list --installed | grep openssh-server
sudo service ssh status
sudo service ssh start
sudo service ssh restart
ssh [username]@[remoteserver IP or hostname]
ssh -p [port_number] [username]@[ip_address]
sudo netstat -ltnp | grep sshd
ssh -p [2244] [username]@[ip_address]
sudo ufw allow port /tcp
sudo ufw allow 2244/tcp
sudo ufw reload
sudo ufw status
sudo apt install arping
ping <ip-address>
