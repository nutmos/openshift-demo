# Example of setting up ACS Policy as Code and deploy using ACM GitOps

1. Create ClusterSet & ClusterRole
2. Label the cluster with the following command:
oc label managedcluster local-cluster cluster.open-cluster-management.io/clusterset=clusterset1

https://docs.redhat.com/en/documentation/red_hat_advanced_cluster_management_for_kubernetes/2.13/html-single/gitops/index#gitops-register