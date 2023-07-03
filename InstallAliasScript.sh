#! /bin/bash
sudo echo
clear

gitRepo=https://raw.githubusercontent.com/AriGonzAtech/InstallMeLinuxPublic/installme


declare -A aliasList=( 
	[InstallAuthorizedKeys]='"rm -f $HOME/InstallAuthorizedKeys.sh && wget https://raw.githubusercontent.com/AriGonzAtech/InstallMeLinuxPublic/installme/InstallAuthorizedKeys.sh -P $HOME && sudo bash $HOME/InstallAuthorizedKeys.sh"'
	[InstallAliasScript]='"rm -f $HOME/InstallAliasScript.sh && wget https://raw.githubusercontent.com/AriGonzAtech/InstallMeLinuxPublic/installme/InstallAliasScript.sh -P $HOME && sudo bash $HOME/InstallAliasScript.sh"'
 	[InstallCTTemplatePostScript]='"rm -f $HOME/InstallCTTemplatePostScript.sh && wget https://raw.githubusercontent.com/AriGonzAtech/InstallMeLinuxPublic/installme/InstallCTTemplatePostScript.sh -P $HOME && sudo bash $HOME/InstallCTTemplatePostScript.sh"'
  	[InstallVMTemplatePreScript]='"rm -f $HOME/InstallVMTemplatePreScript.sh && wget https://raw.githubusercontent.com/AriGonzAtech/InstallMeLinuxPublic/installme/InstallVMTemplatePreScript.sh -P $HOME && sudo bash $HOME/InstallVMTemplatePreScript.sh"'
 )


for key in "${!aliasList[@]}"; do 
  if ! grep -q "$key" ~/.bashrc; then
      echo Adding alias 
      echo "alias $key=${aliasList[$key]}" >> ~/.bashrc
      echo "alias $key=${aliasList[$key]}"
      echo -e '\n'
  else
      echo alias $key is already there
      cat ~/.bashrc | grep $key
      echo -e '\n'
  fi
done

#This will refresh the bash terminal with the latest entries
. ~/.bashrc
