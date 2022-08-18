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
echo -e "  ${white}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "  \E[46;1;37m                  ◎ XRAY VLESS ◎                            \E[0m"
echo -e " " 
echo -e  "    $white[ 1 ]•${grey}CREATE NEW USER"
echo -e  "    $white[ 2 ]•${grey}RENEW ACCOUNT USER"
echo -e  "    $white[ 3 ]•${grey}DELETE ACTIVE USER"
echo -e  "    $white[ 4 ]•${grey}CHECK USER LOGIN"
echo -e  "  " 
echo -e "  ${white}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "  \E[46;1;37m                  ◎ XRAY VMESS ◎                            \E[0m"
echo -e " " 
echo -e  "    $white[ 5 ]•${grey}CREATE NEW USER"
echo -e  "    $white[ 6 ]•${grey}RENEW ACCOUNT USER"
echo -e  "    $white[ 7 ]•${grey}DELETE ACTIVE USER"
echo -e  "    $white[ 8 ]•${grey}CHECK USER LOGIN"
echo -e  "  " 
echo -e  "    ${green}PRESS [ X ] TO EXIT MENU${NC} "
echo -e
echo -e "  \E[46;1;37m                  ◎ Moded By XoolVPN ◎                      \E[0m"
echo -e "  ${white}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
read -p  "                  PLEASE SELECT AN OPTION : " xraycore
echo -e "\e[0m"
case $xraycore in
    1)
	add-xvless
	;;
	2)
	renew-xvless
	;;
	3)
	del-xvless
	;;
	4)
	cek-xvless
	;;
	5)
	add-xvmess
	;;
	6)
	renew-xvmess
	;;
	7)
	del-xvmess
	;;
	8)
	cek-xvmess
    ;;
	x)
    clear
    menu
    ;;
    *)
   echo -e "ERROR!! Please Enter an Correct Number"
   sleep 1
   clear
   mxrayvlvm
   ;;
   esac
