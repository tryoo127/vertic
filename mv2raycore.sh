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
echo -e "  \E[46;1;37m                  ◎ V2RAY VMESS ◎                           \E[0m"
echo -e " " 
echo -e  "    $white[ 1 ]•${grey}CREATE NEW USER"
echo -e  "    $white[ 2 ]•${grey}RENEW ACCOUNT USER"
echo -e  "    $white[ 3 ]•${grey}DELETE ACTIVE USER"
echo -e  "    $white[ 4 ]•${grey}CHECK USER LOGIN"
echo -e  "  " 
echo -e "  ${white}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "  \E[46;1;37m                  ◎ V2RAY VLESS ◎                           \E[0m"
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
read -p  "                  PLEASE SELECT AN OPTION : " v2raycore
echo -e "\e[0m"
case $v2raycore in
    1)
    add-ws
    ;;
    2)
    renew-ws
    ;;
    3)
    del-ws
    ;;
    4)
    cek-ws
    ;;
    5)
    add-vless
    ;;
    6)
    renew-vless
    ;;
    7)
    del-vless
    ;;
    8)
    cek-vless
    ;;
	x)
    sleep 0.5
    clear
    menu
    ;;
    *)
   echo -e "ERROR!! Please Enter an Correct Number"
   sleep 1
   clear
   mv2raycore
   ;;
   esac
