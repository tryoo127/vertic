#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip)
IZIN=$( curl -sS https://raw.githubusercontent.com/tryoo127/access/main/ip | awk '{print $4}' | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "\e[0;32m            PERMISSION ACCEPTED!\e[0m"
else
rm -f setup.sh
echo -e "\e[1;31m              PERMISSION DENIED!\e[0m"
echo -e "${green} PLEASE CONTACT @XoolVPN TO REGISTER YOUR I.P\e[0m"
sleep 5
exit 0
fi
clear
red='\e[1;31m'
green='\e[0;32m'
blue='\e[0;34m'
cyan='\e[0;36m'
cyanb='\e[46m'
white='\e[0;37m'
grey='\e[1;36m'
NC='\e[0m'
echo -e ""
echo -e "  ${white}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "  \E[46;1;37m                   ◎ CHANGE PORT ◎                          \E[0m"
echo -e  "  "
echo -e  "    $white[ 1 ]•${grey}PORT STUNNEL4"
echo -e  "    $white[ 2 ]•${grey}PORT OPENVPN"
echo -e  "    $white[ 3 ]•${grey}PORT SQUID"
echo -e  "    $white[ 4 ]•${grey}PORT WIREGUARD"
echo -e  "    $white[ 5 ]•${grey}PORT V2RAY VMESS"
echo -e  "    $white[ 6 ]•${grey}PORT V2RAY VLESS"
echo -e  "    $white[ 7 ]•${grey}PORT TROJAN GFW"
echo -e  "    $white[ 8 ]•${grey}PORT XRAY XTLS"
echo -e  "    $white[ 9 ]•${grey}PORT XRAY GRPC"
echo -e  "  " 

echo -e  "    ${green}PRESS [ X ] TO EXIT MENU${NC} "
echo -e
echo -e "  \E[46;1;37m                  ◎ Moded By XoolVPN ◎                      \E[0m"
echo -e "  ${white}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
read -p  "                  PLEASE SELECT AN OPTION : " port
echo -e "\e[0m"
case $port in
1)
port-ssl
;;
2)
port-ovpn
;;
3)
port-squid
;;
4)
port-wg
;;
5)
port-ws
;;
6)
port-vless
;;
7)
port-tr
;;
8)
port-xtls
;;
9)
port-grpc
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
sleep 1
clear
change
;;
esac
