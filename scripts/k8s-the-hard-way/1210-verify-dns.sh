#!/bin/bash

kubectl run busybox --image=busybox --command -- sleep 3600

watch kubectl get pods -l run=busybox
