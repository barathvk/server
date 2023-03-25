#! /usr/bin/env bash

export INTERFACE=$(ip route | grep default | cut -d ' ' -f 5)
export IP_ADDRESS=$(ip -4 addr show dev $INTERFACE | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

sudo cat maas-baremetal-k8s-tutorial/lxd.conf | lxd init --preseed
lxc network show lxdbr0
lxd waitready
sudo maas init region+rack --database-uri maas-test-db:/// --maas-url http://${IP_ADDRESS}:5240/MAAS