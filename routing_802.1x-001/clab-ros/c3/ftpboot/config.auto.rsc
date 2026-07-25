# 2026-07-25 23:00:24 by RouterOS 7.24rc2
# system id = sf7LIJi4zKG
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
/ip address
/ip dhcp-client
add interface=ether2 name=client1
/system identity
set name=c3