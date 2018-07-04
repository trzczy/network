#!/bin/sh
IPT="/sbin/iptables"
WAN="ppp0"
LAN="eth1"

$IPT -F
$IPT -F INPUT
$IPT -F OUTPUT
$IPT -F FORWARD
$IPT -F -t mangle
$IPT -F -t nat
$IPT -X

#$IPT -P INPUT DROP
$IPT -P OUTPUT ACCEPT
$IPT -P FORWARD ACCEPT


echo 1 > /proc/sys/net/ipv4/ip_forward
$IPT -t nat -A POSTROUTING -o $WAN -j MASQUERADE
$IPT -A INPUT -i lo -j ACCEPT
$IPT -A INPUT -i $LAN -j ACCEPT
