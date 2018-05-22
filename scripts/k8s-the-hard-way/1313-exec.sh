#!/bin/bash

POD_NAME=$(kubectl get pods -l run=nginx -o jsonpath="{.items[0].metadata.name}")

kubectl exec -ti $POD_NAME -- nginx -v
