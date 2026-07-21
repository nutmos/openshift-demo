Prerequisites
- Install Red Hat build of OpenTelemetry operator (tested with version 0.152.0-1)

Steps
1. Create `otel` namespace
2. Apply `rbac.yaml` to allow controller manager to generate other RBAC resources.
3. Apply `otel.yaml` to create OpenTelemetry service
4. Apply `tempo-rbac.yaml` to allow `otel-collector` service account to connect with Tempo.