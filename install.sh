#!/bin/bash
# System version number
if [ "${EUID}" -ne 0 ]; then
  echo "You need to run this script as root"
  exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
  echo "OpenVZ is not supported"
  exit 1
fi
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


# install
echo -e "[ ${BGreen}INFO${NC} ] Updating repository"
apt update >/dev/null 2>&1
echo -e "[ ${BGreen}INFO${NC} ] Install setup required package"
apt install wget curl screen -y >/dev/null 2>&1

# get script
wget https://raw.githubusercontent.com/sunuazizrahayu/VPN-setup/master/setup.sh -O setup.sh
chmod +x setup.sh
sed -i -e 's/\r$//' setup.sh
script -c "screen -S setup ./setup.sh"