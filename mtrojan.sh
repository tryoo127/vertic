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
echo -e "  \E[46;1;37m                   ◎ TROJAN GFW ◎                           \E[0m"
echo -e " " 
echo -e  "    $white[ 1 ]•${grey}CREATE NEW USER"
echo -e  "    $white[ 2 ]•${grey}RENEW ACCOUNT USER"
echo -e  "    $white[ 3 ]•${grey}DELETE ACTIVE USER"
echo -e  "    $white[ 4 ]•${grey}CHECK USER LOGIN"
echo -e  "  " 
echo -e  "    ${green}PRESS [ X ] TO EXIT MENU${NC} "
echo -e
echo -e "  \E[46;1;37m                  ◎ Moded By XoolVPN ◎                      \E[0m"
echo -e "  ${white}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
read -p  "                  PLEASE SELECT AN OPTION : " trojan
echo -e "\e[0m"
case $trojan in
      1)
      add-tr
      ;;
      2)
      renew-tr
      ;;
      3)
      del-tr
      ;;
      4)
      cek-tr
      ;;
      x)
      menu
      ;;
      *)
      echo -e "Please enter an correct number"
      sleep 1
      clear
      mtrojan
      ;;
  esac
