#!/usr/bin/env bash

sudo cat lxd.conf | lxd init --preseed
lxc network show lxdbr0
lxd waitready