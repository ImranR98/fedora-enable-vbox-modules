fedora-enable-vbox-modules
--------------------------
Install VirtualBox kernel modules on Fedora (may work with other distros)

Instructions
------------
1. Run enroll_mok.sh
2. Reboot and enroll MOK on boot
3. Run sign-virtual-box.sh (this needs to be re-run whenever the kernel is updated)
4. If VBox complains about KVM, run disable_kvm.sh
