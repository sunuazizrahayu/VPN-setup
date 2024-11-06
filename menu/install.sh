#!/bin/bash
CDN="https://raw.githubusercontent.com/sunuazizrahayu/VPN-setup/master/"
# ==================================================

download_with_status() {
  local output_file=$1
  local url=$2

  # Unduh file dan tangkap respons HTTP
  HTTP_RESPONSE=$(wget -qO "$output_file" "$url" --server-response 2>&1 | awk '/^  HTTP\// {print $2}' | tail -n1)
  echo "[ $HTTP_RESPONSE ] $output_file"
}

cd /usr/bin
# menu
download_with_status menu "${CDN}menu/menu.sh"
download_with_status m-vmess "${CDN}menu/m-vmess.sh"
download_with_status m-vless "${CDN}menu/m-vless.sh"
download_with_status running "${CDN}menu/running.sh"
download_with_status clearcache "${CDN}menu/clearcache.sh"
download_with_status m-ssws "${CDN}menu/m-ssws.sh"
download_with_status m-trojan "${CDN}menu/m-trojan.sh"

# menu ssh ovpn
download_with_status m-sshovpn "${CDN}menu/m-sshovpn.sh"
download_with_status usernew "${CDN}ssh/usernew.sh"
download_with_status trial "${CDN}ssh/trial.sh"
download_with_status renew "${CDN}ssh/renew.sh"
download_with_status hapus "${CDN}ssh/hapus.sh"
download_with_status cek "${CDN}ssh/cek.sh"
download_with_status member "${CDN}ssh/member.sh"
download_with_status delete "${CDN}ssh/delete.sh"
download_with_status autokill "${CDN}ssh/autokill.sh"
download_with_status ceklim "${CDN}ssh/ceklim.sh"
download_with_status tendang "${CDN}ssh/tendang.sh"
download_with_status sshws "${CDN}ssh/sshws.sh"

# menu system
download_with_status m-system "${CDN}menu/m-system.sh"
download_with_status m-domain "${CDN}menu/m-domain.sh"
download_with_status add-host "${CDN}ssh/add-host.sh"
download_with_status certv2ray "${CDN}xray/certv2ray.sh"
download_with_status speedtest "${CDN}ssh/speedtest_cli.py"
download_with_status auto-reboot "${CDN}menu/auto-reboot.sh"
download_with_status restart "${CDN}menu/restart.sh"
download_with_status bw "${CDN}menu/bw.sh"
download_with_status m-tcp "${CDN}menu/tcp.sh"
download_with_status xp "${CDN}ssh/xp.sh"
download_with_status sshws "${CDN}ssh/sshws.sh"
download_with_status m-dns "${CDN}menu/m-dns.sh"

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
