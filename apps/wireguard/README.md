# Wireguard

## Setup Wireguar
1. Take `docker-compose.yml` from [here](https://github.com/BaptisteBdn/docker-selfhosted-apps/tree/main/wireguard-pihole-unbound)
2. Install Wireguard on Client as shown [here](https://www.wundertech.net/how-to-connect-a-raspberry-pi-to-a-wireguard-vpn-server/)
```bash
sudo apt-get update
sudo apt install wireguard

sudo su
apt install raspberrypi-kernel-headers libelf-dev libmnl-dev build-essential git
git clone https://git.zx2c4.com/wireguard-tools
make -C wireguard-tools/src -j$(nproc)
make -C wireguard-tools/src install

sudo vim /etc/wireguard/wg0.conf # Paste peer1.conf here

wg-quick up wg0
wg-quick down wg0

sudo systemctl enable wg-quick@wg0
```

## SSH Config
SSH Config looks as following:
```bash
Host 10.13.13.3 # connection of RaspberryPi
    User niklas

Host 10.50.1.61 # connection Desktop PC
    User niklas
    ProxyCommand ssh 10.13.13.3 -W %h:%p
```