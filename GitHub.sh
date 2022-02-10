#!/bin/bash

clear

if dpkg -l | grep -q git; then
	PS3="Choice a Action: "
	options=("Git Commit" "Git Commit + Git Push" "Git Clone" "Quit")
	select option in "${options[@]}"
	do
    	case $option in
    	    "Git Commit")
				clear
				read -p "Comment: " comment
				git add .
				git commit -m "$comment"
				clear
				echo -e "1) Git Commit Git\n2) Commit + Git Push\n3) Git Clone\n4) Quit"
	            ;;
	        "Git Commit + Git Push")
				clear
				read -p "Comment: " comment
	        	git add .
				git commit -m "$comment"
				git push
				clear
				echo -e "1) Git Commit Git\n2) Commit + Git Push\n3) Git Clone\n4) Quit"
	            ;;
	        "Git Clone")
				clear
				read -p "Repository to Clone: " rep
				git clone $rep
				clear
				echo -e "1) Git Commit Git\n2) Commit + Git Push\n3) Git Clone\n4) Quit"
	            ;;
	        "Quit")
	            break
	            ;;
	        *) echo "invalid option $REPLY";;
	    esac
	done
else
	echo "Git isn't installed"
	read -p "Do you wish to install it? (y/n): " anwser
	if [ "y" = $answer ]; then
		sudo apt install git -y
		break
	else
		echo "Git will not be installed"
	fi
fi

clear
