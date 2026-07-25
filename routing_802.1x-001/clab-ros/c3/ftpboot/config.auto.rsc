# 2026-07-25 10:09:49 by RouterOS 7.24rc2
# system id = Qe+eVCToPrI
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
/ip address
/ip dhcp-client
/system identity
set name=c3