# Gateway API

Under this Gateway API testing case, we are doing the test with Istio under OpenShift Service Mesh 3 on OCP 4.20 running on AWS.

Please create the following resources before applying YAML files:
- IstioCNI (under istio-cni namespace)
- Istio (under istio-system namespace)

# Gateway

The Gateway resource uses Istio as a gateway class to provision the gateway. The canonical name of the gateway is `*.gateway.${CLUSTER_NAME}`, which is different from the default router that uses `*.apps.${CLUSTER_NAME}`.

After you create a gateway, you may use `oc get svc` to see the provisioned load balancer. You can use this load balancer to register the DNS in Route 53.

# HTTPRoute

You can deploy the httpd resources along to use with HTTPRoute. This will provision the Apache HTTP server with the default page configuration.

Later, you can use `curl` to query the service.

# GRPCRoute

You can deploy GRPCRoute along with the greeter-server resources. This will provision greeter service, which is the GRPC service.

You can use the `grpcurl` command to query the service. This service does not support the reflect protocol. So, you need to use a protobuf file.

```
$ grpcurl -insecure -v -proto helloworld.proto -d '{"name":"nutmos"}' gateway.greeter.${CLUSTER_NAME}:50051 helloworld.Greeter.SayHello
Resolved method descriptor:
// Sends a greeting
rpc SayHello ( .helloworld.HelloRequest ) returns ( .helloworld.HelloReply );

Request metadata to send:
(empty)

Response headers received:
content-type: application/grpc
date: Tue, 05 May 2026 08:54:07 GMT
server: istio-envoy
x-envoy-upstream-service-time: 1

Response contents:
{
  "message": "Hello nutmos"
}

Response trailers received:
(empty)
Sent 1 request and received 1 response
```