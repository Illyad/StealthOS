#!/bin/bash
#System monitor
#Add colors, graphics
#

distro=$(uname -n)
interface=$(ip link | awk '{print $2, $9}' | grep UP | cut -d ':' -f1)
ip=$(ip addr | grep global | cut -d '/' -f1 | awk '{print $2}')
long='========================================================================================================='
medium='====================================================================================='
short='========================================'
sip='sort -n -u -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4'

system_memory () {	
	free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%)\n", $3,$2,$3*100/$2 }'
	    #color green if mem = <13000
	    #color orange if mem 1300 -15000
	    #color red id mem = >15000
}

system_disk () {
	df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}'
}

system_cpu () {
	top -bn1 | grep load | awk '{printf "CPU Load: %.2f\n", $(NF-2)}'
}

# Get the system time
system_time () {
        now="$(date +"%r")"
	echo " MAIN MENU for $HOSTNAME - $now"
}

memory=$(system_memory) 
disk=$(system_disk)
cpu=$(system_cpu)

# Display text at given row and column 
show(){
        local x=$1
        local y=$2
        local txt="$3"
        # Set cursor position on screen
        tput cup $x $y
        echo "$txt"
}
while [ : ]
do
        clear
        # Get the system time
        now="$(date +"%r")"
        # Show main - menu, server name and time
        show 1 5 "MAIN MENU for $HOSTNAME - $now"
	show 3 5 "$memory"
	show 4 5 "$disk"
	show 5 5 "$cpu"
        show 3 50 "1. System info"
        show 4 50 "2. Apache server stats"
        show 5 50 "3. MySQL server stats"
        show 6 50 "5. Exit"
        tput cup 7 5; read -t 1 -p "Choice [1-5] ? " usrch
        # do something
        case $usrch in
                1) read -t 1 -p "Showing system info, wait..." fakeinput
			
			;;
                2) read -t 1 -p "Showing apache info, wait..." fakeinput

			;;
                3) read -t 1 -p "Showing mysqld info, wait..." fakeinput
	
			;;
                4) read -t 1 -p "Showing firewall info, wait..." fakeinput

			;;
                5) echo "Bye."; exit 0;;
        esac
done
 
