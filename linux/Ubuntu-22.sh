# Ubuntu 22

# Remove all .NET packages
sudo apt remove 'dotnet*'
sudo apt remove 'aspnetcore*'

# Create the file:
sudo touch /etc/apt/preferences.d/dotnet.pref
# with content:
Package: *
Pin: origin "packages.microsoft.com"
Pin-Priority: 1001

# Install .NET SDK 6.0
sudo apt update

sudo apt install dotnet-sdk-6.0
# And I got the last version of the SDK:

dotnet --list-sdks
# 6.0.400 [/usr/share/dotnet/sdk]
