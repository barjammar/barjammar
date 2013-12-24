#!/bin/bash
################################################################ 
# archive script 
################################################################ 
## Config
LOGFILE='/home/barry/archive.log'
SCR='/home/barry/Webcam_Pictures'

echo "###### Starting Archive Job #######" >> $LOGFILE
echo "archiveDirs.sh at $(date)" >> $LOGFILE
if [ ! -d $SCR/archive ]; then
	mkdir $SCR/archive
fi
find $SCR/. -type d -exec mv {} $SRC/archive/ \;
/home/barry/make_album.sh >> $LOGFILE
## done
echo "###### Finished Archive Job at $(date) ######" >> $LOGFILE
