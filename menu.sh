#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
blue='\e[0;34m'
cyan='\e[0;36m'
cyanb='\e[46m'
white='\e[0;37m'
grey='\e[1;36m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip)
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10)
DOMAIN=$(cat /etc/v2ray/domain)
IPVPS=$(curl -s ipinfo.io/ip)
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)

#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"

#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"

#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"

#Client Name/Expired
NAME=$(curl -sS https://raw.githubusercontent.com/tryoo127/access/main/ip | grep $IPVPS | awk '{print $2}')
EXP=$(curl -sS https://raw.githubusercontent.com/tryoo127/access/main/ip | grep $IPVPS | awk '{print $3}')
echo -e
echo -e "  \E[46;1;37m                  ◎ SERVER INFORMATION ◎                    \E[0m"
echo -e "  ${white}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e  "     * ${white}CLIENT NAME           : $NAME${NC}"
echo -e  "     * ${white}EXPIRED ON            : $EXP$NC"
echo -e  "     * ${white}SERVER ISP            : $ISP${NC}"
echo -e  "     * ${white}IP ADDRESS            : $MYIP${NC}"
echo -e  "     * ${white}REGION COUNTRY        : $WKT${NC}"
echo -e  "     * ${white}DOMAIN HOST           : $DOMAIN${NC}"

status="$(systemctl show squid.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "     * ${grey}SQUID                 : ${green}Service is Running"$NC""
else                                                                                    
echo -e "     * ${grey}SQUID              : SQUID Service is "$red"not running (Error)"$NC""      
fi

status="$(systemctl show nginx.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "     * ${grey}NGINX                 : ${green}Service is Running"$NC""
else                                                                                    
echo -e "     * ${grey}NGINX              : NGINX Service is "$red"not running (Error)"$NC""      
fi

status="$(systemctl show stunnel4.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "     * ${grey}STUNNEL4              : ${green}Service is Running"$NC""
else                                                                                    
echo -e "     * ${grey}STUNNEL4           : ${red}Service is "$red"NOT RUNNING (Error)"$NC""        
fi                                                                                

status="$(systemctl show dropbear.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "     * ${grey}DROPBEAR              : ${green}Service is Running"$NC""
else                                                                                    
echo -e "     * ${grey}DROPBEAR           : ${red}Service is "$red"NOT RUNNING (Error)"$NC""        
fi

status="$(systemctl show openvpn.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "     * ${grey}SSH & OPENVPN         : ${green}Service is Running"$NC""
else                                                                                    
echo -e "     * ${grey}SSH & OPENVPN       : ${grey}Service is "$red"NOT RUNNING (Error)"$NC""      
fi

status="$(systemctl show v2ray.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "     * ${grey}VMESS TLS             : ${green}Service is Running"$NC""
else                                                                                    
echo -e "     * ${grey}VMESS TLS            : VMESS TLS  Service is "$red"not running (Error)"$NC""      
fi

status="$(systemctl show v2ray@vless.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "     * ${grey}VLESS TLS             : ${green}Service is Running"$NC""
else                                                                                    
echo -e "     * ${grey}VLESS TLS            : VLESS TLS Service is "$red"not running (Error)"$NC""      
fi

status="$(systemctl show trojan --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "     * ${grey}TROJAN GFW            : ${green}Service is Running"$NC""
else                                                                                    
echo -e "     * ${grey}TROJAN GFW            : TROJAN GFW  Service is "$red"not running (Error)"$NC""      
fi

status="$(systemctl show v2ray@none.service --no-page)"                                 
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "     * ${grey}VMESS NONE TLS        : ${green}Service is Running"$NC""
else                                                                                    
echo -e "     * ${grey}VMESS NONE TLS      : VMESS NON TLS Service is "$red"not running (Error)"$NC""    
fi                                                                                      

status="$(systemctl show v2ray@vnone.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "     * ${grey}VLESS NONE TLS        : ${green}Service is Running"$NC""
else                                                                                    
echo -e "     * ${grey}VLESS NONE TLS      : VLESS NON TLS  Service is "$red"not running (Error)"$NC""      
fi

status="$(systemctl show xray@vless-direct --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "     * ${grey}XRAY VLESS XTLS       : ${green}Service is Running"$NC""
else                                                                                    
echo -e "     * ${grey}XRAY VLESS XTLS       : XRAY VLESS XTLS  Service is "$red"not running (Error)"$NC""
fi

status="$(systemctl show xray@vless-grpc --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "     * ${grey}XRAY VLESS GRPC       : ${green}Service is Running"$NC""
else                                                                                    
echo -e "     * ${grey}XRAY VLESS GRPC       : XRAY VLESS GRPC  Service is "$red"not running (Error)"$NC""      
fi

status="$(systemctl show wg-quick@wg0 --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "     * ${grey}WIREGUARD             : ${green}Service is Running"$NC""
else                                                                                    
echo -e "     * ${grey}WIREGUARD             : WIREGUARD Service is "$red"not running (Error)"$NC""         
fi

status="$(systemctl show ssrmu --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "     * ${grey}SHADOWSOCKS R         : ${green}Service is Running"$NC""
else                                                                                    
echo -e "     * ${grey}SHADOWSOCKS R         : SHADOWSOCKS R Service is "$red"not running (Error)"$NC""      
fi

status="$(systemctl show shadowsocks-libev.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e "     * ${grey}SHADOWSOCKS OBFS      : ${green}Service is Running"$NC""
else                                                                                    
echo -e "     * ${grey}SHADOWSOCKS OBFS      : SHADOWSOCKS OBFS Service is "$red"not running (Error)"$NC""
fi
echo -e "  ${white}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "\e[0m     * BANDWIDTH    TODAY       YESTERDAY     MONTH"
echo -e "\e[0m * BANDWIDTH     TODAY     YESTERDAY   MONTH"
echo -e "\e[1;36m * DOWNLOAD\e[0;32m      $dtoday     $dyest    $dmon\e[0m"
echo -e "\e[1;36m * UPLOAD\e[0;32m        $utoday     $uyest    $umon\e[0m"
echo -e "\e[1;36m * TOTAL\e[0m         $ttoday     $tyest    $tmon\e[0m "
echo -e "  ${white}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "  \E[46;1;37m                   ◎ VPN PANEL MENU ◎                       \E[0m"
echo -e
echo -e "     $white[ 1 ]•${grey}SSH OVPN" "          $white[ 6 ]•${grey}V2RAY CORE"

echo -e "     $white[ 2 ]•${grey}WIREGUARD" "         $white[ 7 ]•${grey}TROJAN GFW"

echo -e "     $white[ 3 ]•${grey}SHADOWSOCKS" "       $white[ 8 ]•${grey}CHECK DNS"

echo -e "     $white[ 4 ]•${grey}SHADOWSOCKSR" "      $white[ 9 ]•${grey}SYSTEM MENU"

echo -e "     $white[ 5 ]•${grey}XRAY CORE" "         $white[ 0 ]•${grey}EXIT MENU"
echo -e
echo -e "  \E[46;1;37m                  ◎ Moded By XoolVPN ◎                      \E[0m"
echo -e "  ${white}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
read -p  "                  SELECT OPTION FROM 1-0 : " menu
echo -e "\e[0m"
 case $menu in
   1)
   mssh
   ;;
   2)
   mwg
   ;;
   3)
   mss
   ;;
   4)
   mssr
   ;;
   5)
   mxraycore
   ;;
   6)
   mv2raycore
   ;;
   7)
   mtrojan
   ;;
   8)
   nf
   ;;
   9)
   msystem
   ;;
   0)
   exit
   menu
   ;;
   *)
   menu
   ;;
esac
