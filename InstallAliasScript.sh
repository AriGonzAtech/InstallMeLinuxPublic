#! /bin/bash
sudo echo
clear

gitRepo=https://raw.githubusercontent.com/AriGonzAtech/InstallMeLinuxPublic/installme


declare -A aliasList=( 
	[InstallAuthorizedKeys.sh]='"rm -f $HOME/$key && wget $gitRepo/$key -P $HOME && sudo bash $HOME/$key"'
	[InstallAliasScript.sh]='"rm -f $HOME/$key && wget $gitRepo/$key -P $HOME && sudo bash $HOME/$key"'
 	[InstallCTTemplatePostScript.sh]='"rm -f $HOME/$key && wget $gitRepo/$key -P $HOME && sudo bash $HOME/$key"'
  	[InstallVMTemplatePreScript.sh]='"rm -f $HOME/$key && wget $gitRepo/$key -P $HOME && sudo bash $HOME/$key"'
	[ipa]="ip a | egrep '(^[1-9]|\sinet)'"
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
