# 2026-07-19 14:05:50 by RouterOS 7.24rc2
# system id = iC5mqmpp94A
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
/interface vrrp
add connection-tracking-mode=active-active interface=ether3 name=vip \
    priority=200 remote-address=10.10.10.2 sync-connection-tracking=yes vrid=\
    5
/ip address
add address=192.168.10.200/24 interface=ether3 network=192.168.10.0
add address=192.168.10.254/24 interface=vip network=192.168.10.0
add address=10.10.10.1/30 interface=ether2 network=10.10.10.0
/ip dhcp-client
/ip dns
set servers=8.8.8.8
/ip firewall nat
add chain=srcnat action=masquerade out-interface=ether1
/ip route
add gateway=172.31.255.29
/system identity
set name=r1
