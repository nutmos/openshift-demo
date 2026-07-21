Prerequisite
- Install Tempo operator (this is tested with version 0.21.0-2)
- Install Cluster Observability operator (this is tested with version 1.5.1) - This is required if you want to use UI plugin.

Steps to install
1. Create namespace tempo
2. Update tempostack-secret.yaml file with the AWS S3 secret
3. Apply tempostack.yaml
4. Apply uiplugin.yaml (if you want to use UI plugin)
5. Apply rbac.yaml for granting query to all authenticated users and write to the otel-collector user.