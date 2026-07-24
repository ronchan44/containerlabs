# 2026-07-24 12:31:53 by RouterOS 7.24rc2
# system id = boZJGySKTyN
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
/ip address
add address=10.10.10.2/30 interface=ether2 network=10.10.10.0
/ip dhcp-client
/ip route
add gateway=10.10.10.1
/system identity
set name=svr1