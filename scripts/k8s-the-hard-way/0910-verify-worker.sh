#!/bin/bash

vagrant ssh controller-0 \
  --command "kubectl get nodes --kubeconfig admin.kubeconfig"
