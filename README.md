# Crontab Backup

Crontab Backup is a simple tool for backing up and restoring crontab entries on Unix-like systems. This project provides a straightforward way to ensure your scheduled tasks are not lost, making it easy to create backups and restore them when needed.

## Features

- **Backup Crontab Entries:** Easily create backups of your current crontab entries to a specified file.
- **Restore Crontab Entries:** Restore crontab entries from a backup file, ensuring your scheduled tasks are quickly reinstated.
- **User-Friendly Interface:** Simple command-line interface for performing backup and restore operations.
- **Cross-Platform Compatibility:** Works on various Unix-like systems, including Linux and macOS.

## Requirements

- Unix-like operating system (Linux, macOS)
- Bash shell
- `crontab` command available

## Installation

To use Crontab Backup, you can clone the repository to your local machine:

```bash
git clone https://github.com/OddRefrigerator/crontab_backup.git
cd crontab_backup
```

You can also copy the `crontab_backup.sh` script to a directory in your `$PATH` for easier access.

## Usage

### Backup Crontab

To create a backup of your current crontab, run the following command:

```bash
./crontab_backup.sh backup /path/to/backup/file
```

Replace `/path/to/backup/file` with the desired path for your backup file.

##
