#!/bin/bash
##########################
#
#  Installation of Toolkit
#
#  mitmproxy
#  BeEF
#  Webserver
#  Nmap
#
#  by: Ilyas Deckers
###############################################################################

sudo apt-get update
sudo mkdir results/
clear

########################################################################################
#install mitmproxy
clear
echo
echo "Installing mitmproxy..."
if [ $(dpkg-query -W -f='${Status}' mitmproxy 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt-get -y install mitmproxy;
fi
clear

echo
echo "mitmproxy install succesfull"

#######################################################################################
#installwebserver & copy files for http injection
#######################################################################################
clear
echo
echo " Installing LAMP server..."
echo
if [ $(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
	sudo apt-get -y install apache2
fi

if [ $(dpkg-query -W -f='${Status}' php-mysql 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
	sudo apt-get -y install mysql-server php5-mysql
	sudo mysql_install_db
fi

if [ $(dpkg-query -W -f='${Status}' php5 libapache2-mod-php5 php5-mcrypt 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
	sudo apt-get -y install php5 libapache2-mod-php5 php5-mcrypt
	sudo service apache2 restart
fi

if [ $(dpkg-query -W -f='${Status}' php5-pgsql php5-common php5-mysql 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
	sudo apt-get -y install php5-pgsql php5-common php5-mysql
	sudo service apache2 restart
fi

####################################################################################################
#nmap
####################################################################################################

#install nmap
clear
echo
echo " Installing nmap..."
echo
if [ $(dpkg-query -W -f='${Status}' nmap 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
	sudo apt-get -y install nmap
fi
######################################################################################################
#install BeEF
######################################################################################################

clear
echo
echo " Do you have BeEF installed? (Y/n)"
read a
if [[ $a == Y || $a == y ]]; then
	clear 	
	echo
	echo "Installation successfull."
	exit
fi
clear
echo
echo "Updating the system"
echo
sudo apt-get update
sudo apt-get install curl git
curl -sSL https://raw.githubusercontent.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 2.1.5
rvm use 2.1.5 -- default
gem install bundler

git clone git://github.com/beefproject/beef.git
cd beef
bundle install
