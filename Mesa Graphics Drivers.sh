#!/bin/bash

repPPA='ppa:oibaf/graphics-drivers'

clear

echo -e "1. Mesa Information (If Installed)   2. Install    3. Remove    4. Quit\n"
read -p "action: " developer
case $developer in
	"1")
    clear
    glxinfo | grep Mesa
    read -p "" ok
    ./'Mesa Graphics Drivers'.sh
		;;
	"2")
    clear
    sudo add-apt-repository $repPPA
    sudo apt update
    sudo apt upgrade
    ./'Mesa Graphics Drivers'.sh
    ;;
  "3")
    if ! dpkg -l | grep -q ppa-purge; then
      sudo apt install ppa-purge
      sudo ppa-purge $repPPA
    else
      sudo ppa-purge $repPPA
    fi
    ;;
  "4")
    clear
    exit
    ;;
esac
