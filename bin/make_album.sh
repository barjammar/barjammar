#!/bin/bash
# recommended way to write the cron details
LOGFILE=/home/barry/album.log
CAMDIR=/home/barry/Webcam_Pictures
echo "######### Starting Album Creation ###########" >> $LOGFILE
echo "Running cron-job to generate kangaroocam images at $(date)" >> $LOGFILE
album -theme=$CAMDIR/theme -sort=name -reverse_sort $CAMDIR 2>&1 >> $LOGFILE
echo "######### Finished Album Creation ###########" >> $LOGFILE
