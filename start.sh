#!/bin/sh

modprobe xt_mark
echo 'net.ipv4.ip_forward = 1' | tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.all.forwarding = 1' | tee -a /etc/sysctl.conf
sysctl -p /etc/sysctl.conf
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
ip6tables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

/app/tailscaled --state=/var/lib/tailscale/tailscaled.state \
    --socket=/var/run/tailscale/tailscaled.sock \
    --verbose=1 \
    --port 41641
/app/tailscale up \
    --authkey=${TAILSCALE_AUTHKEY} \
    --hostname=fly-${FLY_REGION} \
    --advertise-exit-node
sleep infinity
