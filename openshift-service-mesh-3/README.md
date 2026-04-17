# Resources for setting up OpenShift Service Mesh 3.

Subfolders:
- istio: for the fundamental OpenShift Service Mesh resources
- kiali: for Kiali console along with the connection to Prometheus and Tempo
- otel: for setting up OpenTelemetry Collector using Red Hat Build of OpenTelemetry and connect to Tempostack
- tempostack: for setting up TempoStack
- perses-dev: for setting up Perses dashboard
- gateway: for setting up the OpenShift Service Mesh gateway deployments
- prometheus: for setting podmonitor and servicemonitor to with Prometheus user workload scrape metrics

Steps to setup:
1. Install OpenShift Service Mesh 3 Operator, Kiali Operator and Cluster Observability Operator
2. Enable Prometheus user-workload.
3. Setup Istio core resources using resources in the istio folder.
4. Setup Istio Ingressgateway using resources in the gateway folder.
5. Setup PodMonitor and ServiceMontior using resources in the prometheus folder.
6. Setup Kiali using resources in the Kiali folder.
7. Setup TempoStack using resources in the tempostack folder.
8. Setup OpenTelemetry Collector using resources in the otel folder.
9. Setup Perses using resources in the perses-dev folder.
