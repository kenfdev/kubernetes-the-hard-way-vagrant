#!/bin/bash

# This script assumes you have the vagrant-scp plugin installed

for instance in worker-0 worker-1 worker-2; do
  vagrant scp ${instance}.kubeconfig ${instance}:~/
  vagrant scp kube-proxy.kubeconfig ${instance}:~/
done

for instance in controller-0 controller-1 controller-2; do
  vagrant scp admin.kubeconfig ${instance}:~/
  vagrant scp kube-controller-manager.kubeconfig ${instance}:~/
  vagrant scp kube-scheduler.kubeconfig ${instance}:~/
done