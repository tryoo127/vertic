#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
blue='\e[0;34m'
cyan='\e[0;36m'
cyanb='\e[46m'
white='\e[0;37m'
grey='\e[1;36m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
clear
echo -e ""
echo -e "  ${white}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "  \E[46;1;37m                   ◎ SYSTEM MENU ◎                          \E[0m"
echo -e  "  "
echo -e  "    $white[ 1 ]•${grey}CHANGE DNS"
echo -e  "    $white[ 2 ]•${grey}CHANGE PORT"
echo -e  "    $white[ 3 ]•${grey}ADD OR CHANGE DOMAIN"
echo -e  "    $white[ 4 ]•${grey}RENEW CERTIFICATE"
echo -e  "    $white[ 5 ]•${grey}BACKUP DATA"
echo -e  "    $white[ 6 ]•${grey}RESTORE DATA"
echo -e  "    $white[ 7 ]•${grey}WEBMIN MENU"
echo -e  "    $white[ 8 ]•${grey}CHECK BANDWIDTH"
echo -e  "    $white[ 9 ]•${grey}REBOOT SERVER"
echo -e  "  " 

echo -e  "    ${green}PRESS [ X ] TO EXIT MENU${NC} "
echo -e
echo -e "  \E[46;1;37m                  ◎ Moded By XoolVPN ◎                      \E[0m"
echo -e "  ${white}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
read -p  "                  PLEASE SELECT AN OPTION : " ssh
echo -e "\e[0m"
case $ssh in
	1)
	mdns
	;;
	2)
	change
	;;
	3)
	add-host
	;;
	4)
	cert
	;;
	5)
	backup
	;;
	6)
	restore
	;;
	7)
	webmin
	;;
	8)
	vnstat -d
	;;
	9)
	reboot
	;;
	x)
    menu
    ;;
	*)
	echo -e "Please enter an correct number"
	sleep 1
	clear
	mssh
	;;
	esac
