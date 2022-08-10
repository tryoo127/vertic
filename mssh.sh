#!/bin/bash
clear
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
echo -e "  \E[46;1;37m                   ◎ SSH & OVPN MENU ◎                      \E[0m"
echo -e  "  "
echo -e  "    $white[ 1 ]•${grey}CREATE NEW USER"
echo -e  "    $white[ 2 ]•${grey}RENEW ACCOUNT ACTIVE"
echo -e  "    $white[ 3 ]•${grey}DELETE ACTIVE USER"
echo -e  "    $white[ 4 ]•${grey}CHECK USER LOGIN"
echo -e  "    $white[ 5 ]•${grey}LIST USER INFORMATION"
echo -e  "    $white[ 6 ]•${grey}DELETE USER EXPIRED"
echo -e  "    $white[ 7 ]•${grey}SET AUTO KILL LOGIN"
echo -e  "    $white[ 8 ]•${grey}DISPLAY USER MULTILOGIN"
echo -e  "    $white[ 9 ]•${grey}RESTART SERVICE"
echo -e  "  " 

echo -e  "    ${green}PRESS [ X ] TO EXIT MENU${NC} "
echo -e
echo -e "  \E[46;1;37m                  ◎ Moded By XoolVPN ◎                      \E[0m"
echo -e "  ${white}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
read -p  "                  PLEASE SELECT AN OPTION : " ssh
echo -e "\e[0m"
case $ssh in
	1)
	usernew
	;;
	2)
	renew
	;;
	3)
	hapus
	;;
	4)
	cek
	;;
	5)
	member
	;;
	6)
	delete
	;;
	7)
	autokill
	;;
	8)
	ceklim
	;;
	9)
	restart
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
