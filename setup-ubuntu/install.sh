#!/usr/bin/env bash

sudo snap install --channel=latest/stable lxd
sudo snap refresh --channel=latest/stable lxd
sudo snap install jq
sudo snap install maas
sudo snap install maas-test-db