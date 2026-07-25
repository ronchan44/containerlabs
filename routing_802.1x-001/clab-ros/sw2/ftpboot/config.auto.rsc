# 2026-07-25 23:00:24 by RouterOS 7.24rc2
# system id = gLvbnlGPwVC
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
add interface=DISTRIBUTION mtu=1496 name=VLAN20 vlan-id=20
add interface=DISTRIBUTION mtu=1496 name=VLAN30 vlan-id=30
add interface=DISTRIBUTION mtu=1496 name=VLAN40 vlan-id=40
add interface=DISTRIBUTION mtu=1496 name=VLAN100 vlan-id=100
/interface bonding
add mode=802.3ad name=lagg0 slaves=ether2,ether3 transmit-hash-policy=\
    layer-2-and-3
add mode=802.3ad name=lagg1 slaves=ether4,ether5 transmit-hash-policy=\
    layer-2-and-3
add mode=802.3ad name=lagg2 slaves=ether7,ether8 transmit-hash-policy=\
    layer-2-and-3
/ip pool
add name=dhcp_pool0 ranges=192.168.100.1-192.168.100.253
add name=dhcp_pool1 ranges=172.16.20.2-172.16.20.254
add name=dhcp_pool2 ranges=172.16.30.2-172.16.30.254
add name=dhcp_pool3 ranges=172.16.40.2-172.16.40.254
/ip dhcp-server
add address-pool=dhcp_pool0 interface=VLAN100 name=dhcp1
add address-pool=dhcp_pool1 interface=VLAN20 name=dhcp2
add address-pool=dhcp_pool2 interface=VLAN30 name=dhcp3
add address-pool=dhcp_pool3 interface=VLAN40 name=dhcp4
/interface bridge port
add bridge=DISTRIBUTION frame-types=admit-only-vlan-tagged interface=lagg0
add bridge=DISTRIBUTION frame-types=admit-only-vlan-tagged interface=lagg1
add bridge=DISTRIBUTION frame-types=admit-only-vlan-tagged interface=lagg2
add bridge=DISTRIBUTION interface=ether6 pvid=100
/interface bridge vlan
add bridge=DISTRIBUTION tagged=DISTRIBUTION,lagg0,lagg1,lagg2 untagged=ether6 \
    vlan-ids=100
add bridge=DISTRIBUTION tagged=DISTRIBUTION,lagg0,lagg1,lagg2,ether6 \
    vlan-ids=20,30,40
/ip address
add address=192.168.100.254/24 interface=VLAN100 network=192.168.100.0
add address=172.16.20.1/24 interface=VLAN20 network=172.16.20.0
add address=172.16.30.1/24 interface=VLAN30 network=172.16.30.0
add address=172.16.40.1/24 interface=VLAN40 network=172.16.40.0
/ip dhcp-client
/ip dhcp-server network
add address=172.16.20.0/24 gateway=172.16.20.1
add address=172.16.30.0/24 dns-server=8.8.8.8 gateway=172.16.30.1
add address=172.16.40.0/24 dns-server=8.8.8.8 gateway=172.16.40.1
add address=192.168.100.0/24 dns-server=8.8.8.8 gateway=192.168.100.254
/system identity
set name=sw2