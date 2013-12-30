#!/bin/bash
################################################################ 
# archive script 
################################################################ 
## Config
HOMEDIR="/home/barry"
LOGFILE="$HOMEDIR/archive.log"
SCR="$HOMEDIR/Webcam_Pictures"
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
	find $SCR/. -type d -name "1*" -exec mv {} $SRC/archive/ \;
fi
$HOMEDIR/make_album.sh >> $LOGFILE
## done
echo "###### Finished Archive Job at $(date) ######" >> $LOGFILE
