#!/bin/bash

set -e

if [ "$(id -u)" != 0 ]; then echo "Run as root!"; exit 1; fi

for modfile in $(dirname $(modinfo -n vboxdrv))/*.ko.xz; do
  echo "Signing $modfile"
  f="$(basename "$modfile")"
  cd "$(dirname "$modfile")"
  unxz "$f"
  /usr/src/kernels/$(uname -r)/scripts/sign-file sha256 \
                                /root/signed-modules/MOK.priv \
                                /root/signed-modules/MOK.der "${f%.*}"
  xz -f "${f%.*}"
done

modprobe vboxdrv
