# Ubuntu Linux Server
# Create SWAP # See Swap file
netplan
ip link
ip a
# Static IP in linux server
cat /etc/netplan/00-installer-config.yaml
# network:
#   ethernets:
#     ens160:
#       dhcp4: no
#       addresses:
#         - 192.168.1.6/24
#       gateway4: 192.168.1.1
#       nameservers:
#         addresses: [192.168.1.1,8.8.8.8,8.8.4.4]
#   version: 2

# sudo netplan --debug apply
sudo netplan apply
# ssh already installed ubuntu linux server (click on openssh at install time)
# sudo nano /etc/ssh/sshd_config
sudo service ssh status
sudo service ssh restart

sudo apt update && sudo apt upgrade
# sudo nano /etc/apt/sources.list
# Try sudo ping 8.8.8.8 inside your distro (Ubuntu).
# If you can not reach network, search for network related issues in wsl.
# If network is reachable it's either dns problem or host being blocked by your network.
# To check dns try sudo ping archive.ubuntu.com.
