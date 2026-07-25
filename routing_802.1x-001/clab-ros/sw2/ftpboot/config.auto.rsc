# 2026-07-25 06:32:07 by RouterOS 7.24rc2
# system id = kHZbU5bvUwD
#
/interface bridge
add name=DISTRIBUTION vlan-filtering=yes
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
set [ find default-name=ether6 ] disable-running-check=no
set [ find default-name=ether7 ] disable-running-check=no
set [ find default-name=ether8 ] disable-running-check=no
/interface vlan
add interface=DISTRIBUTION mtu=1496 name=VLAN10 vlan-id=10
/interface bonding
add mode=802.3ad name=lagg0 slaves=ether2,ether3 transmit-hash-policy=\
    layer-2-and-3
add mode=802.3ad name=lagg1 slaves=ether4,ether5 transmit-hash-policy=\
    layer-2-and-3
add mode=802.3ad name=lagg2 slaves=ether7,ether8 transmit-hash-policy=\
    layer-2-and-3
/interface bridge port
add bridge=DISTRIBUTION frame-types=admit-only-vlan-tagged interface=lagg0 \
    pvid=4094
add bridge=DISTRIBUTION frame-types=admit-only-vlan-tagged interface=lagg1 \
    pvid=4094
add bridge=DISTRIBUTION frame-types=admit-only-vlan-tagged interface=lagg2 \
    pvid=4094
add bridge=DISTRIBUTION interface=ether6 pvid=10
/interface bridge vlan
add bridge=DISTRIBUTION tagged=DISTRIBUTION,lagg0,lagg1,lagg2 untagged=ether6 \
    vlan-ids=10
add bridge=DISTRIBUTION tagged=DISTRIBUTION,lagg0,lagg1,lagg2,ether6 \
    vlan-ids=20,30,40
/ip address
add address=192.168.10.254/24 interface=VLAN10 network=192.168.10.0
/ip dns
set servers=8.8.8.8
/ip route
add gateway=172.31.255.29
/system identity
set name=sw2