# Welcome to Mysql Dump Bash Script!

Hi, thanks to this script; You can back up your data on your server with mysql database daily. The script is set to keep data for the last **30 days**. It will automatically delete data before 30 days, it will not fill the server capacity unnecessarily.


# Files
- /mysql_dump.sh

# Deployment
We set up our crontab command to get a backup at 03:00 every day.

	0 3 * * * /bin/bash "/root/mysql_dump.sh"
