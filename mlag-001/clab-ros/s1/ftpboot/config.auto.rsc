# 2026-07-19 10:31:06 by RouterOS 7.24rc2
# system id = o9MRQRLAfAK
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
/interface bonding
add mlag-id=10 mode=802.3ad name=lagg0 slaves=ether4 transmit-hash-policy=\
    layer-2-and-3
/interface bridge
add mlag-peer-port=ether3 name=bridge1 vlan-filtering=yes
/interface bridge port
add bridge=bridge1 frame-types=admit-only-vlan-tagged interface=ether3 pvid=\
    10
add bridge=bridge1 comment="hybrid port native-vlan 10" interface=lagg0 pvid=\
    10
add bridge=bridge1 frame-types=admit-only-untagged-and-priority-tagged \
    interface=ether2 pvid=10
/interface bridge vlan
add bridge=bridge1 tagged=ether3 untagged=ether2 vlan-ids=10
add bridge=bridge1 comment="ether3 peer port should always in here" tagged=\
    ether3,lagg0 vlan-ids=20
/ip address
/ip dhcp-client
/system identity
set name=s1