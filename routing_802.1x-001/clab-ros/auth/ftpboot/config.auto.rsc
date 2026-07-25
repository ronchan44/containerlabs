# 2026-07-25 06:32:07 by RouterOS 7.24rc2
# system id = 4YcdKD2oL0D
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
/ip address
add address=192.168.10.1/24 interface=ether2 network=192.168.10.0
/ip dns
set servers=8.8.8.8
/ip route
add gateway=172.31.255.29
/system identity
set name=auth