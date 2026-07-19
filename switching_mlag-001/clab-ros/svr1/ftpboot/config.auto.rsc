# 2026-07-19 14:05:50 by RouterOS 7.24rc2
# system id = a7gwKC0KwyC
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
/interface bonding
add mode=802.3ad name=lagg0 slaves=ether2,ether3 transmit-hash-policy=\
    layer-2-and-3
/interface vlan
add interface=lagg0 mtu=1496 name=vlan10 vlan-id=10
/ip address
add address=192.168.10.1/24 interface=lagg0 network=192.168.10.0
/ip dhcp-client
/ip dns
set servers=8.8.8.8
/ip route
add gateway=192.168.10.254
/system identity
set name=svr1