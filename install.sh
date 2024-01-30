#!/usr/bin/bash
TIME=`date +%F@%T`
installRoot=/srv/management
logfile=/srv/management/management.log
branch="default"
repoUrl="https://raw.githubusercontent.com/LightJack05/linux-server-management/$branch"
cronTag="management-identifier"

echo "Creating $installRoot..."
mkdir -p $installRoot

echo "Creating $installRoot/variables.sh..."
echo "TIME=\`date +%F@%T\`" >> $installRoot/variables.sh
echo "installRoot=$installRoot" >> $installRoot/variables.sh
echo "logfile=$logfile" >> $installRoot/variables.sh
echo "branch=$branch" >> $installRoot/variables.sh
echo "repoUrl=$repoUrl" >> $installRoot/variables.sh
echo "cronTag=\"$cronTag\"" >> $installRoot/variables.sh

echo "Installing prerequisites..."
apt install wget curl -y

echo "Downloading components..."
wget $repoUrl/hourly.sh -P $installRoot
wget $repoUrl/daily.sh -P $installRoot
wget $repoUrl/weekly.sh -P $installRoot
wget $repoUrl/monthly.sh -P $installRoot
wget $repoUrl/yearly.sh -P $installRoot
wget $repoUrl/uninstall.sh -P $installRoot
wget $repoUrl/update.sh -P $installRoot
wget $repoUrl/update-server.sh -P $installRoot



echo "Updating permissions..."
chmod +x $installRoot/*.sh

echo "Creating cronjob(s) for current user..."
(crontab -l 2>/dev/null; echo "*/10 * * * * (cd $installRoot; cat update.sh | bash) # $cronTag") | crontab -
(crontab -l 2>/dev/null; echo "0 * * * * (cd $installRoot; ./hourly.sh) # $cronTag") | crontab -
(crontab -l 2>/dev/null; echo "10 3 * * * (cd $installRoot; ./dialy.sh) # $cronTag") | crontab -
(crontab -l 2>/dev/null; echo "20 3 * * 1 (cd $installRoot; ./weekly.sh) # $cronTag") | crontab -
(crontab -l 2>/dev/null; echo "30 3 1 * * (cd $installRoot; ./monthly.sh) # $cronTag") | crontab -
(crontab -l 2>/dev/null; echo "40 3 1 1 * (cd $installRoot; ./yearly.sh) # $cronTag") | crontab -

echo "Completed setup. Installed to: $installRoot"