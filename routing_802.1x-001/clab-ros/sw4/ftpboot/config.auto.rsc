# 2026-07-25 06:32:07 by RouterOS 7.24rc2
# system id = YsVstsmvp0K
#
/interface bridge
add name=DISTRIBUTION vlan-filtering=yes
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
/interface bonding
add mode=802.3ad name=lagg0 slaves=ether2,ether3 transmit-hash-policy=\
    layer-2-and-3
/interface bridge port
add bridge=DISTRIBUTION frame-types=admit-only-vlan-tagged interface=lagg0 \
    pvid=4094
add bridge=DISTRIBUTION interface=ether4 pvid=10
/interface bridge vlan
add bridge=DISTRIBUTION tagged=DISTRIBUTION,lagg0 untagged=ether4 vlan-ids=10
add bridge=DISTRIBUTION tagged=DISTRIBUTION,lagg0 untagged=ether4 vlan-ids=\
    20,30,40
/ip address
/ip dhcp-client
/system identity
set name=sw4