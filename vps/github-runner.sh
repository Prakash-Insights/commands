# Download

# Create a folder
mkdir actions-runner && cd actions-runner
# Download the latest runner package
curl -o actions-runner-linux-x64-2.285.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.285.1/actions-runner-linux-x64-2.285.1.tar.gz
# Optional: Validate the hash
echo "5fd98e1009ed13783d17cc73f13ea9a55d3b2  actions-runner-linux-x64-2.285.1.tar.gz" | shasum -a 256 -c
# Extract the installer
tar xzf ./actions-runner-linux-x64-2.285.1.tar.gz

# Configure

# Create the runner and start the configuration experience
./config.sh --url https://github.com/name-repo/ik --token opopopopopopopop
# Last step, run it!
./run.sh

# Using your self-hosted runner
# Use this YAML in your workflow file for each job
runs-on: self-hosted

# Installing the service
    # Stop the self-hosted runner application if it is currently running.
    # Install the service with the following command:
    sudo ./svc.sh install

# Starting the service
    # Start the service with the following command:
    sudo ./svc.sh start   #  sudo ~/actions-runner/svc.sh start
    sudo ./svc.sh status  #  sudo ~/actions-runner/svc.sh status
    sudo ./svc.sh stop    #  sudo ~/actions-runner/svc.sh stop
    cat ~/actions-runner/.service
    systemctl --type=service | grep actions.runner
    sudo ./svc.sh status -l

# EBS Volumn update after incresing Volumn
df -hT 
lsblk
sudo growpart /dev/xvda 1
cat /proc/partitions
sudo resize2fs /dev/xvda1






