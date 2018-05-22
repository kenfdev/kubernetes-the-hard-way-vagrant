#!/bin/bash

INTERNAL_IP=$(ifconfig enp0s8 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')

case "$INTERNAL_IP" in
10.240.0.20)
  POD_CIDR="10.200.0.0/24"
  ;;
10.240.0.21)
  POD_CIDR="10.200.1.0/24"
  ;;
10.240.0.22)
  POD_CIDR="10.200.2.0/24"
  ;;
*)
  echo "invalid ip"
  ;;
esac

cat <<EOF | sudo tee /etc/cni/net.d/10-bridge.conf
{
    "cniVersion": "0.3.1",
    "name": "bridge",
    "type": "bridge",
    "bridge": "cnio0",
    "isGateway": true,
    "ipMasq": true,
    "ipam": {
        "type": "host-local",
        "ranges": [
          [{"subnet": "${POD_CIDR}"}]
        ],
        "routes": [{"dst": "0.0.0.0/0"}]
    }
}
EOF

cat <<EOF | sudo tee /etc/cni/net.d/99-loopback.conf
{
    "cniVersion": "0.3.1",
    "type": "loopback"
}
EOF
