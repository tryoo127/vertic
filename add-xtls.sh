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
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi

# // Vless
vless1="$( cat /etc/xray/vless-direct.json | grep -w port | awk '{print $2}' | sed 's/,//g' )"

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/vless-direct.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`

# // Input To Server
sed -i '/#XRay$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "xtls-rprx-direct","email": "'""$user""'"' /etc/xray/vless-direct.json

vless_direct="vless://${uuid}@${domain}:${vless1}?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=bug.com#$user"

# // Restarting Service
systemctl stop xray@vless-direct
systemctl disable xray@vless-direct
systemctl enable xray@vless-direct
systemctl start xray@vless-direct
systemctl restart xray@vless-direct


clear
echo -e ""
echo -e "==========-XRAYS VLESS XTLS-=========="
echo -e "Remarks        : ${user}"
echo -e "Expired On     : $exp"
echo -e "Domain         : ${domain}"
echo -e "Port Direct    : $vless1"
echo -e "id             : ${uuid}"
echo -e "path           : /xray"
echo -e "================================="
echo -e "Link Direct    : ${vless_direct}"
echo -e ""
echo -e "================================="
echo -e "Gantikan bug.com dengan BUG anda"
echo -e "================================="
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
