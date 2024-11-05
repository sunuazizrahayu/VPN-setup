#!/bin/bash
CDN="https://raw.githubusercontent.com/sunuazizrahayu/VPN-setup/master/"
# ==================================================

cd /usr/bin
# menu
wget -O menu "${CDN}menu/menu.sh"
wget -O m-vmess "${CDN}menu/m-vmess.sh"
wget -O m-vless "${CDN}menu/m-vless.sh"
wget -O running "${CDN}menu/running.sh"
wget -O clearcache "${CDN}menu/clearcache.sh"
wget -O m-ssws "${CDN}menu/m-ssws.sh"
wget -O m-trojan "${CDN}menu/m-trojan.sh"

# menu ssh ovpn
wget -O m-sshovpn "${CDN}menu/m-sshovpn.sh"
wget -O usernew "${CDN}ssh/usernew.sh"
wget -O trial "${CDN}ssh/trial.sh"
wget -O renew "${CDN}ssh/renew.sh"
wget -O hapus "${CDN}ssh/hapus.sh"
wget -O cek "${CDN}ssh/cek.sh"
wget -O member "${CDN}ssh/member.sh"
wget -O delete "${CDN}ssh/delete.sh"
wget -O autokill "${CDN}ssh/autokill.sh"
wget -O ceklim "${CDN}ssh/ceklim.sh"
wget -O tendang "${CDN}ssh/tendang.sh"
wget -O sshws "${CDN}ssh/sshws.sh"

# menu system
wget -O m-system "${CDN}menu/m-system.sh"
wget -O m-domain "${CDN}menu/m-domain.sh"
wget -O add-host "${CDN}ssh/add-host.sh"
wget -O certv2ray "${CDN}xray/certv2ray.sh"
wget -O speedtest "${CDN}ssh/speedtest_cli.py"
wget -O auto-reboot "${CDN}menu/auto-reboot.sh"
wget -O restart "${CDN}menu/restart.sh"
wget -O bw "${CDN}menu/bw.sh"
wget -O m-tcp "${CDN}menu/tcp.sh"
wget -O xp "${CDN}ssh/xp.sh"
wget -O sshws "${CDN}ssh/sshws.sh"
wget -O m-dns "${CDN}menu/m-dns.sh"

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