#!/bin/bash
export RESTIC_PASSWORD_FILE="/etc/restic_pass"

restic -r sftp:said@192.168.64.28:/home/said/backups \
    --verbose backup /home/said
