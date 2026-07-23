# 2026-07-23 23:10:40 by RouterOS 7.24rc2
# system id = LNBRemORlBH
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
/interface vlan
add interface=ether2 name=VLAN5 vlan-id=5
add interface=ether2 name=VLAN100 vlan-id=100
/ip address
add address=192.168.5.1/24 interface=VLAN5 network=192.168.5.0
add address=192.168.100.1/24 interface=VLAN100 network=192.168.100.0
/ip dhcp-client
/system identity
set name=c1-r2