#!/bin/bash

kubectl run nginx --image=nginx

watch kubectl get pods -l run=nginx
