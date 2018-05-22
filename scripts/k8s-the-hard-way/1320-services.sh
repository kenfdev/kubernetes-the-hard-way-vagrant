#!/bin/bash

kubectl expose deployment nginx --port 80 --type NodePort

NODE_PORT=$(kubectl get svc nginx \
  --output=jsonpath='{range .spec.ports[0]}{.nodePort}')

curl -I http://10.240.0.20:${NODE_PORT}
