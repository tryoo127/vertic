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
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
IP=$(wget -qO- icanhazip.com);
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
Login=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1
echo Ping Host
echo Cek Hak Akses...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Membuat Akun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Thank You For Using Our Services"
echo -e "SSH & OpenVPN Account Info"
echo -e "==============================="
echo -e "Username            : $Login "
echo -e "Password            : $Pass"
echo -e "Expired On          : $exp"
echo -e "==============================="
echo -e "Domain              : ${domain}"
echo -e "IP/Host             : $IP"
echo -e "OpenSSH             : 22"
echo -e "Dropbear            : 109, 143"
echo -e "Port SSH WS         : 2082"
echo -e "Port OVPN WS B      : 2095"
echo -e "Port OVPN OHP       : 8000"
echo -e "SSL/TLS             :$ssl"
echo -e "Port Squid          :$sqd"
echo -e "OpenVPN             : TCP $ovpn http://${MYIP}:81/client-tcp-1194.ovpn"
echo -e "OpenVPN             : UDP $ovpn2 http://${MYIP}:81/client-udp-2200.ovpn"
echo -e "OpenVPN             : SSL 442 http://${MYIP}:81/client-tcp-ssl.ovpn"
echo -e "OpenVPN OHP         : OHP 8000 http://${MYIP}:81/client-tcp-ohp.ovpn"
echo -e "badvpn              : 7100-7300"
echo -e "==============================="
echo -e "PAYLOAD SSH WS"
echo -e "GET / HTTP/1.1[crlf]Host:"
echo -e "${domain}[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "==============================="
read -n 1 -s -r -p "Press any key to back on menu"
menu
