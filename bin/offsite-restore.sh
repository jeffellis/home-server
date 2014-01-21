#!/bin/sh

export SRCDRIVE=/disks/backup
export SRC=${SRCDRIVE}/offsite-backup
export DEST=/

if [ ! -e ${SRCDRIVE}/offsite-backup-disk ]
then
	echo "No backup disk present at ${SRC}"
	exit 1
fi

RSYNC='/usr/bin/rsync'
RSYNC_OPTS='-avhHl'

${RSYNC} ${RSYNC_OPTS} ${SRC} /disks/md1/music 
${RSYNC} ${RSYNC_OPTS} ${SRC} /disks/md1/photos
${RSYNC} ${RSYNC_OPTS} ${SRC} /disks/md1/audio-books
${RSYNC} ${RSYNC_OPTS} ${SRC} /disks/md1/itunes
${RSYNC} ${RSYNC_OPTS} ${SRC} /disks/md1/software
${RSYNC} ${RSYNC_OPTS} ${SRC} /disks/md1/VirtualBox
${RSYNC} ${RSYNC_OPTS} ${SRC} /disks/md1/backuppc
${RSYNC} ${RSYNC_OPTS} ${SRC} /disks/md1/videos
