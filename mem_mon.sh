#!/bin/bash -ex

MEM_LOG_FILE=/tmp/mem.usage.log
MAXSIZE=50000
while true
do
   /usr/bin/free -m    >> $MEM_LOG_FILE
   sleep 5
   FILESIZE=$(stat -c%s "$MEM_LOG_FILE")
   if  (( FILESIZE  > MAXSIZE  )) ; then
      >$MEM_LOG_FILE
   fi
done

