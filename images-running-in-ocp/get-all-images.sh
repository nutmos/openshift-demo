#!/bin/bash

# List for the entire cluster
oc get pods -A -ojsonpath='{range .items[*].status.containerStatuses[*]}{.image}{"\n"}{end}'