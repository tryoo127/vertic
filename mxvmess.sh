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
echo ""
echo -e " ═════════════════════════════════════════════" 
echo -e "           ${green}XRAY VMESS${NC}                    " 
echo -e " ═════════════════════════════════════════════" 
echo -e " " 
echo -e "   [ 1 ] CREATE NEW USER"
echo -e "   [ 2 ] DELETE ACTIVE USER"
echo -e "   [ 3 ] EXTEND ACTIVE USER"
echo -e "   [ 4 ] CHECK USER LOGIN"
echo -e " " 
echo -e " ═════════════════════════════════════════════" 
echo -e "   ${green}[ 0 ] EXIT TO MENU${NC} "
echo -e " ═════════════════════════════════════════════" 
echo -e "\e[1;31m"
read -p "    Please select an option :  "  v2ray
echo -e "\e[0m"
case $v2ray in
    1)
    add-xvmess
    ;;
    2)
    del-xvmess
    ;;
    3)
    renew-xvmess
    ;;
    4)
    cek-xvmess
    ;;
    0)
    menu
    ;;
	*)
    echo -e "Please enter an correct number"
    sleep 1
    clear
    mxvmess
    ;;
    esac
