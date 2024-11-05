# VPN Setup
VPN Setup is auto installer to install any VPN service

---
<p> 
<h2 align="center"> Supported Linux Distribution</h2>
<p align="center"><img src="https://d33wubrfki0l68.cloudfront.net/5911c43be3b1da526ed609e9c55783d9d0f6b066/9858b/assets/img/debian-ubuntu-hover.png"></p> 
<p align="center"><img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%209&message=Stretch&color=purple"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%2010&message=Buster&color=purple">  <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2018&message=Lts&color=red"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2020&message=Lts&color=red">
</p>

<p align="center"><img src="https://img.shields.io/badge/Service-SSH_Over_Websocket-success.svg">  <img src="https://img.shields.io/badge/Service-SSH_Dropbear-success.svg">  <img src="https://img.shields.io/badge/Service-Stunnel4-success.svg">  <img src="https://img.shields.io/badge/Service-Fail2Ban-brightgreen">  <p align="center"><img src="https://img.shields.io/badge/Service-XRAY-success.svg">  <img src="https://img.shields.io/badge/Service-XRAY_Websocket_TLS-success.svg">  <img src="https://img.shields.io/badge/Service-XRAY_VLESS_VMESS-success.svg">  <img src="https://img.shields.io/badge/Service-XRAY_gRPC_VLESS_VMESS-success.svg">  <img src="https://img.shields.io/badge/Service-XRAY_TROJAN-success.svg">  <img src="https://img.shields.io/badge/Service-Trojan_Go-success.svg">  <img src= "https://img.shields.io/badge/Service-Shadowsocks-success.svg">  <img src="https://wangchujiang.com/sb/status/stable.svg">
  
# Diperlukan
- DOMAIN (WAJIB)/RANDOM dari Script
- NOTE domain dari script hanya dilakukan 1x saat proses install untuk mengurangi spam DOMAIN yang sering gonta ganti
- Untuk mengubah Domain di menu setelah install menggunakan domain sendiri bukan dari script lagi OK
- DEBIAN 9/10
- Ubuntu 18/20 LTS
- CPU MIN 1 CORE
- RAM 1GB
- Rekomendasi Ubuntu 18 


# Setting Cloudflare bagi yang punya Domain sendiri, kamu bisa cek di folder [image](https://github.com/givpn/AutoScriptXray/tree/master/image) untuk tampilan setting lainnya
- SSL/TLS : FULL
- SSL/TLS Recommender : OFF
- GRPC : ON
- WEBSOCKET : ON
- Always Use HTTPS : OFF
- UNDER ATTACK MODE : OFF


# Pointing
![Pointing](https://raw.githubusercontent.com/givpn/AutoScriptXray/master/image/pointing.png)

## Service & Port:
- SSH Websocket : 80
- SSH SSL Websocket : 443
- Stunnel4 : 222,777
- Vmess WS TLS : 443
- Vless WS TLS : 443
- Trojan WS TLS : 443
- Shadowsocks WS TLS : 443
- Vmess WS none TLS : 80
- Vless WS none TLS : 80
- Trojan WS none TLS : 80
- Shadowsocks WS none TLS : 80
- Vmess gRPC : 443
- Vless gRPC : 443
- Trojan gRPC : 443
- Shadowsocks gRPC : 443

  
## Fitur
- Speedtest VPS by [Ookla](https://speedtest.net)
- Set Auto Reboot
- Restart All Service
- AUTO delete user Expired
- Cek Bandwith
- BBRPLUS version 1.4.0 by [Chikage0o0](https://github.com/Chikage0o0/Linux-NetSpeed/blob/master/tcp.sh)
- DNS CHANGER
- DLL
  
# Menu
![Service Status](https://raw.githubusercontent.com/givpn/AutoScriptXray/master/image/menu.png)

# Service Status
![Service Status](https://raw.githubusercontent.com/givpn/AutoScriptXray/master/image/service.png)

# PERHATIAN perlu masuk sebagai root
- Step 1
```
sudo su
```
- Step 2 INSTALL, NOTE jika sudah root langsung COPAS link dibawah ini saja ya
```
wget https://raw.githubusercontent.com/sunuazizrahayu/VPN-setup/master/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh
```

# Buat root di VPS bagi kamu yang login ke server masih menggunakan username yang bukan root
- Step 1
```
sudo su
```
- Step 2
```
apt update && apt install wget -y && wget -qO- -O rootvps.sh https://raw.githubusercontent.com/givpn/rootvps/master/rootvps.sh && bash rootvps.sh
  
```

# Hubungi saya jika ada yang perlu ditanyakan
# Telegram
[![Telegram-chat](https://img.shields.io/badge/Chat-Telegram-blue)](https://t.me/givpn/)
[![Telegram-grup](https://img.shields.io/badge/Grup-Telegram-blue)](https://t.me/givpn_grup)

# Belikan saya kopi
[![Saweria donate button](https://img.shields.io/badge/Donate-Saweria-red)](https://saweria.co/givpn11)
[![Ko-fi donate button](https://img.shields.io/badge/Donate-Ko--fi-red)](https://ko-fi.com/givpn11)
[![PayPal donate button](https://img.shields.io/badge/Donate-PayPal-blue)](https://paypal.me/givpn11)
  
# PERHATIAN BACA SECARA SEKSAMA
- DILARANG DIPERJUAL BELIKAN KARENA SAYA MENDAPATKAN SECARA GRATIS DARI INTERNET
- GUNAKAN SECARA BIJAK
- NONTON UNYIL DOSA TANGGUNG SENDIRI YA
# PESAN AKHIR
- TERIMAKASIH SUDAH MELUANGKAN WAKTU UNTUK MEMBACA DAN MAAF BILA ADA KATA-KATA YANG TIDAK SEMPURNA
- KARENA SAYA JUGA MANUSIA YANG TIDAK LUPUT DARI KESALAHAN

# LICENSI CAP BOTOL BEKAS
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

<p align="center">
  <a><img src="https://img.shields.io/badge/givpn-AutoScriptXray%202023-blue" style="max-width:200%;">
    </p>
