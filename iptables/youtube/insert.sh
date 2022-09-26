#!/bin/sh

sudo iptables -w -N YOUTUBE
sudo iptables -w -A YOUTUBE -j REJECT

sudo iptables -w -I OUTPUT  -p udp -m string --string "youtube"     --algo bm --from 1 --to 600 -j YOUTUBE
sudo iptables -w -I FORWARD -p udp -m string --string "youtube"     --algo bm --from 1 --to 600 -j YOUTUBE
sudo iptables -w -I OUTPUT  -p udp -m string --string "googlevideo" --algo bm --from 1 --to 600 -j YOUTUBE
sudo iptables -w -I FORWARD -p udp -m string --string "googlevideo" --algo bm --from 1 --to 600 -j YOUTUBE
