# CORUSM Docker Documentation

Hi there, this is a kind of mirror of my private docker-compose infrastructure. I'm currently moving on to `kubernetes` and wanted to make this repo public now, so others might have a more simple start to container infrastructure.

This Repo just contains a collection of public services and not my own ones.

## Provisioning
For creating the infrastructure just go to the `ansible` directory and execute `install-server.sh`. This will ask you for some inputs and will automatically setup your new VPS.

## Storage Issues
In order to keep your setup cleaned up, put this command in your CRON and run it something like once a day.
This will prevent rapidly growing storage because it will delete unused docker ressources.
```bash
docker system prune -a && docker volume prune
```

## Issues
Sometimes when I start my server, there is some instance of another server running and using an IP i've defined in Docker. 
With `netset -nlp | grep 27017` you can look, which service is currently using this port and kill it.

## Monitoring
For Monitoring I use a `Grafana`, `Prometheus`, `Loki` and `Watchtower` Stack.
Grafana and Prometheus are used for Metrics and Loki is the logging server/database.

### Watchtower
[Watchtower](https://containrrr.dev/watchtower/) is a service, that checks in defined intervals if there is any update for the container image. 
If there is one, it will pull the update and restart the container. You wont must make updates manually again.
Add following label to your containers, that you want to get updated by watchtower. Some services will break when doing this (f.e. Mailcow).
```yml
label:
    - com.centurylinklabs.watchtower.enable="true"
```

## Loki
In order to sent logs to Loki you first need to install the loki logging driver.
```bash
docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions
```
If installed add this config to your `docker-compose` file.
```yml
x-logging:
  &default-logging
  driver: loki
  options:
    mode: non-blocking
    loki-url: http://localhost:3100/loki/api/v1/push
    loki-external-labels: host=corusm.de,stack=keila
```
To your service you must then add `logging: *default-logging`.

# Backups
For backups I use `rclone` which is similar to `rsync` but different. `rclone` can `rsync` files to your cloud provider. So via `rsync` links I copy these files in my cloud.

# Reverse Proxy
As a reverse proxy I use traefik, which does the whole certificate stuff for me. Configs are visible in my docker-compose files.
In order to get this repo to work for you, you must change my domain to yours.

# Service Overview
| Service            | Description                                                                       |
|--------------------|-----------------------------------------------------------------------------------|
| Mailcow-Dockerized | Self-Hosted E-Mail Server                                                         |
| Bitwarden          | Self-Hosted Password Manager                                                      |
| Keila              | Open-Source Newsletter Tool                                                       |
| LogSeq             | A privacy-first, open-source platform for knowledge management and collaboration. |
| Mattermost         | Open-Source Slack Alternative                                                     |
| Metrics            | Grafana, Prometheus, Loki Stack                                                   |
| MLFlow             | Machine-Learning Dev-Ops Tool                                                     |
| Shlink             | Self-Hosted Bit.ly alternative                                                    |
| Vault              | Harshicorp Vault for Secret Management                                            |
| Wireguard          | Self-Hosted VPN Tunnel                                                            |
| Registry           | Self-Hosted Docker-Registry                                                       |
| Jenkins            | Open-Source CI/CD Tool                                                            |
| Code-Server        | VSCode in the Web                                                                 |
| Gotify             | Self-Hosted Notification Server                                                   |
| Jupiter-Notebook   | Jupiter Notebook Server                                                           |
| LanguageTool       | Open-Source Grammerly Alternative                                                 |
| Nextcloud          | Self-Hosted Cloud (Calendar, Docs, Files)                                         |
| Penpot             | Prototyping Tool (Figma Alternative)                                              |
| Radicale           | Self-Hosted CalDav/CardDav (Calendar and Contacts)                                |
| Sharelatex         | Self-Hosted Overleaf Server                                                       |
| Traefik            | Reverse Proxy Service                                                             |
| Watchtower         | Automated Container Updates                                                       |