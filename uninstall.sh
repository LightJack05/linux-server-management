# Script for self-updating the management

source variables.sh

rm -r $installRoot

(crontab -l 2>/dev/null | grep -v "$cronTag") | crontab -

echo "Uninstalled."