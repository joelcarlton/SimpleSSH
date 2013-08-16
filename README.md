# Simple-SSH

A Menu based shell script

SimpleSSH was designed to take the effort out of port forwarding, binding ports, and forwarding X11."

### Created

12/08/11

### Version                     

1.3
                        
## Release Notes

### 1.3 (12/05/11)        

- Added information on how to configure a SOCKS Proxy on Mac OS X, Windows PuTTY, and Firefox
- Added manual for SimpleSSH under Main Menu > Instructions > General Help
- Added information on how to utilize X11 on Mac OS X and Windows.
- Added more comments throught code for more clarity

### 1.2 (12/04/11)       

- Implemented looping for menus so there is now an option for rerunning the script if there is an error.
- Added global functions to optimize code
- Further customized the Quit option from the menu.
- Added the ability to exit from any of the running SSH modes.
- Updated menu design.
- Added an About section to main menu.
- Added an Instructions section to main menu.
- Added a Release Notes section to main menu.
- Removed custom SSH port from advanced menu. Feature was already located under the standard mode.
- Added "Enter for Default" to the Standard Mode.
- Added "Enter for Default" to SSH, Bind, and Forwarding offering suggestions and speeding up data entry for common ports such as 22.
- Changed encryption methods from individual variables to an array.

### 1.1 (11/08/11)

- Added Windows Remote Desktop Port under Forwarding popular ports.

### 1.0 (09/12/11)

- Initial build.

## Upcoming Features

- Socket Cleaning
- netstat tuna | grep server
- ps -A | grep port
- kill -9 pid
- netstat tuna | grep server # to double check

## Usage

The script will need execute permissions. They can be added with `chmod u+x simplessh.sh` or `chmod 740 simplessh.sh`.

If the script is in the system path it can be executed with the following `$ simplessh`. If running from a directery, run with `$ ./simplessh.sh`.