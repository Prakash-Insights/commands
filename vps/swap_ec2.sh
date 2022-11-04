#SWAP memory update:
#https://aws.amazon.com/premiumsupport/knowledge-center/ec2-memory-swap-file/

#In this example dd command, the swap file is 8 GB (128 MB x 64):
# 4 GB=bs 128 x count 32
# 8 GB=bs 128 x count 64
# 16 GB=bs 128 x count 128
# 32 GB=bs 128 x count 256
sudo dd if=/dev/zero of=/swapfile bs=128M count=64

#Update the read and write permissions for the swap file:
sudo chmod 600 /swapfile

#Set up a Linux swap area:
sudo mkswap /swapfile

#Make the swap file available for immediate use by adding the swap file to swap space:
sudo swapon /swapfile

#Verify that the procedure was successful:
sudo swapon -s

#Open the file in the editor:
sudo nano /etc/fstab

#Add the following new line at the end of the file, save the file, and then exit:
/swapfile swap swap defaults 0 0





# TESTED on LAP DELL Server Ubuntu 22.04
sudo swapon --show
free -h
df -h
sudo fallocate -l 1G /swapfile1  #1G 2G
ls -lh /swapfile1
sudo chmod 600 /swapfile1
ls -lh /swapfile1
sudo mkswap /swapfile1
sudo swapon /swapfile1
sudo swapon --show
free -h
# Make Swap file permanent
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile1 none swap sw 0 0' | sudo tee -a /etc/fstab
# Tune Swap space settings
cat /proc/sys/vm/swappiness # 60 to 20
sudo sysctl vm.swappiness=20
cat /proc/sys/vm/vfs_cache_pressure  # 100 to 40
sudo nano /etc/sysctl.conf  # add vm.vfs_cache_pressure=40 vm.swappiness=20
# TESTED on LAP DELL Server