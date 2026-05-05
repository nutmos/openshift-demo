# Example of setting up ACS Policy as Code and deploy using ACM GitOps

This example shows how to set up GitOps to use with ACS PAC.

# Prerequisites

You have the following information installed:
1. Red Hat Advanced Cluster Security version 4.8+ with this cluster running Central.
2. Red Hat Advanced Cluster Management
3. OpenShift GitOps Operator

# Steps to install

1. Create ClusterSet & ClusterRole
2. Label the cluster with the following command: `oc label managedcluster local-cluster cluster.open-cluster-management.io/clusterset=clusterset1`
3. Install GitOps using the resources in the `gitopsclusterr.yaml` file.

# Apply Policy as Code

All policies are under the `pac` folder. You must apply a policy in YAML file in the `stackrox` namespace (or the namespace that you deploy ACS Central) and check in the ACS console if ACS can read them.

The policy should show "Externally Managed" if it is created by with the YAML file on OCP.

# Resources

- [ACM 2.13 installation of GitOps](https://docs.redhat.com/en/documentation/red_hat_advanced_cluster_management_for_kubernetes/2.13/html-single/gitops/index#gitops-register)