#!/bin/sh

sudo iptables -D OUTPUT  "$(sudo iptables -L OUTPUT  --line-numbers | grep "youtube"     | awk '{ print $1 }')"
sudo iptables -D FORWARD "$(sudo iptables -L FORWARD --line-numbers | grep "youtube"     | awk '{ print $1 }')"
sudo iptables -D OUTPUT  "$(sudo iptables -L OUTPUT  --line-numbers | grep "googlevideo" | awk '{ print $1 }')"
sudo iptables -D FORWARD "$(sudo iptables -L FORWARD --line-numbers | grep "googlevideo" | awk '{ print $1 }')"
