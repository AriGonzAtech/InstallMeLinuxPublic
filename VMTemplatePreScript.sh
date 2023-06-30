#! /bin/bash
sudo echo

echo Updating the apt repository
sudo apt update -y
echo -e "\n\n"


aptgetArray=(	qemu-guest-agent
		cloud-init
		ntp
		ntpdate
  		ufw
    		nano	)


for i in "${aptgetArray[@]}"
do
if apt-cache policy $i | grep 'Installed: (none)\|Unable to locate package'>/dev/null; then
	echo "Installing $i"
	sudo apt install $i -y && echo -e '\n'
else
 	echo "$i is already installed" && echo -e '\n'
fi
done


echo Pointing the time server to ntp.ubuntu.com
sudo ntpdate ntp.ubuntu.com
sudo timedatectl set-timezone America/Chicago
echo -e "\n\n"


echo Enabling the firewall and allowing ssh
sudo ufw enable -y
sudo ufw allow ssh
echo -e "\n\n"


echo Upgrading apps
sudo apt dist-upgrade -y
echo -e "\n\n"


#Remove old keys
echo Clearing out the old ssh_host files
if sudo rm /etc/ssh/ssh_host_* ; then
    echo Successfully cleared out etc/ssh/ssh_host_* files 
else
    echo No ssh_host files found that need to get cleared
fi
echo -e "\n\n"


echo Clearing out the machine ID
cat /etc/machine-id
sudo truncate -s 0 /etc/machine-id
cat /etc/machine-id
echo -e "\n\n"


echo Clean the apt repository and clean orphaned apt installations 
sudo apt clean
sudo apt autoremove -y
echo -e "\n\n"


echo Checking if the machine-id link exists
if ls -l /var/lib/dbus/machine-id | grep '/var/lib/dbus/machine-id -> /etc/machine-id'; then
    echo machine-id link found no action needed
else
    echo Creating machine-id link
	sudo ln -s /etc/machine-id /var/lib/dbus/machine-id
fi
echo -e "\n\n"


echo Clearing out the BASH history
sudo truncate -s 0 ~/.bash_history
cat ~/.bash_history
echo -e "\n\n"


echo Shutdown the VM and you can now create the template
sudo shutdown 



