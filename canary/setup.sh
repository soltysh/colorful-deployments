#!/bin/bash

# create a project for the canary example
oc new-project canary

# create prod deployment...
oc create -f prod.yaml
# ... and expose it
oc expose dc/prod --port 8080
oc expose svc/prod --name=prod

# create canary deployment...
oc create -f canary.yaml
# ... and expose it
oc expose dc/canary --port 8080
oc set route-backends prod prod=100 canary=0
