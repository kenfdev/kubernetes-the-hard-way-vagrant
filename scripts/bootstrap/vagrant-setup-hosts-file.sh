#!/bin/bash

set -euo pipefail

cat <<EOF | sudo tee -a /etc/hosts
# KTHW Vagrant machines
10.240.0.10 controller-0
10.240.0.11 controller-1
10.240.0.12 controller-2
10.240.0.20 worker-0
10.240.0.21 worker-1
10.240.0.22 worker-2
EOF