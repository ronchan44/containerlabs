# 2026-07-24 08:12:01 by RouterOS 7.24rc2
# system id = g8PxHTzw3zA
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
/ip address
/ip dhcp-client
/system identity
set name=c2-r2