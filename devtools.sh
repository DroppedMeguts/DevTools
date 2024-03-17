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
# Change text colour and prints the current user variable.
	echo -e "${RED} Current user is: ${STD}" $USER
}

Installscrcpy(){
# create a variable which defines and executes the desired command (date).
	DT=$(date)
# Change text colour and display contents of the DT variable.
	echo -e "${RED} Today is: ${STD}" $DT
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
	echo "1.  "
	echo "2.  "
	echo "3.  "
	echo "4.  "
	echo "5.  "
	echo "6.  "
	echo "7.  " 
    echo "8.  "
    echo "9.  "
	echo "10. Setup Wireguard and ScrCpy "
	echo "99.  Quit				   Exit this Menu"
	echo " "
	echo " $lastmessage " 
	echo " " 
}

read_options(){
# Maps the displayed options to command modules	
	local choice
# Inform user how to proceed and capture input.	
	read -p "Enter the desired item number or command: " choice
# Execute selected command modules	
	case $choice in
        0)   PrintUsername ;;
		1)   DateTime ;;
		2)   PrintUsername && DateTime ;;
		3)   ;;
		4)   ;;
		5)   ;;
		6)   ;;
		7)   ;;
		8)   ;;
        9)   ;;
        10)  InstallWireGuard && Installscrcpy ;;
# Quit this menu
        99) clear && echo " See you later $USER! " && exit 0;;
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

