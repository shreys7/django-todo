# DevOps - Project - 1
## Project Description
This project is to create Infrastructure in AWS as infrastructure as Code  for a todoApp application forked from shreys7/django-todo:develop. This will setup a Jenkins server as well for configuring **CI**(Continious Integration) for the Application to Build and Test.

Technologies Used:
- Cloud Provider               - **AWS**
- IoC(Infrastructure as Code) - **Terraform**
- CICD Tool                    - **Jenkins**
- Scripting                    - **Shell Scripting/Python**
- Containerization             - **Docker**

## Setup

Download AWS CLI as per Appropriate OS: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
Download Terraform as per Appropriate OS: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

Create a IAM User from AWS Console for Terraform to create/modify/destroy AWS Resources

Configure aws IAM User for using Terraform as Ioc
Create a key pair to login to ec2 instances named as "todoapp-key"

```bash
aws configure 
$ aws --version
aws-cli/2.15.27 Python/3.11.8 Linux/5.15.0-1055-aws exe/x86_64.ubuntu.20 prompt/off
aws configure
AWS Access Key ID [None]: <access key id>     
Default region name [None]: <default region>
Default output format [None]: 
```

To get this repository, run the following command inside your git enabled terminal
```bash
$ git clone https://github.com/Yashtank-git/Devops-Project-1.git
```
Update the aws config directory file path to **terraform/01-AWS-DOCKER-JENKINS/variables.tf** variable file

## Running IoC Commands


```bash
terraform init
terraform validate
terraform plan
terraform apply
```


