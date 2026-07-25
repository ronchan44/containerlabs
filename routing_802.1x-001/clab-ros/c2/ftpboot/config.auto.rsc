# 2026-07-25 23:38:21 by RouterOS 7.24rc2
# system id = u3thx5427vD
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
/ip address
add address=192.168.100.3/24 interface=ether2 network=192.168.100.0
/system identity
set name=c2