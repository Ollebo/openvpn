#!/bin/sh
echo "Setupe remote host"
envsubst < /etc/openvpn/conf/openvpn.tpl > /etc/openvpn/conf/openvpn.conf
echo "Start client"
openvpn --config /etc/openvpn/conf/openvpn.conf