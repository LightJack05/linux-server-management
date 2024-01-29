# Script for self-updating the management

source variables.sh

echo "[$TIME | Management Update ] Starting management update..." >> $logfile
echo "[$TIME | Management Update ] Removing old installation..." >> $logfile

rm -rf $installRoot/*
(crontab -l 2>/dev/null | grep -v "$cronTag") | crontab -

echo "[$TIME | Management Update ] Downloading and installing new version..." >> $logfile

curl $repoUrl/$branch/install.sh | bash | sed -e "s/^/[$TIME | Management Update] /" >> $logfile

