#!/bin/bash

# Clean sysctl config directories
rm -rf /usr/lib/sysctl.d/* /run/sysctl.d/* /etc/sysctl.d/*

sed -i "/net.ipv4.conf.default.accept_source_route/d" /etc/sysctl.conf
echo "net.ipv4.conf.default.accept_source_route = 0" >> /etc/sysctl.conf

ln -s /etc/sysctl.conf /etc/sysctl.d/99-sysctl.conf

sysctl -w net.ipv4.conf.default.accept_source_route=0