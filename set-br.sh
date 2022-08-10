#!/bin/bash
curl https://rclone.org/install.sh | bash
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://raw.githubusercontent.com/tryoo127/vertic/main/rclone.conf"
git clone  https://github.com/magnific0/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account default
host smtp.gmail.com
port 587
auth on
user by@none
from djas
password coymgpdxsoqdlsed
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
cd /usr/bin
wget -O backup "https://raw.githubusercontent.com/tryoo127/vertic/main/backup.sh"
wget -O restore "https://raw.githubusercontent.com/tryoo127/vertic/main/restore.sh"
wget -O strt "https://raw.githubusercontent.com/tryoo127/vertic/main/strt.sh"
chmod +x backup
chmod +x restore
chmod +x strt
cd
rm -f /root/set-br.sh
