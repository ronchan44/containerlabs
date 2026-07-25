# 2026-07-25 06:32:07 by RouterOS 7.24rc2
# system id = Fesqq2VVaMK
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
/ip address
add address=192.168.10.2/24 interface=ether2 network=192.168.10.0
/ip dhcp-client
/system identity
set name=c1