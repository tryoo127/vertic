#!/bin/bash
cd
MYIP=$(curl -sS ipv4.icanhazip.com)
NameUser=$(curl -sS https://raw.githubusercontent.com/tryoo127/access/main/ip | grep $MYIP | awk '{print $2}')

cekdata=$(curl -sS https://raw.githubusercontent.com/tryoo127/user-backup-db/main/$NameUser/$NameUser.zip | grep 404 | awk '{print $1}' | cut -d: -f1)

green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }

[[ "$cekdata" = "404" ]] && {
    red "Data not found / you never backup"
    exit 0
} || {
    green "Data found for username $NameUser"
}

echo -e "[ ${green}INFO${NC} ] • Restore Data..."
read -rp "Password File: " -e InputPass
echo -e "[ ${green}INFO${NC} ] • Downloading data.."
[[ ! -d /root/backup ]] && mkdir -p /root/backup
wget -q -O /root/backup/backup.zip "https://raw.githubusercontent.com/tryoo127/user-backup-db/main/$NameUser/$NameUser.zip" &>/dev/null
echo -e "[ ${green}INFO${NC} ] • Getting your data..."
unzip -P $InputPass /root/backup/backup.zip &>/dev/null
echo -e "[ ${green}INFO${NC} ] • Starting to restore data..."
rm -f /root/backup/backup.zip &>/dev/null
sleep 1
cd /root/backup
echo -e "[ ${green}INFO${NC} ] • Restoring passwd data..."
sleep 1
cp /root/backup/passwd /etc/ &>/dev/null
echo -e "[ ${green}INFO${NC} ] • Restoring group data..."
sleep 1
cp /root/backup/group /etc/ &>/dev/null
echo -e "[ ${green}INFO${NC} ] • Restoring shadow data..."
sleep 1
cp /root/backup/shadow /etc/ &>/dev/null
echo -e "[ ${green}INFO${NC} ] • Restoring gshadow data..."
sleep 1
cp /root/backup/passwd1 /etc/ipsec.d/passwd &>/dev/null
echo -e "[ ${green}INFO${NC} ] • Restoring ss.conf data..."
sleep 1
cp /root/backup/ss.conf /etc/shadowsocks-libev/ss.conf &>/dev/null
echo -e "[ ${green}INFO${NC} ] • Restoring admin data..."
sleep 1
cd /root/backup
cp passwd /etc/
cp group /etc/
cp shadow /etc/
cp gshadow /etc/
cp -r wireguard /etc/
cp ss.conf /etc/shadowsocks-libev/ss.conf
cp -r premium-script /var/lib/
cp -r trojan /etc/
cp -r v2ray /etc/
cp -r shadowsocksr /usr/local/
cp -r public_html /home/vps/
cp -r xray /etc/
rm -rf /root/backup &>/dev/null
echo -e "[ ${green}INFO${NC} ] • Done..."
sleep 1
rm -f /root/backup/backup.zip &>/dev/null
echo
read -n 1 -s -r -p "Press any key to back on menu"
menu
