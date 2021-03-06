## **Authentication**
 Authentication is required by the provider to create resources on the platform.
There are following methods to provide credentials for authentication for AWS -

**Static Credentials -**
Static credentials are provided within the provider in the script. This should not be used in practice because there can be multiple admins of the infrastructure and credentials will be shared along with the configuration file.

```
provider "aws" {
  access_key = "YOUR_ACCESS_KEY_HERE"
  secret_key = "YOUR_SECRET_KEY_HERE"
  region     = "us-east-1"
}
```

**Environment Variables -**
Credentials can also be provided using environment variables - AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY and AWS_DEFAULT_REGION for access key, secret key and region respectively.

```
$ export AWS_ACCESS_KEY_ID="YOUR_ACCESS_KEY_HERE"
$ export AWS_SECRET_ACCESS_KEY="YOUR_SECRET_KEY_HERE"
$ export AWS_DEFAULT_REGION="us-east-1"
```

**Shared Credentials File -**
The default location for aws credentials file is ~/.aws/credentials. If credentials are not provided by above methods then Terraform checks for this location. Alternatively, you can provide custom location for credentials file as -

```
provider "aws" {
  shared_credentials_file = "D:/aws/credentials"
  region                  = "us-east-1"
}
```

**AWS IAM Roles -**
If you are running your terraform on an AWS EC2 Instance then Terraform tales credentials from IAM Instance Profile using IAM Role. It asks for metadata API endpoint for credentials. Default metadata endpoint is http://169.254.169.254:80/latest.

User can also provide custom endpoint using AWS_METADATA_URL variables which takes endpoint URL as input.

**Assume IAM Role -**
We can also assume role assume role to create resource as follows -

```
provider "aws" {
  assume_role {
    role_arn     = "arn:aws:iam::ACCOUNT_ID:role/ROLE_NAME"
    session_name = "SESSION_NAME"
    external_id  = "EXTERNAL_ID"
  }
}
```

You will need to provide the role arn you want to assume and session name and external id.


If you are not familiar with AWS IAM Roles and Assume IAM Role. I suggest to go and learn what is AWS IAM and how we can access AWS resources.
