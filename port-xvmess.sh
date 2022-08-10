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
tls="$(cat ~/log-install.txt | grep -w "XRAY VMESS TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "XRAY VMESS NON TLS" | cut -d: -f2|sed 's/ //g')"
echo -e "======================================"
echo -e "      Change Port XRAY Vmess"
echo -e ""
echo -e "     [ 1 ]  Change Port XRay VMESS TLS $tls"
echo -e "     [ 2 ]  Change Port XRay VMESS NON TLS $none"
echo -e "======================================"
echo -e "     [ 0 ]  Exit"
echo -e "======================================"
echo -e ""
read -p "     Select From Options [1-3 or 0] :  " prot
echo -e ""
case $prot in
1)
read -p "New Port XRAY VMESS TLS: " tls1
if [ -z $tls1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $tls1)
if [[ -z $cek ]]; then
sed -i "s/$tls/$tls1/g" /etc/xray/v2ray-tls.json
sed -i "s/- XRAY VMESS TLS          : $tls/- XRAY VMESS TLS          : $tls1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $tls -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $tls -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tls1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tls1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl stop xray@v2ray-tls > /dev/null
systemctl enable xray@v2ray-tls > /dev/null
systemctl start xray@v2ray-tls > /dev/null
systemctl restart xray@v2ray-tls > /dev/null
echo -e "\e[032;1mPort $tls1 modified successfully\e[0m"
else
echo "Port $tls1 is used"
fi
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
;;
2)
echo "Input Only 2 Character (eg : 69)"
read -p "New Port XRAY VMESS NON TLS: " none1
if [ -z $none1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $none1)
if [[ -z $cek ]]; then
sed -i "s/$none/$none1/g" /etc/xray/v2ray-nontls.json
sed -i "s/- XRAY VMESS NON TLS      : $none/- XRAY VMESS NON TLS      : $none1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $none -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $none -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $none1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $none1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl stop xray@v2ray-nontls > /dev/null
systemctl enable xray@v2ray-nontls > /dev/null
systemctl start xray@v2ray-nontls > /dev/null
systemctl restart xray@v2ray-nontls > /dev/null
echo -e "\e[032;1mPort $none1 modified successfully\e[0m"
else
echo "Port $none1 is used"
fi
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
;;
0)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
