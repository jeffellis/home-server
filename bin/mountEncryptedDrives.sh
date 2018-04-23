#!/bin/sh -x

KEY=$1

cryptsetup luksOpen --key-file ${KEY} /dev/disk/by-partlabel/SEA-5TB-02-01 SEA-5TB-02-01
mount /dev/mapper/SEA-5TB-02-01 /volume/rosewill-bay-1 

cryptsetup luksOpen --key-file ${KEY} /dev/disk/by-partlabel/SEA-5TB-01-01 SEA-5TB-01-01
mount /dev/mapper/SEA-5TB-02-01 /volume/rosewill-bay-8


# sudo cryptsetup luksAddKey /dev/sdX /root/keyfile 
