#!/bin/sh

LOGDIR=/var/log/VirtualBox

mkdir -p $LOGDIR

echo "Starting WindowsNews" >> ${LOGDIR}/WindowsNews
VBoxHeadless --startvm Windows-XP-News > ${LOGDIR}/WindowsNews &>> ${LOGDIR}/WindowsNews & 
