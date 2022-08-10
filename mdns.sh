#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl -sS https://raw.githubusercontent.com/tryoo127/access/main/ip | awk '{print $4}' | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "\e[0;32m            PERMISSION ACCEPTED!\e[0m"
else
clear
echo ""
rm -f setup.sh
echo -e "\e[1;31m              PERMISSION DENIED!\e[0m"
echo -e "\e[1;31m PLEASE CONTACT @XoolVPN TO REGISTER YOUR I.P\e[0m"
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

dns="$(cat /etc/resolvconf/resolv.conf.d/head)"
echo -e "DNS SERVER = $dns"
echo -e ""
echo -e "${green}MASUKKAN DNS BARU ATAU TEKAN CTL C UTK EXIT${NC}"
echo -e ""
read -p "NEW DNS SERVER: " dns2
if [ -z $dns2 ]; then
echo "Please Input Port"
exit 0
fi
echo -e ""
echo "nameserver $dns2" > /etc/resolv.conf
echo "nameserver $dns2" > /etc/resolvconf/resolv.conf.d/head

systemctl stop resolvconf.service
systemctl enable resolvconf.service
systemctl start resolvconf.service
clear
sleep 2
echo -e "============================================="
echo -e " ${green} PERTUKARAN DNS SERVER BERAJAYA${NC}"
echo -e "============================================="
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
