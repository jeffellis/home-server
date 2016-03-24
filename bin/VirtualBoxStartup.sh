#!/bin/sh

LOGDIR=/var/log/VirtualBox
VM="win10-news-02"
mkdir -p $LOGDIR

echo "Starting WindowsNews" >> ${LOGDIR}/${VM}
VBoxHeadless --startvm ${VM} > ${LOGDIR}/${VM} &>> ${LOGDIR}/${VM} & 
