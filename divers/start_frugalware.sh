#!/bin/bash


# On CD
qemu-system-x86_64 -m 1024 -hda frugalware/frugalware.qcow2 -net user -net nic,model=rtl8139 -cdrom iso/fvbe-1.9rc2-basic-x86_64.iso -boot d

#echo -ne "Start virtual machine: frugalware\n"

#qemu-system-x86_64 -m 2048 -hda frugalware.qcow2 -net user -net nic,model=rtl8139

#exit 0
