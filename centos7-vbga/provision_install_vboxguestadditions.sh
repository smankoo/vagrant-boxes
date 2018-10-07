#!/bin/bash

sudo yum update -y
sudo yum install epel-release -y
sudo yum install dkms wget curl unzip gcc make kernel-devel kernel-devel-3.10.0-862.2.3.el7.x86_64 -y
sudo yum groupinstall "Development Tools" -y

VER=`curl -s https://download.virtualbox.org/virtualbox/LATEST-STABLE.TXT`
if [ $? -eq 0 ]; then
	wget http://download.virtualbox.org/virtualbox/${VER}/VBoxGuestAdditions_${VER}.iso
	sudo mkdir /media/VBoxGuestAdditions
	sudo mount -o loop,ro VBoxGuestAdditions_${VER}.iso /media/VBoxGuestAdditions
	sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
	rm VBoxGuestAdditions_${VER}.iso
	sudo umount /media/VBoxGuestAdditions
	sudo rmdir /media/VBoxGuestAdditions
fi
sudo yum update -y
