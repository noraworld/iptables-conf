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

### Apply
```shell
# Check if your configuration is correct
kerberos apply /etc/iptables-conf --dry-run
```

```shell
# Apply
kerberos apply /etc/iptables-conf
```

### Convert
```shell
kerberos convert --dry-run --chain=FORWARD /etc/dnsmasq.toggle/netflix.conf
```

The content of `/etc/dnsmasq.toggle/netflix.conf` is the same as [dnsmasq-conf/dnsmasq/dnsmasq.toggle/netflix.conf](https://github.com/noraworld/dnsmasq-conf/blob/b8262f86d4076027915550760bb829d21ba69816/dnsmasq/dnsmasq.toggle/netflix.conf).

```conf
-N NETFLIX_REJECT
-A NETFLIX_REJECT -j REJECT
-I FORWARD -p all -m comment --comment "flxvpn.net" -m string --hex-string "flxvpn|03|net" --algo bm -j NETFLIX_REJECT
-I FORWARD -p all -m comment --comment "netflix.ca" -m string --hex-string "netflix|02|ca" --algo bm -j NETFLIX_REJECT
-I FORWARD -p all -m comment --comment "netflix.com" -m string --hex-string "netflix|03|com" --algo bm -j NETFLIX_REJECT
-I FORWARD -p all -m comment --comment "netflix.com.au" -m string --hex-string "netflix|03|com|02|au" --algo bm -j NETFLIX_REJECT
-I FORWARD -p all -m comment --comment "netflix.net" -m string --hex-string "netflix|03|net" --algo bm -j NETFLIX_REJECT
-I FORWARD -p all -m comment --comment "netflixdnstest1.com" -m string --hex-string "netflixdnstest1|03|com" --algo bm -j NETFLIX_REJECT
-I FORWARD -p all -m comment --comment "netflixdnstest10.com" -m string --hex-string "netflixdnstest10|03|com" --algo bm -j NETFLIX_REJECT
-I FORWARD -p all -m comment --comment "netflixdnstest2.com" -m string --hex-string "netflixdnstest2|03|com" --algo bm -j NETFLIX_REJECT
-I FORWARD -p all -m comment --comment "netflixdnstest3.com" -m string --hex-string "netflixdnstest3|03|com" --algo bm -j NETFLIX_REJECT
-I FORWARD -p all -m comment --comment "netflixdnstest4.com" -m string --hex-string "netflixdnstest4|03|com" --algo bm -j NETFLIX_REJECT
-I FORWARD -p all -m comment --comment "netflixdnstest5.com" -m string --hex-string "netflixdnstest5|03|com" --algo bm -j NETFLIX_REJECT
-I FORWARD -p all -m comment --comment "netflixdnstest6.com" -m string --hex-string "netflixdnstest6|03|com" --algo bm -j NETFLIX_REJECT
-I FORWARD -p all -m comment --comment "netflixdnstest7.com" -m string --hex-string "netflixdnstest7|03|com" --algo bm -j NETFLIX_REJECT
-I FORWARD -p all -m comment --comment "netflixdnstest8.com" -m string --hex-string "netflixdnstest8|03|com" --algo bm -j NETFLIX_REJECT
-I FORWARD -p all -m comment --comment "netflixdnstest9.com" -m string --hex-string "netflixdnstest9|03|com" --algo bm -j NETFLIX_REJECT
-I FORWARD -p all -m comment --comment "netflixinvestor.com" -m string --hex-string "netflixinvestor|03|com" --algo bm -j NETFLIX_REJECT
-I FORWARD -p all -m comment --comment "netflixstudios.com" -m string --hex-string "netflixstudios|03|com" --algo bm -j NETFLIX_REJECT
-I FORWARD -p all -m comment --comment "netflixtechblog.com" -m string --hex-string "netflixtechblog|03|com" --algo bm -j NETFLIX_REJECT
-I FORWARD -p all -m comment --comment "nflxext.com" -m string --hex-string "nflxext|03|com" --algo bm -j NETFLIX_REJECT
-I FORWARD -p all -m comment --comment "nflximg.com" -m string --hex-string "nflximg|03|com" --algo bm -j NETFLIX_REJECT
-I FORWARD -p all -m comment --comment "nflximg.net" -m string --hex-string "nflximg|03|net" --algo bm -j NETFLIX_REJECT
-I FORWARD -p all -m comment --comment "nflxso.net" -m string --hex-string "nflxso|03|net" --algo bm -j NETFLIX_REJECT
-I FORWARD -p all -m comment --comment "nflxvideo.net" -m string --hex-string "nflxvideo|03|net" --algo bm -j NETFLIX_REJECT
```

You can use the feature in a way like this:

```shell
kerberos convert --dry-run --chain=FORWARD /etc/dnsmasq.toggle/netflix.conf > /path/to/iptables-conf/toggle/132_netflix.conf
```

You can also use `kerberos-import` to import all Dnsmasq configurations at once.

### Delete
WIP

### List
```shell
kerberos list all
```



## Ideas
* https://www.youtube.com/watch?v=7GVG_rnefjc
* https://stackoverflow.com/a/17184231/13999144
* https://unix.stackexchange.com/a/245988
* https://forum.openwrt.org/t/block-domain-with-iptables/102688/9
