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
ssl="$(cat /etc/stunnel/stunnel.conf | grep -i accept | head -n 2 | cut -d= -f2 | sed 's/ //g' | tr '\n' ' ' | awk '{print $1}')"
ssl2="$(cat /etc/stunnel/stunnel.conf | grep -i accept | head -n 2 | cut -d= -f2 | sed 's/ //g' | tr '\n' ' ' | awk '{print $2}')"
echo -e "======================================"
echo -e ""
echo -e "     [ 1 ]  Change Port $ssl"
echo -e "     [ 2 ]  Change Port $ssl2"
echo -e "======================================"
echo -e "     [ 0 ]  Exit To Menu"
echo -e "======================================"
echo -e ""
read -p "     Select From Options [1-2 or 0] :  " prot
echo -e ""
case $prot in
1)
read -p "New Port Stunnel4: " stl
if [ -z $stl ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $stl)
if [[ -z $cek ]]; then
sed -i "s/$ssl/$stl/g" /etc/stunnel/stunnel.conf
sed -i "s/   - Stunnel4                : $ssl, $ssl2/   - Stunnel4                : $stl, $ssl2/g" /root/log-install.txt
/etc/init.d/stunnel4 restart > /dev/null
echo -e "\e[032;1mPort $stl modified successfully\e[0m"
else
echo "Port $stl is used"
fi
;;
2)
read -p "New Port Stunnel4: " stl
if [ -z $stl ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $stl)
if [[ -z $cek ]]; then
sed -i "s/$ssl2/$stl/g" /etc/stunnel/stunnel.conf
sed -i "s/   - Stunnel4                : $ssl, $ssl2/   - Stunnel4                : $ssl, $stl/g" /root/log-install.txt
/etc/init.d/stunnel4 restart > /dev/null
echo -e "\e[032;1mPort $stl modified successfully\e[0m"
else
echo "Port $stl is used"
fi
;;
0)
clear
menu
;;
*)
echo "Please enter an correct number"
sleep 1
clear
port-ssl
;;
esac
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
