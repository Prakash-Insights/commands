#SWAP memory update:
#https://aws.amazon.com/premiumsupport/knowledge-center/ec2-memory-swap-file/

#In this example dd command, the swap file is 4 GB (128 MB x 64):
sudo dd if=/dev/zero of=/swapfile bs=128M count=256

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