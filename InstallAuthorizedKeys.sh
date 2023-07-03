#! /bin/bash

sshKeyArray=(	
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDJZ4T0CcMMpyQRYYdNEq8nBYNV6yeIALa3qb2+/APaX TestKey"
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII4moz7csWEn9m6RlHRxdRnZrvDg7AQ9HrKoClMf7uUP HasPW"
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG7r/nR/RsmHE6cq/oMe/PttEeJ9TZR7gTNam/DnCXig AnsiblePubKey"
            )


for i in "${sshKeyArray[@]}"; do
  if ! grep -q "$i" ~/.ssh/authorized_keys; then
      echo $i >> ~/.ssh/authorized_keys && echo Adding public key to ~/.ssh/authorized_keys:  $i
  else
      echo Public key already located in ~/.ssh/authorized_keys:  $i
  fi
done


