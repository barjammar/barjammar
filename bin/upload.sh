#!/bin/bash
################################################################ 
# upload.sh
# This script will upload the latest webcam photos from gingin
# to bajama perth server. It will then create a web album.
################################################################ 
## Add in Config
LOGFILE='/home/barry/transfer.log'
HOST='bajama.mine.nu'
TARGETFOLDER='/home/barry/Webcam_Pictures/'
SOURCEFOLDER='/home/barry/Webcam_Pictures/'

# Startup script
echo "###### Starting Tranfer Job #######" >> $LOGFILE
echo "Upload.sh at $(date)" >> $LOGFILE
## Step 1 - copy the capture log file
echo "## First copy the capture log ..." >> $LOGFILE
cp capture-log.txt $SOURCEFOLDER
## Step 2 - Covert the file names to be pretty timestamps
echo "## Covert all file names to better date stamps ..." >> $LOGFILE
for i in `ls $SOURCEFOLDER/camorama*`; do
	EPOCH=`echo $i | cut -d "-" -f2 | cut -d "." -f1` 
	DATE=`date -d @$EPOCH "+%y-%m-%d_%A`
	echo $DATE
	mv "$i" "$SOURCEFOLDER/$DATE.jpeg"
done
## Step 3 - RSYNC files to bajama 
echo "## Start RSYNC job to move files from here to bajama ..." >> $LOGFILE
rsync -avz --remove-source-files --log-file=$LOGFILE --stats -e ssh $SOURCEFOLDER $HOST:$TARGETFOLDER  

## Step 4 - Create the web album 
echo "## Create the album ..." >> $LOGFILE
ssh $HOST "/home/barry/make_album.sh" >> $LOGFILE

## All done
echo "###### Finished Tranfer Job at $(date) ######" >> $LOGFILE
