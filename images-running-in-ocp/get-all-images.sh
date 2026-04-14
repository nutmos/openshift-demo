#!/bin/bash

# List for the entire cluster
oc get pods -A -ojsonpath='{range .items[*].status.containerStatuses[*]}{.image}{"\n"}{end}'

oc get pods -A -ojsonpath='{range .items[*].status.containerStatuses[*]}{.imageID}{"\n"}{end}'

oc get pods -A -ojsonpath='{range .items[*].status.initContainerStatuses[*]}{.image}{"\n"}{end}'

oc get pods -A -ojsonpath='{range .items[*].status.initContainerStatuses[*]}{.imageID}{"\n"}{end}'