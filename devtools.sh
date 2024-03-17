#!/bin/bash  

# ================ Menu Template =================
# A template with functional examples for creating BaSH menus.
# Save (or copy and paste) this script as your starting point for your file.


# ============ Environment Variables ============= 

# Options to change the printed text colour
STD='\033[0;0;39m'
RED='\033[0;41;30m'

# =================== Modules =====================
# Add your desired programme modules

InstallWireGuard(){
# Install WireGuard-Tools & ScrCpy
	sudo apt update
	sudo apt install wireguard-tools
	sudo apt install scrcpy
}

GenKey(){
# Generate a private key
	sudo wg genkey

}

DMTcommit(){
	cd ~/DevTools/
	read -rp "Enter your commit message: " GitMessage
    git add . && git commit -m " $GitMessage "
    git push git@github.com:DroppedMeguts/DevTools.git
    cd ..
}

# ================== Main Menu ====================

MainMenu(){
# Clears the screen
	clear
# Define this menus title.	
	MenuTitle=" - Menu Template - "
# Describe what this menu does
	Description=" An empty template for new menus "

# Display the menu options
show_menus(){
	echo " "	
	echo " $MenuTitle "
	echo " $Description "  
	echo "-----------------------------------"
	echo "0.  "
	echo "1.  Generate Private Key"
	echo "2.  "
	echo "3.  "
	echo "4.  "
	echo "5.  "
	echo "6.  "
	echo "7.  " 
    echo "8.  "
    echo "9.  "
	echo "10. Setup Wireguard and ScrCpy "
	echo "Q.  Quit				   Exit this Menu"
	echo " "
	echo " $lastmessage " 
	sudo wg
}

read_options(){
# Maps the displayed options to command modules	
	local choice
# Inform user how to proceed and capture input.	
	read -p "Enter the desired item number or command: " choice
# Execute selected command modules	
	case $choice in
        0)    ;;
		1)   GenKey ;;
		2)    ;;
		3)   ;;
		4)   ;;
		5)   ;;
		6)   ;;
		7)   ;;
		8)   ;;
        9)   ;;
        10)  InstallWireGuard ;;
# Quit this menu
        q|Q) clear && echo " See you later $USER! " && exit 0;;
# Add, Commit and Push updates
		ACP)  DMTcommit ;;
# Capture non listed inputs and send to BASH.
		*) echo -e "${RED} $choice is not a displayed option, trying BaSH.....${STD}" && echo -e "$choice" | /bin/bash
	esac
}

# --------------- Main loop --------------------------
while true
do
	show_menus
	read_options
done

}

# =================== Run Commands ===============
# commands to run in this file at start.
MainMenu

