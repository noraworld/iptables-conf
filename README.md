# iptables-conf

## Usage
Kerberos is a converter from Dnsmasq configuration to iptables.

```
# youtube.conf

address=/youtube.com/
address=/googlevideo.com/
```

### Reject

```shell
kerberos reject youtube.conf
```

### List
```shell
kerberos list youtube.conf
```

```
35   YOUTUBE    all  --  anywhere             anywhere             /* googlevideo.com */ STRING match  "|676f6f676c65766964656f03636f6d|" ALGO name bm TO 65535
47   YOUTUBE    all  --  anywhere             anywhere             /* youtube.com */ STRING match  "|796f757475626503636f6d|" ALGO name bm TO 65535
```

```shell
sudo iptables -L YOUTUBE
```

```
Chain YOUTUBE (20 references)
target     prot opt source               destination
REJECT     all  --  anywhere             anywhere             reject-with icmp-port-unreachable
```

```shell
kerberos list all
```

### Delete
```shell
kerberos delete youtube.conf
```



## Ideas
* https://www.youtube.com/watch?v=7GVG_rnefjc
* https://stackoverflow.com/a/17184231/13999144
* https://unix.stackexchange.com/a/245988
* https://forum.openwrt.org/t/block-domain-with-iptables/102688/9
