#!/bin/sh

export SRCDRIVE=$1
export SRC=${SRCDRIVE}/offsite-backup
export UNION1=/volume/union1

if [ ! -e ${SRCDRIVE}/offsite-backup-disk ]
then
	echo "No backup disk present at ${SRC}"
	exit 1
fi

RSYNC='/usr/bin/rsync'
RSYNC_OPTS='-avhHl'

${RSYNC} ${RSYNC_OPTS} ${SRC}/audio-books/ ${UNION1}/audio-books
${RSYNC} ${RSYNC_OPTS} ${SRC}/itunes/ ${UNION1}/itunes
#${RSYNC} ${RSYNC_OPTS} ${SRC}/music/ ${UNION1}/music 
${RSYNC} ${RSYNC_OPTS} ${SRC}/photos/ ${UNION1}/photos
${RSYNC} ${RSYNC_OPTS} ${SRC}/software/ ${UNION1}/software
${RSYNC} ${RSYNC_OPTS} ${SRC}/videos/ ${UNION1}/videos
