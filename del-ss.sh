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
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/shadowsocks-libev/akun.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " ==============================="
	echo "     No  Expired   User"
	grep -E "^### " "/etc/shadowsocks-libev/akun.conf" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Pilih salah satu[1]: " CLIENT_NUMBER
		else
			read -rp "Pilih salah satu [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
	# match the selected number to a client name
	CLIENT_NAME=$(grep -E "^### " "/etc/shadowsocks-libev/akun.conf" | cut -d ' ' -f 2-3 | sed -n "${CLIENT_NUMBER}"p)
	user=$(grep -E "^### " "/etc/shadowsocks-libev/akun.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
	exp=$(grep -E "^### " "/etc/shadowsocks-libev/akun.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)

	# remove [Peer] block matching $CLIENT_NAME
	sed -i "/^### $user $exp/,/^port_http/d" "/etc/shadowsocks-libev/akun.conf"
	# remove generated client file
service cron restart
systemctl disable shadowsocks-libev-server@$user-tls.service
	systemctl disable shadowsocks-libev-server@$user-http.service
	systemctl stop shadowsocks-libev-server@$user-tls.service
	systemctl stop shadowsocks-libev-server@$user-http.service
	rm -f "/etc/shadowsocks-libev/$user-tls.json"
	rm -f "/etc/shadowsocks-libev/$user-http.json"
clear
echo " SS OBFS Account Deleted Successfully"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp"
echo " =========================="
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu