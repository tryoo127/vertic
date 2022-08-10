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
blue='\e[0;34m'
cyan='\e[0;36m'
cyanb='\e[46m'
white='\e[0;37m'
grey='\e[1;36m'
NC='\e[0m'
echo -e "============================================="
echo -e " ${green} RECERT V2RAY${NC}"
echo -e "============================================="
sleep 1
echo start
sleep 0.5
domain=$(cat /etc/v2ray/domain)
systemctl stop v2ray
systemctl stop v2ray@none
systemctl stop v2ray@vless.service
systemctl stop v2ray@vnone.service
systemctl stop trojan
systemctl stop nginx
sudo kill -9 $(sudo lsof -t -i:80)
~/.acme.sh/acme.sh --renew -d $domain --standalone -k ec-256 --force --ecc
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key --ecc
systemctl start v2ray
systemctl start v2ray@none
systemctl start v2ray@vless.service
systemctl start v2ray@vnone.service
systemctl start trojan
echo Done
sleep 0.5

echo -e "============================================="
echo -e " ${green} RECERT XRAY${NC}"
echo -e "============================================="
sleep 1
echo start
sleep 0.5
systemctl stop xray@v2ray-tls
systemctl stop xray@v2ray-nontls
systemctl stop xray@vless-tls
systemctl stop xray@vless-grpc
systemctl stop xray@vless-direct
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.ke --ecc
systemctl start xray@v2ray-tls
systemctl start xray@v2ray-nontls
systemctl start xray@vless-tls
systemctl start xray@vless-grpc
systemctl start xray@vless-direct
systemctl start nginx
echo Done
sleep 0.5
clear
echo -e "============================================="
echo -e " ${green} RECERT DOMAIN SELESAI${NC}"
echo -e "============================================="
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu