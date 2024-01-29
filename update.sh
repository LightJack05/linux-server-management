#!/usr/bin/bash
source variables.sh

echo "[$TIME | Update Script] Starting server update..." >> $logfile
apt update | sed -e "s/^/[$TIME | Update Script] /" >> $logfile
apt upgrade -y  | sed -e "s/^/[$TIME | Update Script] /" >> $logfile
echo "[$TIME | Update Script] Update completed." >> $logfile
