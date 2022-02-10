#!/bin/bash

clear
echo "Informations from your GitHub account..."
read -p "Current web browser that you are using: " browser
read -p "User name: " user
read -p "Email: " email
echo -e "\nVisual Studio Code 	==> 	code"
echo -e "\nAtom 		   		==> 	atom\n"
read -p "Main Code Editor: " editor
echo -e "\nUser: $user | Github Email: $email | Code Editor: $editor\n"
read -p "All the information is correct? (y/n) " answer
if [ "y" = $answer ]; then
	git config --global user.name $user
	git config --global user.email $email
	git config --global core.editor "$editor --wait"
	code .gitconfig
	ssh-keygen -t rsa -b 4096 -C $email
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa
	$browser https://github.com/settings/ssh/new
	break
else
	echo -e "\nSetup Failed"
	read failed
	./'GitHub SSH Key'.sh
fi
clear
