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
domain=$(cat /etc/v2ray/domain)
vl="$(cat ~/log-install.txt | grep -w "XRAY VLESS GRPC" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/vless-grpc.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
read -p "SNI (bug) : " sni
read -p "Subdomain : Press Enter If Only Using Hosts : " sub
dom=$sub$domain
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-vless-grpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/vless-grpc.json
vlesslink1="vless://${uuid}@${dom}:${vl}?mode=gun&security=tls&encryption=none&type=grpc&serviceName=GunService&sni=$sni#$user"
systemctl restart xray@vless-grpc
service cron restart
clear
echo -e "================================="
echo -e "            XRAY GRPC            " 
echo -e "================================="
echo -e "Remarks           : ${user}"
echo -e "Expired On        : $exp"
echo -e "Domain            : ${domain}"
echo -e "Port VLess        : $vl"
echo -e "ID                : ${uuid}"
echo -e "Alter ID          : 0"
echo -e "Mode              : Gun"
echo -e "Security          : TLS"
echo -e "Type              : grpc"
echo -e "Service Name      : GunService"
echo -e "SNI               : $sni"
echo -e "================================="
echo -e "Link VLess GRPC  : "
echo -e "${vlesslink1}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
