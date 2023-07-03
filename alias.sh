#! /bin/bash
sudo echo
clear

declare -A aliasList=( 
	[getauthorized_keys]='"rm -f ~/authorized_keys.sh && wget https://raw.githubusercontent.com/AriGonzAtech/InstallMeLinuxPublic/installme/authorized_keys.sh && sudo bash ~/authorized_keys.sh"'
	[getAliasScript]='"rm -f ~/alias.sh && wget https://raw.githubusercontent.com/AriGonzAtech/InstallMeLinuxPublic/installme/alias.sh && sudo bash ~/alias.sh"'
 )


for key in "${!aliasList[@]}"; do 
  if ! grep -q "$key" ~/.bashrc; then
      echo Adding alias 
      echo "alias $key=${aliasList[$key]}" >> ~/.bashrc
  else
      echo alias $key is already there
  fi
done

