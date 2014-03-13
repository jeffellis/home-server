#!/bin/sh

LOGDIR=/var/log/VirtualBox
VM="winxp-news"
mkdir -p $LOGDIR

echo "Starting WindowsNews" >> ${LOGDIR}/${VM}
VBoxHeadless --startvm ${VM} > ${LOGDIR}/${VM} &>> ${LOGDIR}/${VM} & 
