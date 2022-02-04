#!/bin/bash

scriptPath="/home/$USER/Git/Script/assistant.sh"
browser=vivaldi

clear

echo -e "\nWelcome to Ubuntu Task Menu (Developed by VFDGiacomo)\n"
echo -e "1. Developer Options    2. System Options    3. Video Game    4. Create a Shortcut    5. About the Developer     6. Quit\n"
read -p "action: " action1
case $action1 in
	"1")
		clear
		echo -e "\nWelcome to Ubuntu Task Menu (Developed by VFDGiacomo)\n"
		echo -e "1. GitHub (SSH Key)   2. MySQL    3. Docker    4. Back to Main Menu\n"
		read -p "action: " developer
		case $developer in
			"1")
				clear
				echo "Informations from your GitHub account..."
				read -p "User name: " user
				read -p "Email: " email
				echo -e "\nVisual Studio Code ==> code\nAtom 		   ==> atom\n"
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
					bash $scriptPath
				fi
				clear
				bash $scriptPath
				;;
			"2")
				clear
				echo -e "\nWelcome to Ubuntu Task Menu (Developed by VFDGiacomo)\n"
				echo -e "1. MySQL Start    2. MySQL Stop    3. MySQL Status    4. MySQL (Terminal)    5. Back to Main Menu\n"
				read -p "action: " action3
				case $action3 in
					"1")
						sudo systemctl start mysql
						bash $scriptPath
						;;
					"2")
						sudo systemctl stop mysql
						bash $scriptPath
						;;
					"3")
						clear
						sudo systemctl status mysql
						read -p "" ok
						bash $scriptPath
						;;
					"4")
						clear
						echo -e "\nUser: vincenzo\nPassword: B9t5qrpj5213*\n"
						mysql -u vincenzo -p
						bash $scriptPath
						;;
					"5")
						bash $scriptPath
						;;
					esac
					;;
			"3")
				clear
				echo -e "\nWelcome to Ubuntu Task Menu (Developed by VFDGiacomo)\n"
				echo -e "1. Docker Start    2. Docker Stop    3. Docker Status    4. Back to Main Menu\n"
				read -p "action: " action3
				case $action3 in
					"1")
						sudo systemctl start docker
						bash $scriptPath
						;;
					"2")
						sudo systemctl stop docker
						bash $scriptPath
						;;
					"3")
						clear
						sudo systemctl status docker
						read -p "" ok
						bash $scriptPath
						;;
					"4")
						bash $scriptPath
						;;
					esac
				;;
			"4")
				bash $scriptPath
				;;
		esac
		;;
	"2")
		clear
		echo -e "\nWelcome to Ubuntu Task Menu (Developed by VFDGiacomo)\n"
		echo -e "1. Full Update    2. Bluetooth   3. Repair Disk (fsck)    4. PPA Management    5. Clean Cash    6. Send Snap Back To Hell    7. Back to Main Menu\n"
		read -p "action: " system
		case $system in
			"1")
				clear
				sudo apt update
				sudo apt upgrade -y
				sudo apt autoremove -y
				flatpak update -y
				flatpak remove --unused -y
				bash $scriptPath
				;;
			"2")
				clear
				echo -e "\nWelcome to Ubuntu Task Menu (Developed by VFDGiacomo)\n"
				echo -e "1. Bluetooth Start    2. Bluetooth Stop    3. Bluetooth Restart    4. Bluetooth Status    5. Bluetooth Reinstall    6. Back to Main Menu\n"
				read -p "action: " bluetooth
				case $bluetooth in
					"1")
						sudo systemctl start bluetooth
						bash $scriptPath
						;;
					"2")
						sudo systemctl stop bluetooth
						bash $scriptPath
						;;
					"3")
						sudo systemctl restart bluetooth
						bash $scriptPath
						;;
					"4")
						clear
						sudo systemctl status bluetooth
						read -p "" ok
						bash $scriptPath
						;;
					"5")
						sudo apt install --reinstall bluez gnome-bluetooth indicator-bluetooth pulseaudio-module-bluetooth
						clear
						if ! dpkg -l | grep -q blueman; then
							echo "Blueman is not installed."
							echo "I recommend you to install for a better experience"
							read -p "Would you like to install it? (y/n) " anwser
							if [ $answer = "y" ]; then
								sudo apt install blueman -y
							else
								bash $scriptPath
							fi
						else
							bash $scriptPath
						fi
						;;
					"6")
						bash $scriptPath
						;;
				esac
				;;
			"3")
				if ! dpkg -l | grep -q smartmontools; then
					echo "Smartmontools is not installed."
					read -p "Would you like to install it? (y/n) " anwser
					if [ $answer = "y" ]; then
						sudo apt install smartmontools -y
					else
						bash $scriptPath
					fi
				else
					clear
					echo -e "\nSmartmontools is availible\n"
					lsblk
					echo -e "\nWich starage driver would you like to check? "
					read -p "/dev/sd" driver
					clear
					sudo umount /dev/sd"$driver"
					sudo fsck -f /dev/sd"$driver"
					sudo fsck -y /dev/sd"$driver"
					sudo fsck -a /dev/sd"$driver" 		# Errors
					sudo fsck -c /dev/sd"$driver"		# Bad Blocks
					bash $scriptPath
				fi
				;;
			"4")
				clear
				echo -e "\nWelcome to Ubuntu Task Menu (Developed by VFDGiacomo)\n"
				echo -e "1. PPA List    2. Add PPA    3. Remove PPA    4. Quit\n"
				read -p "action: " ppa
				case $ppa in
					"1")
						clear
						find /etc/apt/ -iname "*.list" -exec sed '/^#/d' {} \;|nl
						echo "Return to menu [ENTER]"
						read return
						bash $scriptPath
						;;
					"2")
						clear
						echo -e "\nThis Operation Will Add a Repository To Your System\n"
						read -p "PPA link: " ppaLink
						sudo add-apt-repository $ppaLink
						bash $scriptPath
						;;
					"3")
						clear
						echo -e "\nThis Operation Will Delete a Repository To Your System\n"
						read -p "PPA link: " ppaLink
						sudo add-apt-repository $ppaLink -r -y
						bash $scriptPath
						;;
					"4")
						clear
						bash $scriptPath
				esac
				;;
			"5")
				clear
				echo -e "Level 1:\nLevel 2:\nLevel 3:\n"
				if ! dpkg -l | grep -q xclip; then
					echo "xclip tool is not installed"
					read -p "Would you like to install it? (y/n) " anwser
					if [ $answer = "y" ]; then
						sudo apt install xclip -y
					else
						bash $scriptPath
					fi
				else
					echo -e "xclip tool is installed\n"
					read -p "Drop cach level: " num
					echo "Code: sync; echo $num > /proc/sys/vm/drop_caches"
					echo "sync; echo $num > /proc/sys/vm/drop_caches" | xclip
					sudo su
					bash $scriptPath
				fi
				;;
			"6")
				clear
				if snap; then
					sudo snap remove snap-store
					sudo snap remove gtk-common-themes
					sudo snap remove gnome-3-34-1804
					sudo snap remove core18
					sudo snap remove snapd
					echo -e "\nCheck if is there any snap packages\n"
					snap list
					echo " "
					read -p "Continue? (y/n) " answer
					if [ $answer = "y" ]; then
						sudo apt autoremove --purge snapd -y
						m -rf ~/snap
						sudo rm -rf /snap /var/snap /var/lib/snapd
						sudo apt install --no-install-recommends gnome-software
						bash $scriptPath
					else
						bash $scriptPath
					fi
				else
					echo -e "\nYou Are Already Free, No Snap Found on System\n"
					read ok
					bash $scriptPath
				fi
				;;
			"7")
				bash $scriptPath
				;;
		esac
		;;
	"3")
		clear
		echo -e "\nWelcome to Ubuntu Task Menu (Developed by VFDGiacomo)\n"
		echo -e "1. Lauch Game    2. Saves Backup    3. Fix The Stanley Parable bug    4. Fix ibb & obb bug    5. Back to Main Menu\n"
		read -p "action: " games
		case $games in
			"1")
				clear
				echo -e "\nWelcome to Ubuntu Task Menu (Developed by VFDGiacomo)\n"
				echo -e "1. Linux Native Games    2. Windows Games    3. Back to Main Menu\n"
				read -p "action: " gameType
				case $gameType in
				"1")
					clear
					echo ""
					cd /mnt/Games/Native/ && ls
					echo ""
					read -p "Wich Game: " selected
					cd "$selected"/ && clear
					mangohud ./start.sh
					bash $scriptPath
					;;
				"2")
					clear
					echo ""
					cd /mnt/Games/"Linux (Wine)"/ && ls
					echo ""
					read -p "Wich Game: " selected
					cd "$selected"/ && clear
					mangohud ./start.sh
					bash $scriptPath
					;;
				"3")
					bash $scriptPath
					;;
				esac
				;;
			"2")
				# Native
				local="/mnt/Games/saves/"
				cp -r /home/$USER/.config/unity3d/"Night School Studio" 		"$local"	# Oxenfree
				cp -r /home/$USER/.config/unity3d/"Adult Swim Games"	 		"$local"	# Rise and Shine
				cp -r /home/$USER/.config/unity3d/"Bennett Foddy" 				"$local"	# Getting Over It
				cp -r /home/$USER/.config/unity3d/"Daniel Mullins Games" 		"$local"	# Pony Island
				cp -r /home/$USER/.config/unity3d/"Team Cherry"					"$local"	# Hollow Knight
				cp -r /home/$USER/.config/unity3d/"Pine Studio"					"$local"	# SEUM Speedrunners from Hell

				# Wine
				rm -r /mnt/Games/saves/"Ori and the Blind Forest"
				mkdir /mnt/Games/saves/"Ori and the Blind Forest"
				cp -r /mnt/Games/"Linux (Wine)"/"Ori and The Blind Forest (2015)"/game/prefix/drive_c/users/$USER/AppData/Local/"Ori and the Blind Forest DE"/*.sav				/mnt/Games/saves/"Ori and the Blind Forest"

				# Steam
				rm -r /mnt/Games/saves/"Star Wars Battlefront II"
				cp -r /mnt/Games/Steam/steamapps/common/"Star Wars Battlefront II Classic"/GameData/SaveGames	/mnt/Games/saves/"Star Wars Battlefront II"/		# Star Wars Battlefront II

				# PSP
				rm -r /mnt/Games/saves/PSP
				retroarch="/home/$USER/.var/app/org.libretro.RetroArch/config/retroarch/saves"
				cp -r "$retroarch"/PSP/SAVEDATA			/mnt/Games/saves/PSP

				# cp -r /mnt/Games/saves/ /media/$USER/"Black Box"/"System Files" # To Black Box

				bash $scriptPath
				;;
			"3")
				cd /mnt/Games/SteamLibrary/steamapps/common/"The Stanley Parable"/bin
				rm libstdc++.so.6
				bash $scriptPath
				;;
			"4")
				echo "Bug has been fixed"
				bash $scriptPath
				;;
			"5")
				bash $scriptPath
				;;
		esac
		;;
	"4")
		clear
		read -p "File name (Without .desktop): " name
		file=${name// /-}
		read -p "Application Name: " app
		read -p "Comment: " comment
		# File:
		echo "[Desktop Entry]" 											>> 			/home/$USER/.local/share/applications/$file'.desktop'
		echo "Version=1.0" 												>>			/home/$USER/.local/share/applications/$file'.desktop'
		echo "Name=$app" 												>> 			/home/$USER/.local/share/applications/$file'.desktop'
		echo "GenericName=$app" 										>> 			/home/$USER/.local/share/applications/$file'.desktop'
		echo "Comment=$comment" 										>> 			/home/$USER/.local/share/applications/$file'.desktop'
		echo "Exec=mangohud '/mnt/Games/Native/"$comment"/start.sh'"	>> 			/home/$USER/.local/share/applications/$file'.desktop'
		echo "Path=/mnt/Games/Native/$comment/" 						>> 			/home/$USER/.local/share/applications/$file'.desktop'
		echo "Icon=/mnt/Games/Native/$comment/icon.png" 				>> 			/home/$USER/.local/share/applications/$file'.desktop'
		echo "Terminal=false" 											>> 			/home/$USER/.local/share/applications/$file'.desktop'
		echo "Type=Application" 										>> 			/home/$USER/.local/share/applications/$file'.desktop'
		echo "Categories=Game" 											>> 			/home/$USER/.local/share/applications/$file'.desktop'
		;;
	"5")
		vivaldi Vincenzofdg.github.io
		bash $scriptPath
		;;
	"6")
		clear
		exit
		;;
esac
