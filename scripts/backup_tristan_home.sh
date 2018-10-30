#!/bin/sh

#Our temporary backups will be arhived in this folder
TMPBACKUP='/root/tmp/'
#Website to backup (used only for naming purposes)
#SITE='site.com'
NAME='tristan_home'
#Directory that will be archived and backed up
BACKUPDIR='/home/tristan'
#Remote Google Drive directory ID where the file will be uploaded
ID='1w-5Trz9NVuJR6waW4o6VcmzsokxZy_Si'

if [ ! -d "$TMPBACKUP" ]; then
	        mkdir $TMPBACKUP
	fi

	cd $TMPBACKUP
	#Archive the directory
	tar -zcf "$NAME-$(date '+%Y-%m-%d').tar.gz" $BACKUPDIR

	# upload to google drive and delete the source file
	drive upload "$NAME-$(date '+%Y-%m-%d').tar.gz" --parent $ID --delete
