# 2026-07-25 09:38:36 by RouterOS 7.24rc2
# system id = 2wznik2Cp7F
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
/ip address
/ip dhcp-client
/system identity
set name=c2