#!/bin/bash

# create a project for the blue green example
oc new-project blue-green

# create blue deployment...
oc create -f blue.yaml
# ... and expose it
oc expose dc/blue --port 8080
oc expose svc/blue --name=hello

# create green deployment....
oc create -f green.yaml
# ... and expose it
oc expose dc/green --port 8080
oc set route-backends hello blue=100 green=0
