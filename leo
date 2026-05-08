#! /bin/sh

# leo - LOG ENTRY ORGANIZER, puts a message into a daily monthly logfile.
#       When you need to quickly log daily actions throughout the day
#       to give a weekly report to your boss.
#
#       USAGE: leo this is a test    <-- single line entry
#              cat meeting-notes.txt | leo   <-- standard input entry
#              leo -l                <-- list the current log file
#              leo -e                <-- edit the current log file
#
# Written by kirk Waingrow 11/10/93  
# Inspired by Hal Pomeranz, QMS Inc. who wrote PLOD - Personal LOgging Device
#
# This is free and unencumbered software released
# into the public domain. Anyone is free to copy,
# modify, publish, use, compile, sell, or
# distribute this software, either in source code
# form or as a compiled binary, for any purpose,
# commercial or non-commercial, and by any means.
# See: https://github.com/wkrik/leo/blob/main/LICENSE
#
#
#########################################################################
VERSION=1.2

DPATH="${HOME}/leo"                # Data path of log entries
DATE=`date '+%m/%d/%y, %H:%M --'`                # Format data for log entry
FILE=`date +"%y%m%d-%A"` # Get the file name
VI=/usr/bin/vim                                  # Which editor to use

ARG="$*"                                         # Store any arguments.

if [ ! -d "$DPATH" ]; then                       # If data path doesn't exist
  mkdir -p $DPATH                                # make it.
  chmod 700 $DPATH
fi

if [ ! -f "$DPATH/$FILE" ]; then                 # If log file doesn't exist
  cat /dev/null > $DPATH/$FILE                   # set it up.
  chmod 700 $DPATH/$FILE
fi

if [ -n "$ARG" ]; then                           # Check for argument
  if [ `echo $ARG | cut -c1` = "-" ]; then
    ARGL=`echo $ARG | cut -c2`
    case $ARGL in
      l) clear; cat $DPATH/$FILE | more;;
      e) $VI $DPATH/$FILE;;
    esac
  else                                           # If not VI session log the
    echo >> $DPATH/$FILE                         # it as a line entry.
    echo $DATE >> $DPATH/$FILE
    echo "$ARG" >> $DPATH/$FILE
  fi
else
  echo >> $DPATH/$FILE                           # If no arguments then 
  echo $DATE >> $DPATH/$FILE                     # consider it to be standard 
  awk '{ print }' >> $DPATH/$FILE                # in.
fi
