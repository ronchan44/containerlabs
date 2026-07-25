# 2026-07-25 09:38:37 by RouterOS 7.24rc2
# system id = +PBJmH/TXiK
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
/ip address
/ip dhcp-client
/system identity
set name=c3