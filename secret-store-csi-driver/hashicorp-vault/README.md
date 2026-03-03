# Integration for Secret Store CSI with HashiCorp Vault

# HashiCorp Vault CSI Provider

Use vault-provider-deployment.yaml to setup

Setup guide https://www.redhat.com/en/blog/openshift-secrets-store-csi-driver-vault

# Create a Vault secret using this command

`vault kv put secret/db-pass password="db-secret-password"`

Result
```
Key              Value
---              -----
created_time     2020-05-30T16:58:54.295890646Z
deletion_time    n/a
destroyed        false
version          1
```

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