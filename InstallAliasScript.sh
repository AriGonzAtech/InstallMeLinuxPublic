#! /bin/bash
sudo echo
clear

gitRepo=https://raw.githubusercontent.com/AriGonzAtech/InstallMeLinuxPublic/installme


declare -A aliasList=( 
	[getAuthorized_keysScript]='"rm -f ~/authorized_keys.sh && wget https://raw.githubusercontent.com/AriGonzAtech/InstallMeLinuxPublic/installme/authorized_keys.sh && sudo bash ~/authorized_keys.sh"'
	[getAliasScript]='"rm -f ~/InstallAliasScript.sh && wget https://raw.githubusercontent.com/AriGonzAtech/InstallMeLinuxPublic/installme/InstallAliasScript.sh && sudo bash ~/InstallAliasScript.sh"'
 	[getInstallCTTemplatePostScript]='"rm -f ~/InstallCTTemplatePostScript.sh && wget https://raw.githubusercontent.com/AriGonzAtech/InstallMeLinuxPublic/installme/InstallCTTemplatePostScript.sh && sudo bash ~/InstallCTTemplatePostScript.sh"'
  	[getInstallVMTemplatePreScript]='"rm -f ~/InstallVMTemplatePreScript.sh && wget https://raw.githubusercontent.com/AriGonzAtech/InstallMeLinuxPublic/installme/InstallVMTemplatePreScript.sh && sudo bash ~/InstallVMTemplatePreScript.sh"'
 )


for key in "${!aliasList[@]}"; do 
  if ! grep -q "$key" ~/.bashrc; then
      echo Adding alias 
      echo "alias $key=${aliasList[$key]}" >> ~/.bashrc
  else
      echo alias $key is already there
  fi
done

