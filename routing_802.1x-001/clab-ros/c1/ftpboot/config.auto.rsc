# 2026-07-25 23:00:24 by RouterOS 7.24rc2
# system id = R7JQ2OdZWHM
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
/system script
add dont-require-permissions=no name=setmac owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    "/interface ethernet set ether2 mac-address=4C:5E:0C:AA:BB:01"
/ip address
/ip dhcp-client
add interface=ether2 name=client1
/system identity
set name=c1
/system scheduler
add !days name=macfix on-event=setmac policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup