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
echo -e "  \E[46;1;37m                  ◎ XRAY XTLS ◎                             \E[0m"
echo -e " " 
echo -e  "    $white[ 1 ]•${grey}CREATE NEW USER"
echo -e  "    $white[ 2 ]•${grey}RENEW ACCOUNT USER"
echo -e  "    $white[ 3 ]•${grey}DELETE ACTIVE USER"
echo -e  "    $white[ 4 ]•${grey}CHECK USER LOGIN"
echo -e  "  " 
echo -e "  ${white}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "  \E[46;1;37m                  ◎ XRAY VLESS GRPC ◎                       \E[0m"
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
	add-xtls
	;;
	2)
	renew-xtls
	;;
	3)
	del-xtls
	;;
	4)
	cek-xtls
	;;
	5)
	add-grpc
	;;
	6)
	renew-grpc
	;;
	7)
	del-grpc
	;;
	8)
	cek-grpc
    ;;
	x)
    clear
    menu
    ;;
    *)
   echo -e "ERROR!! Please Enter an Correct Number"
   sleep 1
   clear
   mxraycore
   ;;
   esac
