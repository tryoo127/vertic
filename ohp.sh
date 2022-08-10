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
# Ohp Script
# ==========================================
MYIP=$(wget -qO- https://icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";

#Update Repository VPS
clear
apt update 
apt-get -y upgrade

#Masukkan port ohp
OHPSSH=8010
OHPOVPN=8000
#Masukkan port proxy
PROXYPORT=3128
#Masukkan port dropbear dan ovpn
SSHPORT=143
OVPNPORT=1194

# Download File Ohp
wget https://github.com/lfasmpao/open-http-puncher/releases/download/0.1/ohpserver-linux32.zip
unzip ohpserver-linux32.zip
chmod +x ohpserver
cp ohpserver /usr/local/bin/ohpserver
/bin/rm -rf ohpserver*

#Buat File OpenVPN TCP OHP
cat > /etc/openvpn/client-tcp-ohp.ovpn <<END
client
dev tun
proto tcp
setenv FRIENDLY_NAME "XoolVPN"
remote bug 1194
http-proxy xxxxxxxxx 8000
resolv-retry infinite
route-method exe
auth-user-pass
auth-nocache
nobind
persist-key
persist-tun
cipher none
ncp-disable
auth none
comp-lzo
verb 3

END

sed -i $MYIP2 /etc/openvpn/client-tcp-ohp.ovpn;

# masukkan certificatenya ke dalam config client TCP 1194
echo '<ca>' >> /etc/openvpn/client-tcp-ohp.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/client-tcp-ohp.ovpn
echo '</ca>' >> /etc/openvpn/client-tcp-ohp.ovpn
cp /etc/openvpn/client-tcp-ohp.ovpn /home/vps/public_html/client-tcp-ohp.ovpn
clear
cd

# Installing Service
# Dropbear OHP 
cat > /etc/systemd/system/dropbear-ohp.service << END
[Unit]]
Description=Dropbear OHP Service by XoolVPN
Documentation=https://t.me/none
After=network.target nss-lookup.target

[Service]
ExecStart=/usr/local/bin/ohpserver -port $OHPSSH -proxy $MYIP:$PROXYPORT -tunnel $MYIP:$SSHPORT
Restart=on-failure
LimitNOFILE=infinity

[Install]
WantedBy=multi-user.target
END

# OpenVPN OHP 
cat > /etc/systemd/system/openvpn-ohp.service << END
[Unit]]
Description=OpenVPN OHP Service by XoolVPN
Documentation=https://t.me/none
After=network.target nss-lookup.target

[Service]
ExecStart=/usr/local/bin/ohpserver -port $OHPOVPN -proxy $MYIP:$PROXYPORT -tunnel $MYIP:$OVPNPORT 
Restart=on-failure
LimitNOFILE=infinity

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable dropbear-ohp.service
systemctl start dropbear-ohp.service
systemctl restart dropbear-ohp.service
systemctl enable openvpn-ohp.service
systemctl start openvpn-ohp.service
systemctl restart openvpn-ohp.service
clear
cd
rm -f /root/ohp.sh
