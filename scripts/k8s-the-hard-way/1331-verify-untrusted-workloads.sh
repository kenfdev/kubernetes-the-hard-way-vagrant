#!/bin/bash

INSTANCE_NAME=$(kubectl get pod untrusted --output=jsonpath='{.spec.nodeName}')

vagrant ssh ${INSTANCE_NAME}
