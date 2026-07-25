# 2026-07-25 23:38:21 by RouterOS 7.24rc2
# system id = LENGBwYSW9E
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
/system script
add dont-require-permissions=no name=setmac owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    "/interface ethernet set ether2 mac-address=4C:5E:0C:AA:BB:01"
/ip address
add address=192.168.100.2/24 interface=ether2 network=192.168.100.0
/ip dhcp-client
/system identity
set name=c1