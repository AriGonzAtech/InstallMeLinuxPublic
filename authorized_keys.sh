#! /bin/bash
sudo echo


sshKeyArray=(	
            ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDJZ4T0CcMMpyQRYYdNEq8nBYNV6yeIALa3qb2+/APaX TestKey
            ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII4moz7csWEn9m6RlHRxdRnZrvDg7AQ9HrKoClMf7uUP HasPWqemu-guest-agent
            )


for i in "${sshKeyArray[@]}"
do
  if ! grep -q $i ~/.ssh/authorized_keys
  then
      echo $i >> ~/.ssh/authorized_keys
  else
      echo key already there
  fi
done



