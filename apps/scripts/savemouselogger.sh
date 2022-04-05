#!/bin/bash

# Tutorial
# Install: https://rclone.org/install/
# Setup: https://www.youtube.com/watch?v=cFD3ljeXeaM
# Setup on remote and local desktop (Headless)
# Add hostname = eapi.pcloud.com

# CronJob
# Run once per day
# 0 5 * * * /home/niklas/corusm-docker/scripts/savemouselogger.sh

# Add dir to dump, that syncs with server
now="$(date +'%d-%m-%Y')"
docker exec mouselogger-mongodb sh -c 'mongodump --authenticationDatabase admin -u mongoadmin -p secret --archive' > /home/niklas/upload/mouselogger-$now.dump

# Copy to cloud
rclone move /home/niklas/upload/ corusm:Backups/mouselogger
