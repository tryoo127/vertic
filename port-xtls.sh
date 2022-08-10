#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip)
IZIN=$( curl -sS https://raw.githubusercontent.com/tryoo127/access/main/ip | awk '{print $4}' | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "\e[0;32m            PERMISSION ACCEPTED!\e[0m"
else
rm -f setup.sh
echo -e "\e[1;31m              PERMISSION DENIED!\e[0m"
echo -e "\e[1;31m PLEASE CONTACT @XoolVPN TO REGISTER YOUR I.P\e[0m"
sleep 5
exit 0
fi
clear
red='\e[1;31m'
green='\e[0;32m'
cyan='\e[0;36m'
NC='\e[0m'
direct="$(cat ~/log-install.txt | grep -w "XRAY VLESS XTLS" | cut -d: -f2|sed 's/ //g')"
echo -e "      Change Port $direct"
read -p "New Port XRAY VLESS XTLS: " direct1
if [ -z $direct1 ]; then
echo "Please Input Port"
exit 0
fi

cek=$(netstat -nutlp | grep -w $direct1)
if [[ -z $cek ]]; then
sed -i "s/$direct/$direct1/g" /etc/xray/vless-direct.json
sed -i "s/- XRAY VLESS XTLS         : $direct/- XRAY VLESS XTLS         : $direct1/g" /root/log-install.txt
systemctl stop xray@vless-direct > /dev/null
systemctl enable xray@vless-direct > /dev/null
systemctl start xray@vless-direct > /dev/null

echo -e "\e[032;1mPort $direct1 modified successfully\e[0m"
else
echo "Port $direct1 is used"
fi
read -n 1 -s -r -p "Press any key to back on menu"
menu