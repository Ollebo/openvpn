#!/bin/sh
echo "Setupe remote host"
mkdir /etc/openvpn/conf/
envsubst < /etc/openvpn/tpl/openvpn.tpl > /etc/openvpn/conf/openvpn.conf
cat /etc/openvpn/openvpn.conf
echo "Start client"
openvpn --config /etc/openvpn/conf/openvpn.conf