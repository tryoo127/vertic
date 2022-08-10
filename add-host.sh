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
echo -e "${green} PLEASE CONTACT @XoolVPN TO REGISTER YOUR I.P\e[0m"
sleep 5
exit 0
fi
clear
echo -e "MASUKKAN DOMAIN BARU ATAU TEKAN CTL C UTK EXIT"
echo -e ""
read -p "HOSTANME/DOMAIN: " host
rm -f /var/lib/premium-script/ipvps.conf
rm -f /etc/v2ray/domain
rm -f /etc/xray/domain
mkdir /etc/v2ray
mkdir /etc/xray
mkdir /var/lib/premium-script;
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "$host" >> /etc/v2ray/domain
echo "$host" >> /etc/xray/domain
clear
#recert
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
sleep 1
echo -e "============================================="
echo -e " ${green} RECERT V2RAY${NC}"
echo -e "============================================="
sleep 1
echo start
sleep 0.5
source /var/lib/premium-script/ipvps.conf
domain=$IP
systemctl stop v2ray
systemctl stop v2ray@none
systemctl stop v2ray@vless.service
systemctl stop v2ray@vnone.service
systemctl stop trojan
systemctl stop nginx
sudo kill -9 $(sudo lsof -t -i:80)

~/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key --ecc
systemctl start v2ray
systemctl start v2ray@none
systemctl start v2ray@vless.service
systemctl start v2ray@vnone.service
systemctl start trojan
systemctl start nginx
echo Done
sleep 0.5
clear

sleep 1
echo -e "============================================="
echo -e " ${green} RECERT XRAY${NC}"
echo -e "============================================="
sleep 1
echo start
sleep 0.5
source /var/lib/premium-script/ipvps.conf
domain=$IP
systemctl stop xray@v2ray-tls
systemctl stop xray@v2ray-nontls
systemctl stop xray@vless-tls
systemctl stop xray@vless-grpc
systemctl stop xray@vless-direct
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
systemctl start xray@v2ray-tls
systemctl start xray@v2ray-nontls
systemctl start xray@vless-tls
systemctl start xray@vless-grpc
systemctl start xray@vless-direct
echo Done
sleep 0.5
clear
echo -e "============================================="
echo -e " ${green} PERTUKARAN DOMAIN SELESAI${NC}"
echo -e "============================================="
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu