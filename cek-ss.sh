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
echo "-------------------------------";
echo "---=[ SS - OBFS User Login ]=---";
echo "-------------------------------";
echo ""
data=( `cat /etc/shadowsocks-libev/akun.conf | grep '^###' | cut -d ' ' -f 2`);
x=1
echo "-------------------------------";
echo " User | TLS"
echo "-------------------------------";
for akun in "${data[@]}"
do
port=$(cat /etc/shadowsocks-libev/akun.conf | grep '^port_tls' | cut -d ' ' -f 2 | tr '\n' ' ' | awk '{print $'"$x"'}')
jum=$(netstat -anp | grep ESTABLISHED | grep obfs-server | cut -d ':' -f 2 | grep -w $port | awk '{print $2}' | sort | uniq | nl)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
echo " $akun - $port"
echo "$jum";
echo "-------------------------------"
fi
x=$(( "$x" + 1 ))
done
data=( `cat /etc/shadowsocks-libev/akun.conf | grep '^###' | cut -d ' ' -f 2`);
x=1
echo ""
echo "-------------------------------";
echo " User |  HTTP"
echo "-------------------------------";
for akun in "${data[@]}"
do
port=$(cat /etc/shadowsocks-libev/akun.conf | grep '^port_http' | cut -d ' ' -f 2 | tr '\n' ' ' | awk '{print $'"$x"'}')
jum=$(netstat -anp | grep ESTABLISHED | grep obfs-server | cut -d ':' -f 2 | grep -w $port | awk '{print $2}' | sort | uniq | nl)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
echo " $akun - $port"
echo "$jum";
echo "-------------------------------"
fi
x=$(( "$x" + 1 ))
done
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu