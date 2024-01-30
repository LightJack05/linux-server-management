#!/usr/bin/bash
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# @ !!! DO NOT CHANGE YOUR VARIABLES HERE, USE INSTALL.SH !!!        @
# @ File for development/intellisense purposes only!                 @
# @ This file is not downloaded or executed to the target system.    @
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
TIME=`date +%F@%T`
installRoot=/srv/management
logfile=/srv/management/management.log
branch="beta"
repoUrl="https://raw.githubusercontent.com/LightJack05/linux-server-management/$branch"
cronTag="management-identifier"