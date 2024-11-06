#!/bin/bash
CDN="https://raw.githubusercontent.com/sunuazizrahayu/VPN-setup/master/"
# ==================================================
# System version number
if [ "${EUID}" -ne 0 ]; then
  echo "You need to run this script as root"
  exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
  echo "OpenVZ is not supported"
  exit 1
fi
cd
clear


# init coloring
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
BRed='\e[1;31m'
BGreen='\e[1;32m'
BYellow='\e[1;33m'
BBlue='\e[1;34m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }

secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
print_success() {
  local message="$1"
  GREEN='\033[0;32m'
  NC='\033[0m' # No Color
  echo -e "[ ${GREEN}SUCCESS${NC} ] $message"
}

# Get Script Version
serverV=$( curl -sS "${CDN}VERSION"  )
echo $serverV > /opt/.ver


echo -e "$BYellow-----------------------------------"
echo -e "$BBlue VPN Setup Auto Installer $serverV   "
echo -e "$BYellow----------------------------------- $NC"

# Install
echo -e "[ ${BGreen}INFO${NC} ] Updating repository"
apt update >/dev/null 2>&1
echo -e "[ ${BGreen}INFO${NC} ] Install setup required package"
apt install wget curl screen -y >/dev/null 2>&1


localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
  echo "$localip $(hostname)" >> /etc/hosts
fi


# Check & Install linux headers
echo -e "[ ${BGreen}INFO${NC} ] Checking headers..."
REQUIRED_PKG="linux-headers-$(uname -r)"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG | grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  sleep 0.5
  echo -e "[ ${BRed}WARNING${NC} ] $REQUIRED_PKG not installed. Trying to install..."
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  apt update && apt install "$REQUIRED_PKG" -y
  if [ $? -eq 0 ]; then
    echo -e "[ ${BGreen}INFO${NC} ] $REQUIRED_PKG installed successfully."
  else
    echo -e "[ ${BBlue}NOTES${NC} ] Installation failed. Please do the following:"
    echo -e "[ ${BBlue}NOTES${NC} ] Run: apt update && apt upgrade"
    echo -e "[ ${BBlue}NOTES${NC} ] After upgrading, re-run this script."
    echo -e "[ ${BBlue}NOTES${NC} ] Press any key to exit."
    read -n 1 -s  # Menunggu pengguna menekan tombol apa saja
    clear
    exit 0
  fi
else
  echo -e "[ ${BGreen}INFO${NC} ] $REQUIRED_PKG is already installed."
  sleep 0.5
fi

ReqPKG="linux-headers-$(uname -r)"
if ! dpkg -s $ReqPKG  >/dev/null 2>&1; then
  rm /root/setup.sh >/dev/null 2>&1 
  exit
fi


start=$(date +%s)
# set localtime
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# disable ipv6
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1



echo -e "[ ${BGreen}INFO${NC} ] Preparing the install file"
#apt install git curl -y >/dev/null 2>&1
apt install python -y >/dev/null 2>&1
echo -e "[ ${BGreen}INFO${NC} ] Aight good ... installation file is ready"
sleep 0.5


echo -ne "[ ${BGreen}INFO${NC} ] Check permission : "
echo -e "$BGreen Permission Accepted!$NC"
sleep 2

mkdir -p /var/lib/ >/dev/null 2>&1
echo "IP=" >> /var/lib/ipvps.conf
echo ""



# Set required directory
##################################################
# remove old config
rm -rf setup.sh
rm -rf /etc/xray/domain
rm -rf /etc/v2ray/domain
rm -rf /etc/xray/scdomain
rm -rf /etc/v2ray/scdomain
rm -rf /var/lib/ipvps.conf

# create required directory & files
mkdir -p /etc/xray
mkdir -p /etc/v2ray
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/scdomain
touch /etc/v2ray/scdomain


# Setup VPS Domain
##################################################
clear
echo -e "$BYellow-----------------------------------"
echo -e "$BBlue SETUP DOMAIN VPS                    "
echo -e "$BYellow-----------------------------------"
echo -e "$BGreen 1. Use Domain Random / Gunakan Domain Random"
echo -e "$BGreen 2. Choose Your Own Domain / Gunakan Domain Sendiri"
echo -e "$BYellow-----------------------------------"
echo -ne "${BYellow}Pilih domain yang akan kamu pakai : ${NC}"
read -r dns
if test $dns -eq 1; then
  clear
  echo -e "$BYellow-----------------------------------"
  echo -e "$BBlue SETUP RANDOM DOMAIN                 "
  echo -e "$BYellow----------------------------------- $NC"
  wget -q -O cf.sh "${CDN}domain/cf.sh" >/dev/null 2>&1
  chmod +x cf.sh && ./cf.sh | tee /root/log-setup-domain.log
  print_success "Domain Random Done"
  rm -f cf.sh
elif test $dns -eq 2; then
  read -rp "Enter Your Domain : " dom
  echo "$dom" > /root/scdomain
	echo "$dom" > /etc/xray/scdomain
	echo "$dom" > /etc/xray/domain
	echo "$dom" > /etc/v2ray/domain
	echo "$dom" > /root/domain
  echo "IP=$dom" > /var/lib/ipvps.conf
