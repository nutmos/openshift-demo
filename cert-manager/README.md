# Using Trust Manager in the cert-manager operator

## Prerequisites
TechPreviewNoUpgrade must be switch on from the FeatureGate.

## Steps to install
1. Install the cert-manager operator in OpenShift
2. Using the following command to enable the unsupported addon feature. The trust manager is now an unsupported feature.
```
oc -n cert-manager-operator patch subscription openshift-cert-manager-operator \
  --type='merge' \
  -p '{"spec":{"config":{"env":[{"name":"UNSUPPORTED_ADDON_FEATURES","value":"TrustManager=true"}]}}}'
```
3. Create TrustManager file using `trust-manager.yaml`
4. Wait for the trust-manager to start. You can watch the status in the `cert-manager` namespace
5. After trust-manager starts, you can start deploying `Bundle` using the `example-bundle.yaml` file

For more information about the `Bundle`, please visit the upstream document: https://cert-manager.io/docs/trust/trust-manager/
