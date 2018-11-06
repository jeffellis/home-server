#!/bin/sh -x

KEY=$1

EXT4_OPTIONS="data=writeback,noatime,barrier=0,journal_checksum"
BTRFS_OPTIONS="noatime,nodiratime"

# internal-bay-1
cryptsetup luksOpen --key-file ${KEY} /dev/disk/by-partlabel/WDG-3TB-01-01 WDG-3TB-01-01

# internal-bay-2
cryptsetup luksOpen --key-file ${KEY} /dev/disk/by-partlabel/TOS-3TB-02-01 TOS-3TB-02-01

# rosewill-bay-1
cryptsetup luksOpen --key-file ${KEY} /dev/disk/by-partlabel/SEA-5TB-02-01 SEA-5TB-02-01

# rosewill-bay-2
cryptsetup luksOpen --key-file ${KEY} /dev/disk/by-partlabel/SEA-8TB-01-01 SEA-8TB-01-01

# rosewill-bay-4
cryptsetup luksOpen --key-file ${KEY} /dev/disk/by-partlabel/SEA-8TB-02-01 SEA-8TB-02-01

# rosewill-bay-6
cryptsetup luksOpen --key-file ${KEY} /dev/disk/by-partlabel/TOS-3TB-01-01 TOS-3TB-01-01

# rosewill-bay-7
cryptsetup luksOpen --key-file ${KEY} /dev/disk/by-partlabel/SEA-5TB-03-01 SEA-5TB-03-01

# rosewill-bay-8
cryptsetup luksOpen --key-file ${KEY} /dev/disk/by-partlabel/SEA-5TB-01-01 SEA-5TB-01-01

# rosewill-bay-8
cryptsetup luksOpen --key-file ${KEY} /dev/disk/by-partlabel/HIT-1TB-02-01 HIT-1TB-02-01

# USB 8TB
cryptsetup luksOpen --key-file ${KEY} /dev/disk/by-partlabel/SEA-8TB-03-01 SEA-8TB-03-01

cryptsetup luksOpen --key-file ${KEY} /dev/disk/by-partlabel/SEA-1TB-01-01 SEA-1TB-01-01
#cryptsetup luksOpen --key-file ${KEY} /dev/disk/by-partlabel/SEA-15G-03-01 SEA-15G-03-01

# To add keyfile -- sudo cryptsetup luksAddKey /dev/sdX /root/keyfile 

mount /volume/internal-bay-1
mount /volume/internal-bay-2

mount /volume/rosewill-bay-1
mount /volume/rosewill-bay-6
mount /volume/rosewill-bay-7
mount /volume/rosewill-bay-8
mount /volume/SEA-8TB-01-01
mount /volume/SEA-8TB-02-01
mount /volume/SEA-8TB-03-01

mount /volume/HIT-1TB-02-01
mount /volume/SEA-1TB-01-01
#mount /volume/SEA-15G-03-01

mount /volume/union2
