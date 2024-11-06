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

download_with_status_chmod() {
  local output_file=$1
  local url=$2

  # Unduh file dan tangkap respons HTTP
  HTTP_RESPONSE=$(wget -qO "$output_file" "$url" --server-response 2>&1 | awk '/^  HTTP\// {print $2}' | tail -n1)

  # set chmod
  # Jika HTTP_RESPONSE adalah 200, maka ubah izin file
  if [[ "$HTTP_RESPONSE" == "200" ]]; then
    chmod +x "$output_file"
    echo "[ $HTTP_RESPONSE ] $output_file - Permission set to executable"
  else
    echo "[ $HTTP_RESPONSE ] $output_file - Download failed"
  fi
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


# X-Ray Menu
###############################
# vmess
download_with_status_chmod add-ws "${CDN}xray/add-ws.sh"
download_with_status_chmod trialvmess "${CDN}xray/trialvmess.sh"
download_with_status_chmod renew-ws "${CDN}xray/renew-ws.sh"
download_with_status_chmod del-ws "${CDN}xray/del-ws.sh"
download_with_status_chmod cek-ws "${CDN}xray/cek-ws.sh"

# vless
download_with_status_chmod add-vless "${CDN}xray/add-vless.sh"
download_with_status_chmod trialvless "${CDN}xray/trialvless.sh"
download_with_status_chmod renew-vless "${CDN}xray/renew-vless.sh"
download_with_status_chmod del-vless "${CDN}xray/del-vless.sh"
download_with_status_chmod cek-vless "${CDN}xray/cek-vless.sh"

# trojan
download_with_status_chmod add-tr "${CDN}xray/add-tr.sh"
download_with_status_chmod trialtrojan "${CDN}xray/trialtrojan.sh"
download_with_status_chmod del-tr "${CDN}xray/del-tr.sh"
download_with_status_chmod renew-tr "${CDN}xray/renew-tr.sh"
download_with_status_chmod cek-tr "${CDN}xray/cek-tr.sh"

# shadowsocks
download_with_status_chmod add-ssws "${CDN}xray/add-ssws.sh"
download_with_status_chmod trialssws "${CDN}xray/trialssws.sh"
download_with_status_chmod del-ssws "${CDN}xray/del-ssws.sh"
download_with_status_chmod renew-ssws "${CDN}xray/renew-ssws.sh"
