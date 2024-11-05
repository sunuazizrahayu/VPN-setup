#!/bin/bash
CDN="https://raw.githubusercontent.com/sunuazizrahayu/VPN-setup/master/"
# ==================================================

cd /usr/bin
# menu
wget -qO menu "${CDN}menu/menu.sh"
wget -qO m-vmess "${CDN}menu/m-vmess.sh"
wget -qO m-vless "${CDN}menu/m-vless.sh"
wget -qO running "${CDN}menu/running.sh"
wget -qO clearcache "${CDN}menu/clearcache.sh"
wget -qO m-ssws "${CDN}menu/m-ssws.sh"
wget -qO m-trojan "${CDN}menu/m-trojan.sh"

# menu ssh ovpn
wget -qO m-sshovpn "${CDN}menu/m-sshovpn.sh"
wget -qO usernew "${CDN}ssh/usernew.sh"
wget -qO trial "${CDN}ssh/trial.sh"
wget -qO renew "${CDN}ssh/renew.sh"
wget -qO hapus "${CDN}ssh/hapus.sh"
wget -qO cek "${CDN}ssh/cek.sh"
wget -qO member "${CDN}ssh/member.sh"
wget -qO delete "${CDN}ssh/delete.sh"
wget -qO autokill "${CDN}ssh/autokill.sh"
wget -qO ceklim "${CDN}ssh/ceklim.sh"
wget -qO tendang "${CDN}ssh/tendang.sh"
wget -qO sshws "${CDN}ssh/sshws.sh"

# menu system
wget -qO m-system "${CDN}menu/m-system.sh"
wget -qO m-domain "${CDN}menu/m-domain.sh"
wget -qO add-host "${CDN}ssh/add-host.sh"
wget -qO certv2ray "${CDN}xray/certv2ray.sh"
wget -qO speedtest "${CDN}ssh/speedtest_cli.py"
wget -qO auto-reboot "${CDN}menu/auto-reboot.sh"
wget -qO restart "${CDN}menu/restart.sh"
wget -qO bw "${CDN}menu/bw.sh"
wget -qO m-tcp "${CDN}menu/tcp.sh"
wget -qO xp "${CDN}ssh/xp.sh"
wget -qO sshws "${CDN}ssh/sshws.sh"
wget -qO m-dns "${CDN}menu/m-dns.sh"

chmod +x menu
chmod +x m-vmess
chmod +x m-vless
chmod +x running
chmod +x clearcache
chmod +x m-ssws
chmod +x m-trojan

chmod +x m-sshovpn
chmod +x usernew
chmod +x trial
chmod +x renew
chmod +x hapus
chmod +x cek
chmod +x member
chmod +x delete
chmod +x autokill
chmod +x ceklim
chmod +x tendang
chmod +x sshws

chmod +x m-system
chmod +x m-domain
chmod +x add-host
chmod +x certv2ray
chmod +x speedtest
chmod +x auto-reboot
chmod +x restart
chmod +x bw
chmod +x m-tcp
chmod +x xp
chmod +x sshws
chmod +x m-dns
cd