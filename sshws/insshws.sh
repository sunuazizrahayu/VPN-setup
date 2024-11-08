#!/bin/bash
CDN="https://raw.githubusercontent.com/sunuazizrahayu/VPN-setup/master/"
# ==================================================
# Install required package
apt install python -y

#Install Script Websocket-SSH Python
wget -O /usr/local/bin/ws-dropbear "${CDN}sshws/ws-dropbear"
wget -O /usr/local/bin/ws-stunnel "${CDN}sshws/ws-stunnel"

#izin permision
chmod +x /usr/local/bin/ws-dropbear
chmod +x /usr/local/bin/ws-stunnel

#System Dropbear Websocket-SSH Python
#wget -O /etc/systemd/system/ws-dropbear.service "${CDN}sshws/service-wsdropbear" && chmod +x /etc/systemd/system/ws-dropbear.service
wget -O /etc/systemd/system/ws-dropbear.service "${CDN}sshws/ws-dropbear.service" && chmod +x /etc/systemd/system/ws-dropbear.service

#System SSL/TLS Websocket-SSH Python
wget -O /etc/systemd/system/ws-stunnel.service "${CDN}sshws/ws-stunnel.service" && chmod +x /etc/systemd/system/ws-stunnel.service


#restart service
systemctl daemon-reload

#Enable & Start & Restart ws-dropbear service
systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service

#Enable & Start & Restart ws-openssh service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service
