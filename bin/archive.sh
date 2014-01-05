#!/bin/bash
################################################################ 
# archive.sh script 
# This script is designed to be run nightly by CRON and to
# archive images first into a daily directory. Secondly this
# script will archive all images into an archive directory
# every Sunday.
################################################################ 
## Config
HOMEDIR='/home/barry'
## Should not need to modify below
LOGFILE='$HOMEDIR/archive.log'
SCR='$HOMEDIR/Webcam_Pictures'
## This are internal variables
DATE=`date --date "1 days ago" "+%y-%m-%d-%A"`
DAYOFWEEK=`date +%u`

echo "###### Starting Archive Job #######" >> $LOGFILE
echo "archive.sh at $(date)" >> $LOGFILE
mkdir "$SCR/$DATE"
for i in `ls $SCR/*.jpeg`; do
	mv "$i" "$SCR/$DATE/"
done
# On Sunday we archive all of the week
if [ $DAYOFWEEK eq '7' ]; then
	if [ ! -d $SCR/archive ]; then
		mkdir $SCR/archive
	fi
	find $SCR/. -type d -name "^1*" -exec mv {} $SRC/archive/ \;
fi
$HOMEDIR/make_album.sh >> $LOGFILE
## done
echo "###### Finished Archive Job at $(date) ######" >> $LOGFILE
