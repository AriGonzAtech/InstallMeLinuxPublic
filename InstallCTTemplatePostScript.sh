#! /bin/bash
sudo echo


echo Create SSH keys if needed
if [ ! -f /etc/ssh/ssh_host_ecdsa_key.pub ]; then
	echo Creating new SSH keys
	sudo dpkg-reconfigure openssh-server
else
	echo SSH keys exist.  Moving on.
fi
