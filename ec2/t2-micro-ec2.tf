#Start a t2.micro ec2 instance using Amazon Linux 2 AMI (HVM), SSD Volume Type
provider "aws" {
  access_key = "YOUR_ACCESS_KEY_HERE"
  secret_key = "YOUR_SECRET_KEY_HERE"
  region     = "us-east-1"
}

#You can run this script on your already running EC2 Instance, given your EC2 has role to create new EC2 Instance. In that case, you will not need to provide secret key and access key, it will assume the role assigned to the EC2 Instance.

#You can externalize the AWS Credentials. If you do not provide aws credentials and are running it from your machine, it will look for credentials in ~/.aws/credentials. This is also a best practice.

resource "aws_instance" "instance-1" {
  ami           = "ami-00b6a8a2bd28daf19"
  instance_type = "t2.micro"
}

#This configuration will create a t2.micro instance with given ami in "us-east-1" region with access to default VPC.
