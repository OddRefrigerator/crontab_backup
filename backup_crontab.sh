#!/bin/bash

# Script name for clarity
SCRIPT_NAME="backup_crontab.sh"

# Define the backup directory (change as needed)
BACKUP_DIR="/path/to/backups"

# Get the current date for filename
DATE=$(date +%Y-%m-%d)

# Define maximum backups to keep (optional, set to 0 for no rotation)
MAX_BACKUPS=7

# Function to rotate backups (optional)
rotate_backups() {
  local files=$(ls -rt "$BACKUP_DIR/crontab_*.bak" | tail -n +$(( MAX_BACKUPS + 1 )))
  if [ "$files" ]; then
    echo "Rotating backups: Deleting excess files"
    rm -f $files
  fi
}

# Check if backup directory exists
if [ ! -d "$BACKUP_DIR" ]; then
  echo "Error: Backup directory '$BACKUP_DIR' does not exist." >&2  # Redirect error to stderr
  exit 1
fi

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"  # Create directory with parents if needed

# Backup the crontab with timestamped filename
crontab -l > "$BACKUP_DIR/crontab_$DATE.bak"

# Check if backup was successful
if [ $? -eq 0 ]; then
  echo "$(date +"%Y-%m-%d %H:%M:%S") - Crontab backed up successfully to: $BACKUP_DIR/crontab_$DATE.bak" >> "$BACKUP_DIR/backup_crontab.log"  # Log success with timestamp
  # Optional: Call rotate_backups function here
else
  echo "$(date +"%Y-%m-%d %H:%M:%S") - Error: Failed to backup crontab." >> "$BACKUP_DIR/backup_crontab.log"  # Log error with timestamp
  exit 1
fi
