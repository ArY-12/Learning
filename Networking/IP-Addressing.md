IP addressing: IPv4 structure, CIDR & subnetting, private ranges, loopback, IPv6 basics

# IP Addressing #

What is an IP Address?

IP Address is a unique number assigned to a device which connects to a network.
How to check IP for a device. 

Windows: CMD < Type ipconfig
Example:
```
Connection-specific DNS Suffix  . : bbrouter
   Link-local IPv6 Address . . . . . : fe80::55db:c5d1:848e:6bf3%7
   IPv4 Address. . . . . . . . . . . : 192.168.1.2
   Subnet Mask . . . . . . . . . . . : 255.255.255.0
   Default Gateway . . . . . . . . . : 192.168.1.1
```

Linux/Mac: Terminal < Type ifconfig
Example:
```
enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.2.15  netmask 255.255.255.0  broadcast 10.0.2.255
        inet6 fe80::a00:27ff:fe2f:6a16  prefixlen 64  scopeid 0x20<link>
        inet6 fd17:625c:f037:2:a00:27ff:fe2f:6a16  prefixlen 64  scopeid 0x0<global>
        ether [REDACTED]  txqueuelen 1000  (Ethernet)
        RX packets 833  bytes 241446 (241.4 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 805  bytes 133178 (133.1 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

The IPv4 Address is the IP address of your device.

Subnet Mask: 32 bit number which divides the IP into: 
1. Network ID -> `192.168.1`
2. Host ID -> `2`

It helps a device determine whether another device is on the same local network or on a different network, which in turn decides whether the communication is direct or must go through a router.

The Subnet Mask `255.255.255.0` here means that the last octet of the IP address or the Host ID is used to identify different hosts within the same network.
Similarly a Subnet Mask `255.255.0.0` here means that the last two octets of the Host ID are used to identify different hosts within the same network.


### Subnetting ###

### CIDR Notation ###

### Private IP Ranges ###

### Loopback ###