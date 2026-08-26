# Example Alerting

## Scenario 1: Deploy PVC in the quay-enterprise namespace with wrong storage class

Step to deploy:
1. Create `quay-enterprise` namespace and add the `openshift.io/cluster-monitoring=true` label.
2. Deploy `pvc.yaml` to create the PVC with the wrong storage class name. PVC will show the pending state.
3. Deploy `prometheusrule.yaml` to create alerting rules on the non-system namespace. (The quay-enterprise namespace is a non-system namespace. Hence, we use PrometheusRule to create an alerting rule.)
4. Wait for around 1 minute for the alert to change from pending to firing.