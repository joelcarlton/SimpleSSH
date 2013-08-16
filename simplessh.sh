#!/bin/bash
# Source: http://github.com/joelcarlton/SimpleSSH
# License: GNU GENERAL PUBLIC LICENSE Version 2, June 1991

# Global Variables
version=1.3 # Menus pull current version from this variable
# End Global Variables

# Functions
function Line () { echo "________________________________________________________________________________"
} # This makes the horizontal line throughout the script
function Space () { echo ""
} # This makes a double space
function 3Space () { Space; Space; Space
} # Three spaces in a row to make a large separator
function Breaker () { Line; Space
} # Breaker is used a lot. Horizontal line with a space under it
function Quit () { clear; echo "Script Terminated!"; Breaker; exit
} # This function makes the Script Terminated with the line under it when a user exits
function InputRequired () { Space; echo "Input Required, Rerun Script!"; Space; exit
} # The function responds the same way as quit but notifies user of required field
# End Functions
until [[ $Rerun = "EXIT" ]] # This loop allows the user to rerun the script or quit
do
clear # clears the screen to keep things clean
echo "Welcome to SimpleSSH $version" # Displays the version next to the tile in script
echo "This script is designed to make SSH connections easer" | tr [:lower:] [:upper:] # Translate into uppercase
Space # Function declared above to add a blank line
echo "MAIN MENU"
Breaker # Function declared above; a line and space
echo "For Help Consult the Manual at Instructions > General Help" | tr [:lower:] [:upper:]
Space
echo "Please choose one of the following from the menu." | tr [:lower:] [:upper:]
Breaker
echo "Press "ENTER" to take the default!"	 # Tells the user that they dont have to type in number for defualt
Space										# See Case 1|"") Line 84
echo "1. Standard Mode [DEFAULT]:.......Standard SSH Connection" #[Default] option
echo "2. Manual Mode:...................Advanced SSH Connections"
echo "3. Instructions:..................Detailed Information for SimpleSSH"
echo "4. Release Notes:.................View Detailed Notes for SimpleSSH"
echo "5. About:.........................Information about SimpleSSH"
echo "6. Quit:..........................Exit SimpleSSH"
Space
read -p "Enter selection (1 Through 6): " Answer # Stores user input into variable
case $Answer in # Loads user input into case statement
	1|"")  	# Case is for Standard Mode
		clear
		echo "SimpleSSH $version"
		Space
		echo "Standard Mode" | tr [:lower:] [:upper:]
		Breaker
		echo 'TYPE "exit" AT ANY TIME TO QUIT!' # Users have the option to type exit to quit
		Breaker
		read -p "Enter server or DNS address: " Server # Stores user input
		if [ -z $Server ] # Checks to see if field is blank
			then 
				InputRequired # Notifies user that field is required and exits script
		fi
		if [ $Server = "exit" ] # Checks to see if exit was typed
			then
				Quit # If user types exit the script will quit
		fi
		read -p "Enter username: " User
		if [ -z $User ]
			then 
				InputRequired
		fi
		if [ $User = "exit" ]
			then
				Quit
		fi
		read -p "Enter SSH port [Press ENTER for 22]: " Port # Press Enter to take the default of 22
		if [ -z $Port ]
			then 
				Port=22 # If user typed Enter to take default of 22 then field is null and 22 is assigned to Port
		fi				# If user typed a port number then value is not null and 22 is not assigned to Port
		if [ $Port = "exit" ]
			then
				Quit
		fi
		clear
		echo "SimpleSSH $version"
		Space
		echo "Standard Mode" | tr [:lower:] [:upper:]
		Breaker
		echo "Please Enter Password to Connect To: $User@$Server" # The variables are filled in for user assurance
		Space
		echo "Usage: ssh -p $Port $User@$Server;" # Variables are filled in for user education
		Breaker
		ssh -p $Port $User@$Server; # Command is now being executed
		;;
	2)  # Case is for Advanced Mode
		clear
		echo "SimpleSSH $version"
		Space
		echo "advanced mode" | tr [:lower:] [:upper:]
		Breaker
		echo "Please choose one of the following from the menu." | tr [:lower:] [:upper:]
		Breaker
		echo "Press "ENTER" to take the default!"
		Space
		echo "1. Encryption:......................Choose From 12 Encryption Methods"
		echo "2. Forwarding [DEFAULT]:............Forward a Port From Server to Localhost" # [Default]
		echo "3. Binding:.........................Bind Port to Localhost SOCKS Proxy"
		echo "4. X11 Forwarding:..................Forward XWindow Server from Linux/Unix"
		echo "5. Quit:............................Exit SimpleSSH"
		Space
		read -p "Enter selection (1 Through 5): " Answer
		case $Answer in
			1) 	# Case is for Encryption Mode
				clear
				# Encryption Array Declared
				Crypt=(aes128-ctr aes192-ctr aes256-ctr aes128-cbc aes192-cbc aes256-cbc arcfour arcfour128 arcfour256 cast128-cbc 3des-cbc blowfish-cbc)
				echo "SimpleSSH $version"
				Space
				echo "Encryption Menu" | tr [:lower:] [:upper:]
				Breaker
				echo "Choose 1 of the following ${#Crypt[*]} encryption methods." | tr [:lower:] [:upper:] # Array used to show total
				Breaker
				echo "Press "ENTER" to take the default!"
				Space
				echo "1.  Encryption Method:..................${Crypt[0]}: NSA/FIPS-approved" 
				echo "2.  Encryption Method:..................${Crypt[1]}: NSA/FIPS-approved" 
				echo "3.  Encryption Method [DEFAULT]:........${Crypt[2]}: NSA/FIPS-approved" # [Default]
				echo "4.  Encryption Method:..................${Crypt[3]}" 
				echo "5.  Encryption Method:..................${Crypt[4]}" 
				echo "6.  Encryption Method:..................${Crypt[5]}" 
				echo "7.  Encryption Method:..................${Crypt[6]}" 
				echo "8.  Encryption Method:..................${Crypt[7]}" 
				echo "9.  Encryption Method:..................${Crypt[8]}" 
				echo "10. Encryption Method:..................${Crypt[9]}" 
				echo "11. Encryption Method:..................${Crypt[10]}" 
				echo "12. Encryption Method:..................${Crypt[11]}" 
				echo "13. Quit:...............................Exit SimpleSSH" 
				Space
				read -p "Enter selection (1 Through 13): " Answer
				# Case is for Encryption Choice
				case $Answer in
					1) 	# Case is for Encryption # 1
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[0]} Encryption" | tr [:lower:] [:upper:] # Array's name is applied to title
						Breaker
						echo "Encryption Method ${Crypt[0]} is NSA/FIPS-approved" | tr [:lower:] [:upper:]
						Space
						echo 'TYPE "exit" AT ANY TIME TO QUIT!'
						Breaker
						read -p "Enter server or DNS address: " Server
						if [ -z $Server ]
							then 
								InputRequired
						fi
						if [ $Server = "exit" ]
							then
								Quit
						fi
						read -p "Enter username: " User
						if [ -z $User ]
							then 
								InputRequired
						fi
						if [ $User = "exit" ]
							then
								Quit
						fi
						read -p "Enter SSH port [Press ENTER for 22]: " Port
						if [ -z $Port ]
							then 
								Port=22
						fi
						if [ $Port = "exit" ]
							then
								Quit
						fi
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[0]} Encryption" | tr [:lower:] [:upper:]
						Breaker
						echo "Please Enter Password to Connect To: $User@$Server using ${Crypt[0]} Encryption"
						Space
						echo "Usage: ssh -p $Port -c ${Crypt[0]} $User@$Server;"
						Breaker
						ssh -p $Port -c ${Crypt[0]} $User@$Server;
					;; # End of Encryption # 1
					2) 	# Case is for Encryption # 2
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[1]} Encryption" | tr [:lower:] [:upper:]
						Breaker
						echo "Encryption Method ${Crypt[1]} is NSA/FIPS-approved" | tr [:lower:] [:upper:]
						Space
						echo 'TYPE "exit" AT ANY TIME TO QUIT!'
						Breaker
						read -p "Enter server or DNS address: " Server
						if [ -z $Server ]
							then 
								InputRequired
						fi
						if [ $Server = "exit" ]
							then
								Quit
						fi
						read -p "Enter username: " User
						if [ -z $User ]
							then 
								InputRequired
						fi
						if [ $User = "exit" ]
							then
								Quit
						fi
						read -p "Enter SSH port [Press ENTER for 22]: " Port
						if [ -z $Port ]
							then 
								Port=22
						fi
						if [ $Port = "exit" ]
							then
								Quit
						fi
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[1]} Encryption" | tr [:lower:] [:upper:]
						Breaker
						echo "Please Enter Password to Connect To: $User@$Server using ${Crypt[1]} Encryption"
						Space
						echo "Usage: ssh -p $Port -c ${Crypt[1]} $User@$Server;"
						Breaker
						ssh -p $Port -c ${Crypt[1]} $User@$Server;
						
					;; # End of Encryption # 2
					3|"") 	# Case is for Encryption # 3. [Default]
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[2]} Encryption" | tr [:lower:] [:upper:]
						Breaker
						echo "Encryption Method ${Crypt[2]} is the Most secure NSA/FIPS-approved method" | tr [:lower:] [:upper:]
						Space
						echo 'TYPE "exit" AT ANY TIME TO QUIT!'
						Breaker
						read -p "Enter server or DNS address: " Server
						if [ -z $Server ]
							then 
								InputRequired
						fi
						if [ $Server = "exit" ]
							then
								Quit
						fi
						read -p "Enter username: " User
						if [ -z $User ]
							then 
								InputRequired
						fi
						if [ $User = "exit" ]
							then
								Quit
						fi
						read -p "Enter SSH port [Press ENTER for 22]: " Port
						if [ -z $Port ]
							then 
								Port=22
						fi
						if [ $Port = "exit" ]
							then
								Quit
						fi
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[2]} Encryption" | tr [:lower:] [:upper:]
						Breaker
						echo "Please Enter Password to Connect To: $User@$Server using ${Crypt[2]} Encryption"
						Space
						echo "Usage: ssh -p $Port -c ${Crypt[2]} $User@$Server;"
						Breaker
						ssh -p $Port -c ${Crypt[2]} $User@$Server;
						;; # End of Encryption # 3
					4) 	# Case is for Encryption # 4
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[3]} Encryption" | tr [:lower:] [:upper:]
						Breaker
						echo "Encryption Method ${Crypt[3]}" | tr [:lower:] [:upper:]
						Space
						echo 'TYPE "exit" AT ANY TIME TO QUIT!'
						Breaker
						read -p "Enter server or DNS address: " Server
						if [ -z $Server ]
							then 
								InputRequired
						fi
						if [ $Server = "exit" ]
							then
								Quit
						fi
						read -p "Enter username: " User
						if [ -z $User ]
							then 
								InputRequired
						fi
						if [ $User = "exit" ]
							then
								Quit
						fi
						read -p "Enter SSH port [Press ENTER for 22]: " Port
						if [ -z $Port ]
							then 
								Port=22
						fi
						if [ $Port = "exit" ]
							then
								Quit
						fi
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[3]} Encryption" | tr [:lower:] [:upper:]
						Breaker
						echo "Please Enter Password to Connect To: $User@$Server using ${Crypt[3]} Encryption"
						Space
						echo "Usage: ssh -p $Port -c ${Crypt[3]} $User@$Server;"
						Breaker
						ssh -p $Port -c ${Crypt[3]} $User@$Server;
					;; # End of Encryption # 4
					5) 	# Case is for Encryption # 5
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[4]} Encryption" | tr [:lower:] [:upper:]
						Breaker
						echo "Encryption Method ${Crypt[4]}" | tr [:lower:] [:upper:]
						Space
						echo 'TYPE "exit" AT ANY TIME TO QUIT!'
						Breaker
						read -p "Enter server or DNS address: " Server
						if [ -z $Server ]
							then 
								InputRequired
						fi
						if [ $Server = "exit" ]
							then
								Quit
						fi
						read -p "Enter username: " User
						if [ -z $User ]
							then 
								InputRequired
						fi
						if [ $User = "exit" ]
							then
								Quit
						fi
						read -p "Enter SSH port [Press ENTER for 22]: " Port
						if [ -z $Port ]
							then 
								Port=22
						fi
						if [ $Port = "exit" ]
							then
								Quit
						fi
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[4]} Encryption" | tr [:lower:] [:upper:]
						Breaker
						echo "Please Enter Password to Connect To: $User@$Server using ${Crypt[4]} Encryption"
						Space
						echo "Usage: ssh -p $Port -c ${Crypt[4]} $User@$Server;"
						Breaker
						ssh -p $Port -c ${Crypt[4]} $User@$Server;
					;; # End of Encryption # 5
					6) 	# Case is for Encryption # 6
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[5]} Encryption" | tr [:lower:] [:upper:]
						Breaker
						echo "Encryption Method ${Crypt[5]}" | tr [:lower:] [:upper:]
						Space
						echo 'TYPE "exit" AT ANY TIME TO QUIT!'
						Breaker
						read -p "Enter server or DNS address: " Server
						if [ -z $Server ]
							then 
								InputRequired
						fi
						if [ $Server = "exit" ]
							then
								Quit
						fi
						read -p "Enter username: " User
						if [ -z $User ]
							then 
								InputRequired
						fi
						if [ $User = "exit" ]
							then
								Quit
						fi
						read -p "Enter SSH port [Press ENTER for 22]: " Port
						if [ -z $Port ]
							then 
								Port=22
						fi
						if [ $Port = "exit" ]
							then
								Quit
						fi
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[5]} Encryption" | tr [:lower:] [:upper:]
						Breaker
						echo "Please Enter Password to Connect To: $User@$Server using ${Crypt[5]} Encryption"
						Space
						echo "Usage: ssh -p $Port -c ${Crypt[5]} $User@$Server;"
						Breaker
						ssh -p $Port -c ${Crypt[5]} $User@$Server;
					;; # End of Encryption # 6
					7) 	# Case is for Encryption # 7
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[6]} Encryption" | tr [:lower:] [:upper:]
						Breaker
						echo "Encryption Method ${Crypt[6]}" | tr [:lower:] [:upper:]
						Space
						echo 'TYPE "exit" AT ANY TIME TO QUIT!'
						Breaker
						read -p "Enter server or DNS address: " Server
						if [ -z $Server ]
							then 
								InputRequired
						fi
						if [ $Server = "exit" ]
							then
								Quit
						fi
						read -p "Enter username: " User
						if [ -z $User ]
							then 
								InputRequired
						fi
						if [ $User = "exit" ]
							then
								Quit
						fi
						read -p "Enter SSH port [Press ENTER for 22]: " Port
						if [ -z $Port ]
							then 
								Port=22
						fi
						if [ $Port = "exit" ]
							then
								Quit
						fi
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[6]} Encryption" | tr [:lower:] [:upper:]
						Breaker
						echo "Please Enter Password to Connect To: $User@$Server using ${Crypt[6]} Encryption"
						Space
						echo "Usage: ssh -p $Port -c ${Crypt[6]} $User@$Server;"
						Breaker
						ssh -p $Port -c ${Crypt[6]} $User@$Server;
					;; # End of Encryption # 7
					8) 	# Case is for Encryption # 8
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[7]} Encryption" | tr [:lower:] [:upper:]
						Breaker
						echo "Encryption Method ${Crypt[7]}" | tr [:lower:] [:upper:]
						Space
						echo 'TYPE "exit" AT ANY TIME TO QUIT!'
						Breaker
						read -p "Enter server or DNS address: " Server
						if [ -z $Server ]
							then 
								InputRequired
						fi
						if [ $Server = "exit" ]
							then
								Quit
						fi
						read -p "Enter username: " User
						if [ -z $User ]
							then 
								InputRequired
						fi
						if [ $User = "exit" ]
							then
								Quit
						fi
						read -p "Enter SSH port [Press ENTER for 22]: " Port
						if [ -z $Port ]
							then 
								Port=22
						fi
						if [ $Port = "exit" ]
							then
								Quit
						fi
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[7]} Encryption" | tr [:lower:] [:upper:]
						Breaker
						echo "Please Enter Password to Connect To: $User@$Server using ${Crypt[7]} Encryption"
						Space
						echo "Usage: ssh -p $Port -c ${Crypt[7]} $User@$Server;"
						Breaker
						ssh -p $Port -c ${Crypt[7]} $User@$Server;
					;; # End of Encryption # 8
					9) 	# Case is for Encryption # 9
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[8]} Encryption" | tr [:lower:] [:upper:]
						Breaker
						echo "Encryption Method ${Crypt[8]}" | tr [:lower:] [:upper:]
						Space
						echo 'TYPE "exit" AT ANY TIME TO QUIT!'
						Breaker
						read -p "Enter server or DNS address: " Server
						if [ -z $Server ]
							then 
								InputRequired
						fi
						if [ $Server = "exit" ]
							then
								Quit
						fi
						read -p "Enter username: " User
						if [ -z $User ]
							then 
								InputRequired
						fi
						if [ $User = "exit" ]
							then
								Quit
						fi
						read -p "Enter SSH port [Press ENTER for 22]: " Port
						if [ -z $Port ]
							then 
								Port=22
						fi
						if [ $Port = "exit" ]
							then
								Quit
						fi
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[8]} Encryption" | tr [:lower:] [:upper:]
						Breaker
						echo "Please Enter Password to Connect To: $User@$Server using ${Crypt[8]} Encryption"
						Space
						echo "Usage: ssh -p $Port -c ${Crypt[8]} $User@$Server;"
						Breaker
						ssh -p $Port -c ${Crypt[8]} $User@$Server;
					;; # End of Encryption # 9
					10) # Case is for Encryption # 10
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[9]} Encryption" | tr [:lower:] [:upper:]
						Breaker
						echo "Encryption Method ${Crypt[9]}" | tr [:lower:] [:upper:]
						Space
						echo 'TYPE "exit" AT ANY TIME TO QUIT!'
						Breaker
						read -p "Enter server or DNS address: " Server
						if [ -z $Server ]
							then 
								InputRequired
						fi
						if [ $Server = "exit" ]
							then
								Quit
						fi
						read -p "Enter username: " User
						if [ -z $User ]
							then 
								InputRequired
						fi
						if [ $User = "exit" ]
							then
								Quit
						fi
						read -p "Enter SSH port [Press ENTER for 22]: " Port
						if [ -z $Port ]
							then 
								Port=22
						fi
						if [ $Port = "exit" ]
							then
								Quit
						fi
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[9]} Encryption" | tr [:lower:] [:upper:]
						Breaker
						echo "Please Enter Password to Connect To: $User@$Server using ${Crypt[9]} Encryption"
						Space
						echo "Usage: ssh -p $Port -c ${Crypt[9]} $User@$Server;"
						Breaker
						ssh -p $Port -c ${Crypt[9]} $User@$Server;
					;; # End of Encryption # 10
					11) # Case is for Encryption # 11
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[10]} Encryption" | tr [:lower:] [:upper:]
						Breaker
						echo "Encryption Method ${Crypt[10]}" | tr [:lower:] [:upper:]
						Space
						echo 'TYPE "exit" AT ANY TIME TO QUIT!'
						Breaker
						read -p "Enter server or DNS address: " Server
						if [ -z $Server ]
							then 
								InputRequired
						fi
						if [ $Server = "exit" ]
							then
								Quit
						fi
						read -p "Enter username: " User
						if [ -z $User ]
							then 
								InputRequired
						fi
						if [ $User = "exit" ]
							then
								Quit
						fi
						read -p "Enter SSH port [Press ENTER for 22]: " Port
						if [ -z $Port ]
							then 
								Port=22
						fi
						if [ $Port = "exit" ]
							then
								Quit
						fi
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[10]} Encryption" | tr [:lower:] [:upper:]
						Breaker
						echo "Please Enter Password to Connect To: $User@$Server using ${Crypt[10]} Encryption"
						Space
						echo "Usage: ssh -p $Port -c ${Crypt[10]} $User@$Server;"
						Breaker
						ssh -p $Port -c ${Crypt[10]} $User@$Server;
					;; # End of Encryption # 11
					12) # Case is for Encryption # 12
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[11]} Encryption" | tr [:lower:] [:upper:]
						Breaker
						echo "Encryption Method ${Crypt[11]}" | tr [:lower:] [:upper:]
						Space
						echo 'TYPE "exit" AT ANY TIME TO QUIT!'
						Breaker
						read -p "Enter server or DNS address: " Server
						if [ -z $Server ]
							then 
								InputRequired
						fi
						if [ $Server = "exit" ]
							then
								Quit
						fi
						read -p "Enter username: " User
						if [ -z $User ]
							then 
								InputRequired
						fi
						if [ $User = "exit" ]
							then
								Quit
						fi
						read -p "Enter SSH port [Press ENTER for 22]: " Port
						if [ -z $Port ]
							then 
								Port=22
						fi
						if [ $Port = "exit" ]
							then
								Quit
						fi
						clear
						echo "SimpleSSH $version"
						Space
						echo "${Crypt[11]} Encryption" | tr [:lower:] [:upper:]
						Breaker
						echo "Please Enter Password to Connect To: $User@$Server using ${Crypt[11]} Encryption"
						Space
						echo "Usage: ssh -p $Port -c ${Crypt[11]} $User@$Server;"
						Breaker
						ssh -p $Port -c ${Crypt[11]} $User@$Server;
					;; # End of Encryption # 12
					13) # Case is for Quit
						Quit ;;
				esac
				# closing case Encryption Choice
				;;
				# closing case Encryption
			2|"") 	# Case is for Port Forwarding. [Default]
				clear
				echo "SimpleSSH $version"
				Space
				echo "Port Forwarding" | tr [:lower:] [:upper:]
				Breaker
				echo 'TYPE "exit" AT ANY TIME TO QUIT!'
				Breaker
				read -p "Enter server or DNS address: " Server
				if [ -z $Server ]
					then 
						InputRequired
				fi
				if [ $Server = "exit" ]
					then
						Quit
				fi
				read -p "Enter username: " User
				if [ -z $User ]
					then 
						InputRequired
				fi
				if [ $User = "exit" ]
					then
						Quit
				fi
				read -p "Enter SSH port [Press ENTER for 22]: " Port
				if [ -z $Port ]
					then 
						Port=22
				fi
				if [ $Port = "exit" ]
					then
						Quit
				fi
				read -p "Enter host address [Press ENTER for localhost]: " Host # localhost is typical, therefor [default]
				if [ -z $Host ]
					then 
						Host=localhost # Localhost applied to Host
				fi
				if [ $Host = "exit" ]
					then
						Quit
				fi
				Breaker
				echo "Common ports are:" # Common ports are added... More to come!
				Space
				echo "Apple Server Admin......................................311"
				echo "Samba...................................................445"
				echo "AFP.....................................................548"
				echo "Windows Remote Desktop..................................3389"
				echo "VNC.....................................................5900"
				echo "Plex Media Server.......................................32400"
				echo "iTunes Music Sharing....................................49152"
				Breaker
				echo "# This is the port from the Host machine that will be forwarded." # User Education
				read -p "Enter host port [Press ENTER for VNC Port 5900]: " HostPort # VNC is default
				if [ -z $HostPort ]		# Can be overridden if port number is entered.
					then 
						HostPort=5900
				fi
				if [ $HostPort = "exit" ]
					then
						Quit
				fi
				echo "# This is the port on the local machine that will recieve the forward." # User Education
				read -p "Enter local port [Press ENTER for 9900]: " LocalPort 	# Just took 5900 and made it 9900
				if [ -z $LocalPort ]											# easy to remember this way
					then 
						LocalPort=9900
				fi
				if [ $LocalPort = "exit" ]
					then
						Quit
				fi
				clear
				echo "SimpleSSH $version"
				Space
				echo "Port Forwarding" | tr [:lower:] [:upper:]
				Breaker
				echo "Please Enter Password to Connect To: $User@$Server and forward Port $HostPort to $LocalPort"
				Space
				echo "Usage: ssh -p $Port -L $LocalPort:$Host:$HostPort $User@$Server;"
				Breaker
				ssh -p $Port -L $LocalPort:$Host:$HostPort $User@$Server;
				;;
			3) 	# Case is for Port Binding
				clear
				echo "SimpleSSH $version"
				Space
				echo "Port Binding" | tr [:lower:] [:upper:]
				Breaker
				echo "Warning!" | tr [:lower:] [:upper:]
				Space
				echo "Please consult the instruction manual located under the main menu for more" | tr [:lower:] [:upper:] # User Education
				echo "information on how to set up a socks proxy on your local machine. Please note" | tr [:lower:] [:upper:]
				echo "that binding over ssh will have no effect unless the client has been" | tr [:lower:] [:upper:]
				echo "configured correctly!" | tr [:lower:] [:upper:]
				Breaker
				echo 'TYPE "exit" AT ANY TIME TO QUIT!'
				Breaker
				read -p "Enter server or DNS address: " Server
				if [ -z $Server ]
					then 
						InputRequired
				fi
				if [ $Server = "exit" ]
					then
						Quit
				fi
				read -p "Enter username: " User
				if [ -z $User ]
					then 
						InputRequired
				fi
				if [ $User = "exit" ]
					then
						Quit
				fi
				read -p "Enter SSH port [Press ENTER for 22]: " Port
				if [ -z $Port ]
					then 
						Port=22
				fi
				if [ $Port = "exit" ]
					then
						Quit
				fi
				read -p "Enter Bind port [Press ENTER for 9999]: " BindPort # Binding to 9999; easy to remember
				if [ -z $BindPort ]
					then 
						BindPort=9999
				fi
				if [ $BindPort = "exit" ]
					then
						Quit
				fi
				clear
				echo "SimpleSSH $version"
				Space
				echo "Port Binding" | tr [:lower:] [:upper:]
				Breaker
				echo "Please Enter Password to Connect To: $User@$Server and Bind on Port $BindPort"
				Space
				echo "Usage: ssh -p $Port -D $BindPort $User@$Server;"
				Breaker
				ssh -p $Port -D $BindPort $User@$Server;
				;;
			4)	# Case is for X11 Forwarding
				clear
				echo "SimpleSSH $version"
				Space
				echo "X11 Forwarding" | tr [:lower:] [:upper:]
				Breaker
				echo "Warning!" | tr [:lower:] [:upper:]
				Space
				echo "Please consult the instruction manual located under the main menu for more" | tr [:lower:] [:upper:] # User Education
				echo "information on how to acquire an X11 client. Please note that forwarding" | tr [:lower:] [:upper:]
				echo "X11 over ssh will have no effect unless a client has been properly installed" | tr [:lower:] [:upper:]
				Breaker
				echo 'TYPE "exit" AT ANY TIME TO QUIT!'
				Breaker
				read -p "Enter server or DNS address: " Server
				if [ -z $Server ]
					then 
						InputRequired
				fi
				if [ $Server = "exit" ]
					then
						Quit
				fi
				read -p "Enter username: " User
				if [ -z $User ]
					then 
						InputRequired
				fi
				if [ $User = "exit" ]
					then
						Quit
				fi
				read -p "Enter SSH port [Press ENTER for 22]: " Port
				if [ -z $Port ]
					then 
						Port=22
				fi
				if [ $Port = "exit" ]
					then
						Quit
				fi
				clear
				echo "SimpleSSH $version"
				Space
				echo "X11 Forwarding" | tr [:lower:] [:upper:]
				Breaker
				echo "Please Enter Password to Connect To: $User@$Server and Forward X11"
				Space
				echo "Usage: ssh -p $Port -Y $User@$Server;"
				Breaker
				ssh -p $Port -Y $User@$Server;
				;;
			5) # Case is for Quit
				Quit ;;
			*) # Case is for Catch All
				clear; echo "***Invalid Entry***" ;;
		esac
		# Case Closing is for Advanced Mode	
		;;
	3)	# Case is for Instructions
		clear
		echo "SimpleSSH $version"
		Space
		echo "INSTRUCTIONS"
		Breaker
		echo "Please choose one of the following from the menu." | tr [:lower:] [:upper:]
		Breaker
		echo "Press "ENTER" to take the default!"
		Space
		echo "1. General Help [DEFAULT]:.............Learn how to use SimpleSSH" 
		echo "2. X11:................................How to install X11" 
		echo "3. SOCKS Proxy:........................How to Set up a SOCKS Proxy"
		echo "4. Quit:...............................Exit SimpleSSH" 
		Space
		read -p "Enter selection (1 Through 4): " Answer
			# Case is for Instructions Choice
			case $Answer in
				1|"") 	# Case is for Instructions
					clear
					echo "SimpleSSH $version"
					Space
					echo "SimpleSSH Help" | tr [:lower:] [:upper:]
					Breaker
					echo "SimpleSSH Instruction Manual" | tr [:lower:] [:upper:] # Manual!!!
					Breaker
					echo "Description"
					Space
					echo "SimpleSSH is designed to make advanced SSH connections easy; Whether port"
					echo "forwarding, binding, X11, or specifying encryption, SimpleSSH can help an"
					echo "inexperienced administrator or a seasoned expert. SimpleSSH makes it easy"
					echo "to make secure connections without having to remember the syntax."
					3Space
					echo "Main Menu"
					Space
					echo "Standard Mode: This is the default mode that allows users to make connections"
					echo "with a username, server address, and port. Enter 1 from the main menu and"
					echo "press enter to make a standard connection. At any time during this mode the"
					echo "user can type exit to exit the script. Please note that each prompt requires"
					echo "a value entered or the script will terminate. If a prompt offers an option that"
					echo "states: Press Enter for Default, note that it is not required to enter a value,"
					echo "but if a value is entered it will override the default."
					Space
					echo "If values are entered properly, there is an active Internet connection, and a"
					echo "successful connection to the remote server is made, the user should be"
					echo "a password dialog. Enter the server password and press enter. When the user "
					echo "wishes to disconnect from the server, exit can be typed to disconnect. Once"
					echo "the server has been disconnected, an option will be presented telling the user"
					echo "to press Enter to rerun the script or type exit to quit. Exiting the script"
					echo "will bring the user back to the default bash prompt. If Enter is pressed, the"
					echo "SimpleSSH script will rerun and the user will be returned back to the main menu."
					3Space
					echo "Advanced Mode"
					Space
					echo "All of the following modes will function in the same way as the Standard Mode"
					echo "but with additional options:"
					Space
					echo "Encryption"
					Space
					echo "This mode allows the user to choose one of twelve different encryption methods"
					echo "when connecting to a server. Follow through each of the prompts. Please refer"
					echo "to the instructions under Standard Mode for more information on required"
					echo "variables and behavior of the script."
					Space
					echo "Forwarding"
					Space
					echo "This mode allows the user to choose a port on the remote server and forward"
					echo "it over an SSH tunnel to any port on the local machine. Follow through each"
					echo "of the prompts. Please refer to the instructions under Standard Mode for more" 
					echo "information on required variables and behavior of the script."
					Space
					echo "Binding"
					Space
					echo "This mode allows the user to choose a port on the local machine to forward"
					echo "traffic to. Once the local port is successfully bound to the SSH tunnel"
					echo "configuration of a local SOCKS Proxy will be required. Follow the instructions"
					echo "under Main Menu > Instructions > SOCKS Proxy for more information on setting"
					echo "up a local proxy. Please refer to the instructions under Standard Mode for"
					echo "more information on required variables and behavior of the script."
					Space
					echo "X11 Forwarding"
					Space
					echo "This mode allows the user to forward the X Windowing system, or GUI, of a"
					echo "Linux server over to an X client on the local system. Please note that an X11"
					echo "client is required on the local machine to successfully forward applications."
					echo "Follow the instructions under Main Menu > Instructions > X11 for more"
					echo "information on setting up an X11 client. Please refer to the instructions under"
					echo "Standard Mode for more information on required variables and behavior of"
					echo "the script."
					3Space
					echo "Instructions"
					Space
					echo "This mode displays contains a submenu with additional details on X11 and"
					echo "SOCKS Proxies."
					3Space
					echo "Release Notes"
					Space
					echo "This option will display update notes for the script."
					3Space
					echo "About"
					Space
					echo "Selecting the About option will display information about Simplest"
					Space
					echo "The Purpose of the application"
					echo "The Author: Author or contributors of the script."
					echo "Version: Current version of the script"
					echo "Minimum Terminal Size: this is the minimum terminal size that the script is"
					echo "optimized for."
					echo "Executed Location: This displays the location on the hard drive where the"
					echo "script has been executed."
					3Space
					echo "Quit"
					Space
					echo "Selecting the Quit option will terminate the script and return the user back"
					echo "to default bash prompt."
					;;
				2) 	# Case is for X11 Help
					clear
					echo "SimpleSSH $version"
					Space
					echo "X11 Help" | tr [:lower:] [:upper:]	# More Documentation
					Breaker
					echo "X11 for Mac OS X" | tr [:lower:] [:upper:]
					Space
					echo "Go to the following website to download the X11 client for Mac OS X:"
					Space
					echo " -> http://xquartz.macosforge.org/trac/wiki"
					Space
					echo "Run the installer to get the client. Run the X11 mode from the SimpleSSH"
					echo "script and loggin. When the user is logged in, commands can be run to"
					echo "utilize X11. In order to start the GUI over X11, run the follow commands:"
					echo 'For gnome: "gnome-session" for kde: "startkde" and for xfce: "startxfce4"'
					Breaker
					echo "X11 for Windows" | tr [:lower:] [:upper:]
					echo "Refer to the following website for installation and configuration of X11"
					Space
					echo " -> http://x.cygwin.com/"
					Space
					echo "Once X11 is installed and configured, run the X11 mode from the SimpleSSH"
					echo "script and loggin. When the user is logged in, commands can be run to"
					echo "utilize X11. In order to start the GUI over X11, run the follow commands:"
					echo 'For gnome: "gnome-session" for kde: "startkde" and for xfce: "startxfce4"'
					;;
				3) 	# Case is for SOCKS Help
					clear
					echo "SimpleSSH $version"
					Space
					echo "SOCKS Help" | tr [:lower:] [:upper:]	# More Documentation
					Breaker
					echo "How to set up a SOCKS Proxy on Mac OS X" | tr [:lower:] [:upper:]
					Space
					echo "1. Open System Preferences"
					echo "2. Click Network"
					echo "3. Select the network interface you wish to use (i.e. AirPort)"
					echo "4. Click Advanced"
					echo "5. Click Proxies"
					echo "6. Check the box beside SOCKS Proxy"
					echo "7. Fill in localhost and 9999"
					echo "8. Click OK"
					echo "9. Click Apply"
					echo "10. Close System Preferences"
					Breaker
					echo "How to set up a SOCKS Proxy in Windows using Putty" | tr [:lower:] [:upper:]
					Space
					echo "1. Open the PuTTY SSH client"
					echo "2. Complete the following fields under the Session category:"
					echo " • Host Name (or IP Address) - Enter the IP address for your server"
					echo " • Port: Enter port which the SSH daemon is listening on"
					echo "3. Navigate to the Connection > SSH > Tunnels category"
					echo "4. Complete the following fields under the Tunnels category:"
					echo " • Source port: Enter port on the local machine that accepts SOCKS connections"
					echo " • Destination: Enter the IP address for your server"
					echo " • Select the Dynamic radio button"
					echo "5. Click the Add button to add the source port association"
					echo "6. If you would like to save your SOCKS proxy settings:"
					echo " • Navigate back to the Session category"
					echo " • Enter a label for your settings in the Saved Sessions field"
					echo " • Click the Save button"
					echo "7. Click the Open button to initiate a connection with your VPS"
					echo "8. Log in with your username and password"
					echo "9. Open your client applications and enable proxy on the local SOCKS proxy port"
					Breaker
					echo "How to set up a SOCKS Proxy Firefox" | tr [:lower:] [:upper:]
					Space
					echo "1. Select Firefox > Preferences"
					echo "2. Click Advanced"
					echo "3. Click Network"
					echo "4. Click Settings"
					echo "5. Click Manual proxy configuration"
					echo "6. Besides SOCKS Host, fill in localhost and 9999"
					echo "7. Do not fill in any other fields, including HTTP Proxy"
					echo "8. Click SOCKS v5"
					echo "9. Click OK"
					;;
				4) 	# Case is for Quit
					Quit ;;
				*) 	# Case is for Catch All
					clear; echo "***Invalid Entry***" ;;
			esac # Case Close of Instructions Choice
		;; # Case Close of Instructions
	4)	# Case is for Release Notes
		clear
		echo "SimpleSSH $version"
		Space
		echo "RELEASE NOTES"	# Release notes for users to view. Newest updates appear last
		Breaker
		echo "Version: 1.00"	# Version Info
		echo "Date: 09/12/11"
		Space
		echo "------------------------------------Notes---------------------------------------" # Update info
		Space
		echo "• Initial build with case."
		3Space
		echo "Version: 1.01"
		echo "Date: 11/08/11"
		Space
		echo "------------------------------------Notes---------------------------------------"
		Space
		echo "• Added Windows Remote Desktop Port under Forwarding popular ports."
		3Space
		echo "Version: 1.02"
		echo "Date: 12/04/11"
		Space
		echo "------------------------------------Notes---------------------------------------"
		Space
		echo "• Implemented looping for menus so there is now an option"
		echo "  for rerunning the script if there is an error."
		echo "• Added global functions to optimize code"
		echo "• Further customized the Quit option from the menu."
		echo "• Added the ability to exit from any of the running SSH modes."
		echo "• Updated menu design."
		echo "• Added an About section to main menu."
		echo "• Added an Instructions section to main menu."
		echo "• Added instructions on how to setup a SOCKS Proxy on Mac OS X"
		echo "• Added a Release Notes section to main menu."
		echo "• Removed custom SSH port from advanced menu. Feature was already"
		echo "  located under the standard mode."
		echo "• Added Enter for Default to the Standard Mode."
		echo "• Added Enter for Default to SSH, Bind, and Forwarding offering"
		echo "  suggestions and speeding up data entry for common ports such as 22."
		echo "• Changed encryption methods from individual variables to an array."
		3Space
		echo "Version: 1.03"
		echo "Date: 12/05/11"
		echo "------------------------------------Notes---------------------------------------"
		Space
		echo "• Added information on how to configure a SOCKS Proxy on Mac OS X,"
		echo "  Windows PuTTY, and Firefox"
		echo "• Added manual for SimpleSSH under Main Menu > Instructions"
		echo "  General Help"
		echo "• Added information on how to utilize X11 on Mac OS X and Windows."
		echo "• Added more comments throught code for more clarity"
		3Space
		;;
	5)	# Case is for About
		clear
		echo "SimpleSSH $version"
		Space
		echo "ABOUT" # Info about the script for the user
		Breaker
		echo "PURPOSE"
		Space
		echo "Designed to take the effort out of port forwarding, binding ports,"
		echo "and forwarding X11."
		Breaker
		echo "Designed by: Joel Carlton"
		echo "Version: $version"
		echo "Designed for a Minimum Terminal Size of 80x24" # Default
		echo "Executed From: $0" # Absolute path to script
		;;
	6) 	# Case is for Quit
		Quit ;;
	*) 	# Case is for Catch All
		clear; echo "***Invalid Entry***" ;;
esac
# Case Close is for Main Menu
Breaker
read -p 'Press ENTER to rerun this script or type "exit" to quit: ' ans # Statement that allows user to rerun script or quit
Rerun=`echo $ans | tr [:lower:] [:upper:]` # Translates user responce to uppercase so case is not an issue
done	# Finishes the until statement
Quit
# Loop is for entire script
