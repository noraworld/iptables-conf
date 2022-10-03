# iptables-conf

## Setup
```shell
cd iptables-conf

sudo mkdir -p /etc/iptables-conf/toggle
sudo mkdir -p /etc/iptables-conf/private/toggle

sudo ln -s $PWD/iptables/iptables.d /etc/iptables-conf
sudo ln -s $PWD/iptables/wlist      /etc/iptables-conf

sudo ln -s $PWD/iptables/private/blist /etc/iptables-conf/private
sudo ln -s $PWD/iptables/private/wlist /etc/iptables-conf/private
```

## Usage
Kerberos is a converter from Dnsmasq configuration to iptables.

WIP



## Ideas
* https://www.youtube.com/watch?v=7GVG_rnefjc
* https://stackoverflow.com/a/17184231/13999144
* https://unix.stackexchange.com/a/245988
* https://forum.openwrt.org/t/block-domain-with-iptables/102688/9
