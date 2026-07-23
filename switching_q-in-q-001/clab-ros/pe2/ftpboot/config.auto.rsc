# 2026-07-23 23:10:40 by RouterOS 7.24rc2
# system id = nJfO4o8RamH
#
/interface bridge
add frame-types=admit-only-vlan-tagged name=DISTRIBUTION vlan-filtering=yes
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
/interface bonding
add mode=802.3ad name=lagg0 slaves=ether3,ether4 transmit-hash-policy=\
    layer-2-and-3
/interface bridge port
add bridge=DISTRIBUTION frame-types=admit-only-vlan-tagged interface=lagg0 \
    pvid=4094
add bridge=DISTRIBUTION interface=ether2 pvid=100 tag-stacking=yes
/interface bridge vlan
add bridge=DISTRIBUTION tagged=DISTRIBUTION,lagg0 untagged=ether2 vlan-ids=\
    100
/ip address
/ip dhcp-client
/system identity
set name=pe2