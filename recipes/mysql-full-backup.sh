#!/bin/bash

# SET Variables
DB_USER="forge"
DB_PASS=""
BACKUP_DIRECTORY="/home/forge/.backups"

NOW="$(date +"%d-%m-%Y_%H-%M-%S")"
FILE_NAME="all_db_backup_$NOW.sql"
BACKUP_FILE="$BACKUP_DIRECTORY/$FILE_NAME"
LOG_FILE="$BACKUP_DIRECTORY/"backup_log_"$(date +'%Y_%m')".log

echo "mysqldump started at $(date +'%d-%m-%Y %H:%M:%S')" >> "$LOG_FILE"
mysqldump -u $DB_USER -p$DB_PASS --quick --single-transaction --flush-logs --all-databases > $BACKUP_FILE | >> $LOG_FILE
echo "mysqldump finished at $(date +'%d-%m-%Y %H:%M:%S')" >> "$LOG_FILE"
find "$BACKUP_DIRECTORY" -name 'all_db_backup_*' -mtime +8 -exec rm {} \;
echo "old files deleted" >> "$LOG_FILE"
echo "operation finished at $(date +'%d-%m-%Y %H:%M:%S')" >> "$LOG_FILE"
echo "*****************" >> "$LOG_FILE"
exit 0
