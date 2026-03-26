#!/bin/bash
PULL_SECRET_LOCATION=/tmp/pull-secret
AWS_ACCOUNT_ID=111222333444
AWS_REGION=ap-southeast-1
OCP_API_SERVER=https://api.cluster.example.com:6443
OCP_USERNAME=kubeadmin
OCP_PASSWORD=kubepassword

# You may consider using the --kubeconfig flag and point to the kubeconfig file as an alternative way to login with oc command
oc login -u $OCP_USERNAME -p $OCP_PASSWORD $OCP_API_SERVER

oc get secret/pull-secret -n openshift-config --template='{{index .data ".dockerconfigjson" | base64decode}}' > $PULL_SECRET_LOCATION

ECR_PASSWORD=$(aws ecr get-login-password --region $AWS_REGION)

oc registry login --registry="$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com" \
--auth-basic="AWS:$ECR_PASSWORD" \
--to=$PULL_SECRET_LOCATION

oc set data secret/pull-secret -n openshift-config --from-file=.dockerconfigjson=$PULL_SECRET_LOCATION