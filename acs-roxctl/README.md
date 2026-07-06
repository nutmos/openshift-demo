# Example of using roxctl command

## Login

When you login to stackrox, use the following commands to set up the endpoint and API token. Then, you can login to the Central.

You can obtain the API token from the ACS console.

```
export ROX_ENDPOINT=<host:port>
export ROX_API_TOKEN=<api_token>
roxctl central whoami
```

## Image Scan

```
roxctl image scan -i quay.io/nutmos/nginx:test-v1
```