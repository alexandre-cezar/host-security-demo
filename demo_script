#!/bin/bash
filename=freesweep
filename2=git
#Verifies if freesweep is already installed
if [ sudo dpkg -l "$filename" ]; then
	echo "Freesweep already installed"
else
	sudo apt-get install -y freesweep
fi
#Downloads a sample malware file for Wildfire to catch it
sudo curl -JO 'https://wildfire.paloaltonetworks.com/publicapi/test/elf'
#Verifies if git is already instaled
if [ sudo dpkg -l  "$filename2" ]; then
	echo "Git already installed"
else
	sudo apt-get install -y git
fi
#Moves to /tmp and clones the demo project in Github
sudo cd /tmp
git clone https://github.com/alexandre-cezar/host-security-demo
cd host-security-demo
#Installs the malicious package, based on the host architecture
arch=$(uname -i)
if [[ $arch == x86_64* ]]; then
    sudo dpkg -i freesweep_x64.deb
elif [[ $arch == i*86 ]]; then
    sudo dpkg -i freesweep_x86.deb
elif  [[ $arch == arm* ]] || [[ $arch = aarch64 ]]; then
    echo "ARM Architecture - Can't install binary"
fi
