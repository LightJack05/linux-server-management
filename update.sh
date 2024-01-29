# Script for self-updating the management (May also rm -rf your server...)

source variables.sh
oldInstallRoot=$installRoot
oldLogFile=$logfile
oldCronTag=$cronTag
oldTime=$TIME

echo "[$oldTime | Management Update ] Starting management update..." >> $oldLogFile
echo "[$oldTime | Management Update ] Removing old installation..." >> $oldLogFile

# Dangerous.
if [[ -z "$installRoot" ]]
then
    exit 1
fi
rm -f "$oldInstallRoot"/*.sh


(crontab -l 2>/dev/null | grep -v "$oldCronTag") | crontab -

echo "[$oldTime | Management Update ] Downloading and installing new version..." >> $oldLogFile

curl $repoUrl/install.sh | bash | sed -e "s/^/[$oldTime | Management Update ] /" >> $oldLogFile

