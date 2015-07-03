#!/bin/bash
LOGFILE=rdc-dev.log
echo "$(date "+%m/%d %T"): Started" > $LOGFILE 2>&1
(./00-run-all dev) 2>&1 | awk '{ print strftime("%m/%d %H:%M:%S"), $0; fflush(); }' >> $LOGFILE
echo "$(date "+%m/%d %T"): Done" >> $LOGFILE 2>&1

