#!/bin/bash

# create a project for the rolling example
oc new-project rolling

# create rolling deployment...
oc create -f rolling.yaml
# and expose it...
oc expose dc/hello --port 8080
oc expose svc/hello
