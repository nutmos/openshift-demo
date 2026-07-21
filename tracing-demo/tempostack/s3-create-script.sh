#!/bin/bash
TEMPO_BUCKET=tempostack-cluster
TEMPO_REGION=ap-southeast-1
aws s3 create-bucket --bucket $TEMPO_BUCKET --region $TEMPO_REGION --create-bucket-configuration LocationConstraint=$TEMPO_REGION