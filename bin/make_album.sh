#!/bin/bash
################################################################ 
# make_album.sh
# This script is designed to create a web album using the perl
# album program.
################################################################ 
## Add in Config
HOMEDIR="/home/barry"
## Should not need to change these
LOGFILE=$HOMEDIR/album.log
CAMDIR=$HOMEDIR/Webcam_Pictures
echo "######### Starting Album Creation ###########" >> $LOGFILE
echo "Running cron-job to generate kangaroocam images at $(date)" >> $LOGFILE
album -theme=$CAMDIR/theme -hide_album=theme -sort=name -reverse_sort $CAMDIR 2>&1 >> $LOGFILE
echo "######### Finished Album Creation ###########" >> $LOGFILE
