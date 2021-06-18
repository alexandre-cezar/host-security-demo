#!/bin/bash
package=freesweep

#Verifies if freesweep is already installed
if sudo dpkg -l "$package" > /dev/null; then
	echo "Freesweep already installed"
else
	sudo apt-get install -y "$filename"
fi

#Downloads the sample malware file for Wildfire to catch it
sudo curl -JO 'https://wildfire.paloaltonetworks.com/publicapi/test/elf'

#Installs the malicious package, based on the host architecture
arch=$(uname -i)
if [[ $arch == x86_64* ]]; then
    sudo dpkg -i freesweep_x64.deb
elif [[ $arch == i*86 ]]; then
    sudo dpkg -i freesweep_x86.deb
elif  [[ $arch == arm* ]] || [[ $arch = aarch64 ]]; then
    echo "ARM Architecture - Can't install binary"
fi
