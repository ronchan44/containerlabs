# 2026-07-24 12:31:53 by RouterOS 7.24rc2
# system id = gEPtsg9qOeB
#
/interface bridge
add name=DISTRIBUTION
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
/interface bridge port
add bridge=DISTRIBUTION interface=ether2
add bridge=DISTRIBUTION interface=ether3
/ip address
/ip dhcp-client
/system identity
set name=c1-sw