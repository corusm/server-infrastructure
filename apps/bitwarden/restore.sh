#!/bin/bash

read -p "vaultwarden-data volume-name: " vol
read -p "Zip-Filename (Type full file name): "  zip
read -s -p "Passowrd: " pw

rclone copy corusm:Backups/bitwarden/${zip} .

docker run --rm -it \
  --mount type=volume,source=${vol},target=/bitwarden/data/ \
  --mount type=bind,source=$(pwd),target=/bitwarden/restore/ \
  ttionya/vaultwarden-backup:latest restore \
  --zip-file "${zip}" \
  --password "${pw}"

 rm -r ${zip}