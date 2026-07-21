
For golang:
1. You must create an SCC that allows instrumentation to work using golang-instrumentation-scc.yaml
2. Create resources using `golang-hello-openshift.yaml`.
3. Then, you have to apply the following command to grant the SCC to a service account.
`oc adm policy add-scc-to-user otel-go-instrumentation-scc -z golang-hello-openshift`