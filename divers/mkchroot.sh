#!/bin/bash

#function usage
#{
#   echo "Usage: mkchroot.sh -n chroot_name"
#}
#
#while [ "$1" != "" ]; do
#   case $1 in
#      -n | --name )
#         shift
#         CHROOTNAME=$1
#         ;;
#      -h | --help )
#         usage
#         exit
#         ;;
#      *)
#         usage
#         exit 1
#         ;;
#   esac
#   shift
#done

if [[ $1 == "" ]]; then
   CHROOTNAME=default
else
   CHROOTNAME=$1
fi

if [[ $2 == "" ]]; then
   DIST=stable
else
   DIST=$2
fi

CHROOTDIR=/srv/chroot
CHROOT=$CHROOTDIR/$CHROOTNAME

mkdir -p $CHROOT

debootstrap --arch amd64 --include=zsh,sudo $DIST $CHROOT http://ftp2.fr.debian.org/debian/

#cat >> /etc/fstab << EOF
#### ( $CHROOTNAME )
#/dev		$CHROOT/dev	auto	bind		0	0
#/dev/pts	$CHROOT/dev/pts	auto	bind		0	0
#proc		$CHROOT/proc	proc	defaults	0	0
#sysfs   	$CHROOT/sysfs   sysfs	defaults        0       0 
#EOF

cat > /etc/schroot/chroot.d/$CHROOTNAME << EOF
[$CHROOTNAME]
type=directory
description=$CHROOTNAME server
directory=$CHROOT
root-groups=root
root-users=root
users=jeff
profile=server
EOF


