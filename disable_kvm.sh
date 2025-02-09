#!/bin/bash

set -e

if [ "$(id -u)" != 0 ]; then echo "Run as root!"; exit 1; fi

sudo rmmod kvm_amd
sudo rmmod kvm
