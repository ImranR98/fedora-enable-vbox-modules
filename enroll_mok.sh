#!/bin/bash

set -e

if [ "$(id -u)" != 0 ]; then echo "Run as root!"; exit 1; fi

openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/CN=VirtualBox/"
chmod 600 MOK.priv
mokutil --import MOK.der

echo "Reboot now and enroll MOK"
