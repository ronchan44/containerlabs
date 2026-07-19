# 2026-07-19 10:31:06 by RouterOS 7.24rc2
# system id = JEAODVIld+E
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
/interface vrrp
add connection-tracking-mode=active-active interface=ether3 name=vip \
    priority=101 remote-address=10.10.10.1 sync-connection-tracking=yes vrid=\
    5
/ip address
add address=192.168.10.201/24 interface=ether3 network=192.168.10.0
add address=192.168.10.254/24 interface=vip network=192.168.10.0
add address=10.10.10.2/30 interface=ether2 network=10.10.10.0
/ip dhcp-client
/ip dns
set servers=8.8.8.8
/ip firewall nat
/ip route
add gateway=172.31.255.29
/system identity
set name=r2