else 
  echo "Not Found Argument"
  exit 1
fi
echo -e "${BGreen}Setup domain done!${NC}"
sleep 2
clear


# Install SSH OVPN
echo -e "\e[33m-----------------------------------\033[0m"
echo -e "$BGreen      Install SSH VPN                 $NC"
echo -e "\e[33m-----------------------------------\033[0m"
wget "${CDN}ssh/ssh-vpn.sh" && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
clear

# Install SSH WS
echo -e "\e[33m-----------------------------------\033[0m"
echo -e "$BGreen      Install SSH Websocket           $NC"
echo -e "\e[33m-----------------------------------\033[0m"
wget "${CDN}sshws/insshws.sh" && chmod +x insshws.sh && ./insshws.sh
clear

# Instal Xray
echo -e "\e[33m-----------------------------------\033[0m"
echo -e "$BGreen          Install XRAY              $NC"
echo -e "\e[33m-----------------------------------\033[0m"
wget "${CDN}xray/ins-xray.sh" && chmod +x ins-xray.sh && ./ins-xray.sh
clear

# Install VPN menu
echo -e "\e[33m-----------------------------------\033[0m"
echo -e "$BGreen         Setup VPN Menu             $NC"
echo -e "\e[33m-----------------------------------\033[0m"
wget -q "${CDN}menu/install.sh" && chmod +x install.sh && ./install.sh
rm install.sh
clear


# Check some files & directory
if [ -f "/root/log-install.txt" ]; then
  rm /root/log-install.txt > /dev/null 2>&1
fi
if [ -f "/etc/afak.conf" ]; then
  rm /etc/afak.conf > /dev/null 2>&1
fi
if [ ! -f "/etc/log-create-ssh.log" ]; then
  echo "Log SSH Account " > /etc/log-create-ssh.log
fi
if [ ! -f "/etc/log-create-vmess.log" ]; then
  echo "Log Vmess Account " > /etc/log-create-vmess.log
fi
if [ ! -f "/etc/log-create-vless.log" ]; then
  echo "Log Vless Account " > /etc/log-create-vless.log
fi
if [ ! -f "/etc/log-create-trojan.log" ]; then
  echo "Log Trojan Account " > /etc/log-create-trojan.log
fi
if [ ! -f "/etc/log-create-shadowsocks.log" ]; then
  echo "Log Shadowsocks Account " > /etc/log-create-shadowsocks.log
fi

# clean history
history -c


# Get Time
aureb=$(cat /home/re_otm)
b=11
if [ $aureb -gt $b ]; then
 gg="PM"
else
 gg="AM"
fi
curl -sS ipv4.icanhazip.com > /etc/myipvps
echo ""
echo "=================================================================="  | tee -a log-install.txt
echo "   VPN Setup Auto Installer $serverV by Kang Sunu                 "  | tee -a log-install.txt
echo "=================================================================="  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                  : 22"  | tee -a log-install.txt
echo "   - SSH Websocket            : 80" | tee -a log-install.txt
echo "   - SSH SSL Websocket        : 443" | tee -a log-install.txt
echo "   - Stunnel4                 : 222, 777" | tee -a log-install.txt
echo "   - Dropbear                 : 109, 143" | tee -a log-install.txt
echo "   - Badvpn                   : 7100-7900" | tee -a log-install.txt
echo "   - Nginx                    : 81" | tee -a log-install.txt
echo "   - Vmess WS TLS             : 443" | tee -a log-install.txt
echo "   - Vless WS TLS             : 443" | tee -a log-install.txt
echo "   - Trojan WS TLS            : 443" | tee -a log-install.txt
echo "   - Shadowsocks WS TLS       : 443" | tee -a log-install.txt
echo "   - Vmess WS none TLS        : 80" | tee -a log-install.txt
echo "   - Vless WS none TLS        : 80" | tee -a log-install.txt
echo "   - Trojan WS none TLS       : 80" | tee -a log-install.txt
echo "   - Shadowsocks WS none TLS  : 80" | tee -a log-install.txt
echo "   - Vmess gRPC               : 443" | tee -a log-install.txt
echo "   - Vless gRPC               : 443" | tee -a log-install.txt
echo "   - Trojan gRPC              : 443" | tee -a log-install.txt
echo "   - Shadowsocks gRPC         : 443" | tee -a log-install.txt
echo "==================================================================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt

# remove old installer script
rm /root/setup.sh >/dev/null 2>&1
rm /root/ssh-vpn.sh >/dev/null 2>&1
rm /root/insshws.sh >/dev/null 2>&1
rm /root/ins-xray.sh >/dev/null 2>&1


# reboot
echo -e ""
echo -ne "[ ${yell}WARNING${NC} ] reboot now ? (y/n)? "
read answer
if [ "$answer" == "${answer#[Yy]}" ] ;then
  exit 0
else
  reboot
fi
