#!/bin/bash

POD_NAME=$(kubectl get pods -l run=nginx -o jsonpath="{.items[0].metadata.name}")

kubectl port-forward $POD_NAME 8080:80 &


sleep 5

echo ''
curl --head http://127.0.0.1:8080

kill $!
