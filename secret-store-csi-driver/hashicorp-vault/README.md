# Integration for Secret Store CSI with HashiCorp Vault

# HashiCorp Vault CSI Provider

Use vault-provider-deployment.yaml to setup

Setup guide https://www.redhat.com/en/blog/openshift-secrets-store-csi-driver-vault

# Configure authentication with Kubernetes

```
vault auth enable kubernetes
vault write auth/kubernetes/config \
    kubernetes_host="https://$KUBERNETES_PORT_443_TCP_ADDR:443"
```

Create a policy named internal-app. This will be used to give the webapp-sa service account permission to read the kv secret created earlier.


```
vault policy write internal-app - <<EOF
path "secret/data/db-pass" {
  capabilities = ["read"]
}
EOF
```

Finally, create a Kubernetes authentication role named database that binds this policy with a Kubernetes service account named httpd in the sscsi-test namespace.

```
vault write auth/kubernetes/role/database \
    bound_service_account_names=httpd \
    bound_service_account_namespaces=sscsi-test \
    policies=internal-app \
    ttl=20m
```