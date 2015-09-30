#!/bin/bash
##########################################################################################
#Banners

banner_main () {
clear
echo
echo -e " \e[32m╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱"
echo -e " ╭━━━━┳━━━┳━━━┳╮╱╱╭╮╭━┳━━┳━━━━╮"
echo -e " ┃╭╮╭╮┃╭━╮┃╭━╮┃┃╱╱┃┃┃╭┻┫┣┫╭╮╭╮┃"
echo -e " ╰╯┃┃╰┫┃╱┃┃┃╱┃┃┃╱╱┃╰╯╯╱┃┃╰╯┃┃╰╯"
echo -e " ╱╱┃┃╱┃┃╱┃┃┃╱┃┃┃╱╭┫╭╮┃╱┃┃╱╱┃┃"
echo -e " ╱╱┃┃╱┃╰━╯┃╰━╯┃╰━╯┃┃┃╰┳┫┣╮╱┃┃"
echo -e " ╱╱╰╯╱╰━━━┻━━━┻━━━┻╯╰━┻━━╯╱╰╯"
echo -e " ╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱\e[0mby: Illyad\e[32m╱╱╱╱\e[0m"
echo
echo
}

banner_install () {
	clear
	echo

echo -e " \e[32m╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱"
echo -e " ╭━━┳━╮╱╭┳━━━┳━━━━┳━━━┳╮╱╱╭╮"
echo -e " ╰┫┣┫┃╰╮┃┃╭━╮┃╭╮╭╮┃╭━╮┃┃╱╱┃┃"
echo -e " ╱┃┃┃╭╮╰╯┃╰━━╋╯┃┃╰┫┃╱┃┃┃╱╱┃┃"
echo -e " ╱┃┃┃┃╰╮┃┣━━╮┃╱┃┃╱┃╰━╯┃┃╱╭┫┃╱╭╮"
echo -e " ╭┫┣┫┃╱┃┃┃╰━╯┃╱┃┃╱┃╭━╮┃╰━╯┃╰━╯┃"
echo -e " ╰━━┻╯╱╰━┻━━━╯╱╰╯╱╰╯╱╰┻━━━┻━━━╯"
echo -e " ╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱\e[0mby: Illyad\e[32m╱╱╱╱╱╱\e[0m"

	echo
}

banner_update () {
	clear
	echo 
echo -e " \e[32m╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱"
echo -e " ╭╮╱╭┳━━━┳━━━┳━━━┳━━━━┳━━━╮"
echo -e " ┃┃╱┃┃╭━╮┣╮╭╮┃╭━╮┃╭╮╭╮┃╭━━╯"
echo -e " ┃┃╱┃┃╰━╯┃┃┃┃┃┃╱┃┣╯┃┃╰┫╰━━╮"
echo -e " ┃┃╱┃┃╭━━╯┃┃┃┃╰━╯┃╱┃┃╱┃╭━━╯"
echo -e " ┃╰━╯┃┃╱╱╭╯╰╯┃╭━╮┃╱┃┃╱┃╰━━╮"
echo -e " ╰━━━┻╯╱╱╰━━━┻╯╱╰╯╱╰╯╱╰━━━╯"
echo -e " ╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱\e[0mby: Illyad\e[32m╱╱╱╱╱╱\e[0m"
echo
}

banner_nmap () {
clear
echo -e " \e[32m╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱"
echo -e " ╭━╮╱╭┳━╮╭━┳━━━┳━━━╮"
echo -e " ┃┃╰╮┃┃┃╰╯┃┃╭━╮┃╭━╮┃"
echo -e " ┃╭╮╰╯┃╭╮╭╮┃┃╱┃┃╰━╯┃"
echo -e " ┃┃╰╮┃┃┃┃┃┃┃╰━╯┃╭━━╯"
echo -e " ┃┃╱┃┃┃┃┃┃┃┃╭━╮┃┃╱╱"
echo -e " ╰╯╱╰━┻╯╰╯╰┻╯╱╰┻╯╱╱"
echo -e " ╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱\e[0m"
echo
}

############################################################################################
#Update

echo "Loading..."
update_system () {
	banner_update
	sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade && ./run.sh 
}

#############################################################################################
#Install

install_system () {
	clear
	banner_install
	echo
	echo "Disclaimer"
	echo
	echo "Do you want to continue? (Y/n)"
	read a
	if [[ $a == Y || $a == y ]]; then
		clear
		banner_install
		./install.sh		#Install the system
		./run.sh
	else
		clear
		./run.sh
	fi
}

##############################################################################################
#nmap

nmap_scan () {                          #menu
	banner_nmap
	echo "1. Stealth scan"
	echo "2. Scan list"
	echo "3. Previous menu"
	echo
	echo -n "Choice: "
	read choice
case $choice in

#########
#Stealth Scan

     1)
     clear
     banner_nmap
     echo
     echo -n "Enter a IP or URL: "
     read target

     # Check for no response
     if [ -z $target ]; then
	  clear
          banner_nmap	  
          echo
          echo "You did not enter anything."
	  clear
	  nmap_scan    
     fi     
     clear
     echo                     
     banner_nmap
     echo
     sudo nmap -Pn -n -T4 --open -sV --stats-every 10s $target -oN results/nmap_scan.txt
     ;;

#########
#Scan list

     2)
     echo
     echo -n "Enter the location of your list: "
     read location

     # Check for no response
     if [ -z $location ]; then
	  clear
          banner_nmap
          echo "You did not enter a location."
	  clear
	  nmap_scan
     fi

     # Check for wrong location
     if [ ! -f $location ]; then
	  clear
          banner_nmap
          echo "The file does not exist."
	  clear
	  nmap_scan
     fi
     clear
     echo
     banner_nmap
     echo
     sudo nmap -Pn -n -T4 --open -sV --stats-every 10s -iL $location -oN scan.txt
     ;;
#########
#Exit

     3) ./run.sh ;;
     *) echo; echo "Invalid choice."; echo
esac

./run.sh

}

######################################################################################################
#Main Menu

banner_main
echo -e " \e[1mInstall Toolkit/update system:          Mitm attacks\e[21m"
echo "    1. Install                              7. js injection"
echo "    2. Update                               8. fake AP*"
echo "                                            9. DNS spoofing*"
echo
echo -e " \e[1mInformation gathering:                  Metasploit\e[21m"
echo "    3. Nmap                                10. Armitage"
echo "    4. Recon people                        11. Metasploit Framework*"
echo "    5. Get robots.txt from domain          12. Veil-Evasion*"
echo "    6. whois*                              13. Start PostGRESQL"
echo
echo "    14. Crack WiFi"
echo
echo "    15. Quit"
echo
echo -n "Choice: "
read choice
case $choice in
     1) install_system ;;
     2) update_system;;
     3) nmap_scan ;;
     4) ./recon-people.sh ;;
     5) ./robots.sh ;;
     6) ./run.sh;;
     7) gnome-terminal -x ./mitm_beef.sh ;;
     8) ./run.sh ;;
     9) ./run.sh ;;
    10)  gnome-terminal -x sudo service postgresql start && armitage;;
    11) ./run.sh ;;
    12) ./run.sh ;;
    13)  service postgresql start && ./run.sh ;;
    14)  print_something ;;
    15)  exit ;;
     *) echo; echo "Invalid choice."; echo
esac

./run.sh
