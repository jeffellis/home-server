#!/bin/sh

DESTDRIVE=/volume/backup
PASSWORD=$FS_ENCRYPT_PASSWORD
VOLNAME='WD3TB_BACKUP'
DEVNAME=$1

if [ -z "$1" ]
then
	echo "Usage: ${0} <device for backup>"
	echo "Example: ${0} /dev/sde1"
	exit 1
fi

DEST=${DESTDRIVE}/offsite-backup
SRC=/export

DATE=`date`
echo "Starting backup at ${DATE}"

# Mount the encrypted drive
echo $PASSWORD | cryptsetup luksOpen ${DEVNAME} ${VOLNAME}
mount /dev/mapper/${VOLNAME} ${DESTDRIVE}

if [ ! -e ${DESTDRIVE}/offsite-backup-disk ]
then
	echo "No backup disk present at ${DEST}"
	exit 1
fi

service netatalk stop

mkdir -p ${DEST}

RSYNC='/usr/bin/rsync'
RSYNC_OPTS='-avhHl --delete'

${RSYNC} ${RSYNC_OPTS} /etc ${DEST}
${RSYNC} ${RSYNC_OPTS} ${SRC}/AppleTimeCapsule/ ${DEST}/AppleTimeCapsule
${RSYNC} ${RSYNC_OPTS} ${SRC}/audio-books/ ${DEST}/audio-books
${RSYNC} ${RSYNC_OPTS} ${SRC}/backups/ ${DEST}/backups
${RSYNC} ${RSYNC_OPTS} ${SRC}/itunes/ ${DEST}/itunes
${RSYNC} ${RSYNC_OPTS} ${SRC}/jeff/ ${DEST}/jeff
${RSYNC} ${RSYNC_OPTS} ${SRC}/music/ ${DEST}/music
${RSYNC} ${RSYNC_OPTS} ${SRC}/photos/ ${DEST}/photos
${RSYNC} ${RSYNC_OPTS} ${SRC}/software/ ${DEST}/software
${RSYNC} ${RSYNC_OPTS} ${SRC}/videos/ ${DEST}/videos
#${RSYNC} ${RSYNC_OPTS} ${SRC}/VirtualBox/ ${DEST}/VirtualBox

${RSYNC} ${RSYNC_OPTS} ${SRC}/movies/ /volume/media-backup/movies

df -h ${DESTDRIVE}
# Unmount and close the encrypted drive
umount ${DESTDRIVE}
cryptsetup luksClose ${VOLNAME}

service netatalk start

DATE=`date`
echo "Finished backup to ${VOLNAME} at ${DATE}"
exit 0

