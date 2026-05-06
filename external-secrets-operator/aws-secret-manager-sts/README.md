# Connect External Secrets Operator with AWS Secrets Manager using STS

Note: You have to fill in the AWS account number and OIDC by yourself. You can use the same OCP resource names if you prefer but recommend to change to reflect your usage of the resources.

Steps to connect:
1. Create a policy using `iam-policy.json` as an example policy: `aws iam create-policy --policy-name AWSSecretsManagerAccessForExternalSecretsOperator --policy-document file://iam-policy.json`
2. Create a role with the role using `trust-policy.json` as an example of the assume role policy: `aws iam create-role --role-name eso-sts --assume-role-policy-document file://trust-policy.json`
3. Attach the policy created in the step 1 with the role created in the step 2: `aws iam attach-role-policy --policy-arn arn:aws:iam::<aws-account-number>:policy/AWSSecretsManagerAccessForExternalSecretsOperator --role-name eso-sts`
4. Create a service account using `serviceaccount.yaml`.
5. Create a secret store using `secret-store.yaml`.
6. Create an external secret using `external-secret.yaml`.