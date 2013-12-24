#!/bin/bash
################################################################ 
# archive script 
################################################################ 
## Config
LOGFILE='/home/barry/archive.log'
SCR='/home/barry/Webcam_Pictures'
DATE=`date --date "1 days ago" "+%A-%d-%m-%y"`

echo "###### Starting Archive Job #######" >> $LOGFILE
echo "archive.sh at $(date)" >> $LOGFILE
mkdir "$SCR/$DATE"
for i in `ls $SCR/*.jpeg`; do
	mv "$SCR/$i" "$SCR/$DATE/"
done
## done
echo "###### Finished Archive Job at $(date) ######" >> $LOGFILE
