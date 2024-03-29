# Debian 
systemctl list-unit-files  # list all services

#---------  PORT Listen
sudo lsof -i -P -n | grep LISTEN 
sudo netstat -tulpn | grep LISTEN 
sudo lsof -i:22 ## see a specific port such as 22 ## 
sudo nmap -sTU -O IP-address-Here 

# List all services 
less /etc/services
sudo ss -tulwn | grep LISTEN
sudo ss -tulwn
sudo ss -tulw
systemctl --type=service --state=running

#--------- 
find . -type f -mtime 90  # last modified file in entire system (90days)
find . -type f -mtime -5 # last modified file in entire system (up to 5 days)
find . -type f -mtime +5 # last modified file in entire system (5 days plus)

find . -name "node_modules" -exec rm -rf '{}' +  # remove all node_modules from folders
rm -r dir-name # remove directory
ps -elf | grep -i *sh # all process with sh file
ps -elf | grep -i unzip # all process with unzip file
du -a /root/ | sort -n -r | head -n 20 # Last 20 high space
find . -type f -mtime 90 | head -n 20  # 20 modified file in entire system
du -hs * | sort -rh | head -5 # The largest files in KB, MB, or GB.
#To display the largest folders/files including the sub-directories, run:
du -Sh | sort -rh | head -5
# If you want to display the biggest file sizes only, then run the following command:
find -type f -exec du -Sh {} + | sort -rh | head -n 5
# find the largest files in a particular location, just include the path beside the find command:
find /home/ -type f -exec du -Sh {} + | sort -rh | head -n 5
find /home/ -type f -printf "%s %p\n" | sort -rn | head -n 20
ps -ax | grep firefox # process with firefox app
kill process-id   # kill process by id

---------

# Print file and show number of lines
cat filename
wc -l filename


## shell alias ##  Linux find large files quickly with bash alias
alias ducks='du -cks * | sort -rn | head'
### run it ###
ducks
# Finding largest file recursively on Linux bash shell using find
sudo find / -type f -printf "%s\t%p\n" | sort -n | tail -1
find $HOME -type f -printf '%s %p\n' | sort -nr | head -10
find -type f -exec du -Sh {} + | sort -rh | head -n 5

#-------------partition------ 
sudo parted --list
sudo parted -l 
sudo fdisk -l | grep NTFS 
cd / 
sudo mkdir /mnt/ntfs1 
sudo mount -t ntfs /dev/sdb5 /mnt/ntfs1 
df -hT # HDD size/ space/ drive space
du -h  # Folder size and space
lsblk  # hdd space and path
du -sh * # All folder highest size and space

sudo apt update 
sudo apt install fuse ntfs-3g 
sudo mkdir /mnt/ntfs2 
sudo mount /dev/sda5 -t ntfs-3g -o permissions /mnt/ntfs2 
sudo blkid 
#-------------partition------ 

# See last restart/reboot log
last reboot | less

# See last mysql service log
sudo less /var/log/mysql/error.log

# CPU Usage and monitoring
sar -P ALL 1 3  #Core CPU usage
sar -u 1 3
top -1
ps -ef
ps -eo uid,pid,tid,class,rtprio,ni,pri,psr,pcpu,comm
mpstat -P ALL 3
cat /proc/cpuinfo  # CPU information
lscpu -p
ps -p 23997 -o %cpu,%mem,cmd  # CPU Usage
ps -p 1716 -o %cpu,%mem,cmd # CPU Usage

# See Cache and Size
getconf -a | grep CACHE
lscpu | grep "cache"

# RAM usage and monitoring
sudo free -h 
htop   # high memory test
vmstat  # RAM memory status

# Inbound connection in linux server with PORT and IP address
netstat -ant | grep :27017 | awk '{print $6}' | sort | uniq -c | sort -n
ss -tn src :27017 | grep -i "estab" | wc -l
ss -tn src :27017
ss -tn src :27017 | awk '{print $5}'


# Log last days linux terminal
journalctl --since "2 days ago"  
journalctl --since "today"
journalctl --since "yesterday --until "today" 
journalctl --since "2022-07-21 06:00" --until "2022-07-21 08:00"
journalctl -b # last boot 
journalctl -k # kernel messages
journalctl -p er # by priority (emerg|alert|crit|err|warning|info|debug)
journalctl -u sshd # by unit 
journalctl _UID=1000 # by user id

# List 
ls . | wc -l  # Total files in folder

# IP testing
systemd-resolve --status | grep Current
ip a
ip r
ip addr show

#PM2
pm2 startup                   # Detect init system, generate and configure pm2 boot on startup
pm2 save                      # Save current process list
pm2 resurrect                 # Restore previously saved processes
pm2 unstartup                 # Disable and remove startup system

#MongoDB logs on the Linux command line
tail -10 /var/log/mongodb/mongod.log
grep error /var/log/mongodb/mongod.log
