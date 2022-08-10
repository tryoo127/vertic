#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
cyan='\e[0;36m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl -sS https://raw.githubusercontent.com/tryoo127/access/main/ip | awk '{print $4}' | grep $MYIP )
if [ $MYIP = $IZIN ]; then
clear
echo -e "${green}            PERMISSION ACCEPTED!${NC}"
sleep 3
else
clear
echo ""
rm -f setup.sh
echo -e "${red}              PERMISSION DENIED!${NC}"
echo -e "${green} PLEASE CONTACT @XoolVPN TO REGISTER YOUR I.P${NC}"
sleep 7
exit 0
fi
clear

#Install Update
echo -e "============================================="
echo -e "          AUTOSCRIPT-FULL (V1.0) BY @XoolVPN "
echo -e "============================================="
apt -y update 
apt install -y bzip2 gzip coreutils screen curl
sleep 2
clear

# Disable IPv6
echo -e "============================================="
echo -e "              DISABLE IPV6 "
echo -e "============================================="
sleep 2
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
sysctl -w net.ipv6.conf.lo.disable_ipv6=1
echo -e "net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf
sleep 2
clear

# Subdomain Settings
echo -e "============================================="
echo -e "           ADD DOMAIN / SUBDOMAIN "
echo -e "============================================="
sleep 2
mkdir /etc/xray
mkdir /etc/v2ray
mkdir /var/lib/premium-script;
clear
echo -e ""
echo -e  " ENTER YOUR DOMAIN / SUBDOMAIN "
read -rp " RECOMMENDED (SUBDOMAIN) : " -e host
ip=$(wget -qO- ipv4.icanhazip.com)
host_ip=$(ping "${host}" -c 1 | sed '1{s/[^(]*(//;s/).*//;q}')
if [[ ${host_ip} == "${ip}" ]]; then
	echo -e ""
	echo -e " ${green}HOST/DOMAIN MATCHED..INSTALLATION WILL CONTINUE${NC}"
	echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
    echo "$host" >> /etc/v2ray/domain
    echo "$host" >> /etc/xray/domain
    echo "$host" > /root/domain
	sleep 2
	clear
else
	echo -e " ${green}HOST/DOMAIN NOT MATCHED..INSTALLATION WILL TERMINATED${NC}"
	echo -e ""
    rm -f setup.sh
    exit 1
fi
sleep 1

#install v2ray
echo -e "============================================="
echo -e "             INSTALLING V2RAY "
echo -e "============================================="
sleep 2
wget https://raw.githubusercontent.com/tryoo127/vertic/main/ins-vt.sh && chmod +x ins-vt.sh && screen -S v2ray ./ins-vt.sh
sleep 2
clear

#install Xray
echo -e "============================================="
echo -e "              INSTALLING XRAY "
echo -e "============================================="
sleep 2
wget https://raw.githubusercontent.com/tryoo127/vertic/main/install-xray.sh && chmod +x install-xray.sh && screen -S v2ray ./install-xray.sh
sleep 2
clear

#install ssh ovpn
echo -e "============================================="
echo -e "           INSTALLING SSH & OVPN "
echo -e "============================================="
sleep 2
wget https://raw.githubusercontent.com/tryoo127/vertic/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
sleep 2
clear

#install ssr
echo -e "============================================="
echo -e "           INSTALLING SHADOWSOCKS "
echo -e "============================================="
sleep 2
wget https://raw.githubusercontent.com/tryoo127/vertic/main/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
wget https://raw.githubusercontent.com/tryoo127/vertic/main/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
sleep 2
clear

#install wg
echo -e "============================================="
echo -e "            INSTALLING WIREGUARD "
echo -e "============================================="
sleep 2
wget https://raw.githubusercontent.com/tryoo127/vertic/main/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
sleep 2
clear


#install ohp
echo -e "============================================="
echo -e "             INSTALLING OHP "
echo -e "============================================="
sleep 2
wget https://raw.githubusercontent.com/tryoo127/vertic/main/ohp.sh && chmod +x ohp.sh && ./ohp.sh
sleep 2
clear

#install backup
echo -e "============================================="
echo -e "             INSTALLING BACKUP "
echo -e "============================================="
sleep 2
wget https://raw.githubusercontent.com/tryoo127/vertic/main/set-br.sh && chmod +x set-br.sh && ./set-br.sh
sleep 2
clear

rm -f /root/ssh-vpn.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-vt.sh
rm -f /root/install-xray.sh
rm -f /root/ohp.sh
rm -f /root/set-br.sh

#install resolv
apt install resolvconf
systemctl start resolvconf.service
systemctl enable resolvconf.service
echo 'nameserver 8.8.8.8' > /etc/resolvconf/resolv.conf.d/head
echo 'nameserver 8.8.8.8' > /etc/resolv.conf
systemctl restart resolvconf.service

echo "1.1" > /home/ver
echo "menu" >> .profile
clear
echo -e "============================================="
echo -e "       INSTALLATION HAS BEEN COMPLETED "
echo -e "============================================="
sleep 2
clear
echo ""
echo "=================== XoolVPN AUTOSCRIPT-FULL (V1.0) ===================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt
echo "   - Openvpn OHP             : 8000"  | tee -a log-install.txt
echo "   - Stunnel4                : 444, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - Dropbear OHP            : 8010"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - Trojan                  : 9443"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - Shadowsocks OBFS TLS    : 2443-2543"  | tee -a log-install.txt
echo "   - Shadowsocks HTTP        : 3443-3543"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 5443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 6443"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 7443"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 8443"  | tee -a log-install.txt
echo "   - XRAY VLESS XTLS         : 6769"  | tee -a log-install.txt
echo "   - XRAY VLESS GRPC         : 6969"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/MALAYSIA (GMT +8)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +8" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "=================== XoolVPN AUTOSCRIPT-FULL (V1.0) ===================" | tee -a log-install.txt
echo ""
sleep 3
rm -f setup.sh
read -n 1 -r -s -p $'PRESS ANY KEY TO REBOOT...\n';reboot
