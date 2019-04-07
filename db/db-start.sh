#!/bin/bash
set -e


#####
# Launch Cron for Postgres backups
#####

# Grant execution rights
chmod +x ./pg_backup_rotated.sh

# Add the cron job
(crontab -l ; echo "30 3 * * * root /srv/db/pg_backup_rotated.sh")| crontab -

# Echo the crontab content 
echo Checking crontab content...
crontab -l

# Create the log file to be able to run tail
touch /var/log/cron.log

# Run the command on container startup
cron && tail -f /var/log/cron.log



