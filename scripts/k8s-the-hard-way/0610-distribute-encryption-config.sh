#!/bin/bash

# This script assumes you have the vagrant-scp plugin installed

for instance in controller-0 controller-1 controller-2; do
  vagrant scp encryption-config.yaml ${instance}:~/
done