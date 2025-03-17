#!/bin/bash

if [ "$EUID" -ne 0  ]; then
	echo "Root"
	exit 1
fi

VM_INTERFACE_NAT="eth0"
VM_INTERFACE_HOSTONLY="eth1"

echo "Configuring NAT adapter..."
nmcli connection add type ethernet ifname "$VM_INTERFACE_NAT" con-name "NAT" autoconnect yes
nmcli connection modify "$VM_INTERFACE_NAT" ipv4.method auto
nmcli connection up "$VM_INTERFACE_NAT"

echo  "Configuring Host-Only adapter..."
nmcli connection add type ethernet ifname "$VM_INTERFACE_HOSTONLY" con-name "Host-Only" autoconnect yes
nmcli connection modify "Host-Only" ipv4.method manual ipv4.addresses 192.168.56.2/24
nmcli connection up "Host-Only"

echo "Restarting network service..."
systemctl restart NetworkManager

