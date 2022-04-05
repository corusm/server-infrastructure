# Bitwarden
- Create `.env`-File with Variables: YUBICO_CLIENT_ID, YUBICO_SECRET_KEY, ZIP_PASSWORD
- Configure rclone, then map ~/.config on /config/
- IMPORTANT: Save zip-file key
- Resources: [link](https://github.com/ttionya/vaultwarden-backup), [link](https://github.com/dani-garcia/vaultwarden)


## Restore
- remove old volume
- start docker-compose once, then stop
- stop Bitwarden Container
- Run `restore.sh`
- Zip ex. backup.20220512.zip
- Pw ex. test-apple-banana