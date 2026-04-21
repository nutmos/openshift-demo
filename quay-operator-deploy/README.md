# Deploy Quay on OCP using the operator

This repo contains the example of Quay deployment using Red Hat Quay operator on OCP.

This has been tested with Quay Operator 3.16.3 and OCP 4.18.36.

## Steps to deploy
1. Update the configuration on quayregistry-secret.yaml with the access and secret keys to Amazon S3 or other S3-like object storage.
2. Update the users under the SUPER_USERS list.
3. Deploy the secret with quayregistry-secret.yaml
4. Deploy QuayRegistry with quayregistry.yaml
5. After Quay is up, access the console and create a new user with one of the username under the SUPER_USERS list. This user will be the superuser with the access to the superuser configuration panel.