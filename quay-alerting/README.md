# Quay Alerting

Use the following script to replace the registry namespace name and apply to OpenShift.

```
cat prometheus-rule.yaml | sed 's/$QUAY_REGISTRY_NAMESPACE/<registry_namespace>/g'
```