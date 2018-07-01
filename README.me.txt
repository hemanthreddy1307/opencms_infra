Steps to create AWS infrastructure instances, subnets, security groups and elastic Ip's

1. Run template awssubnet_SG.tf to create subnets and security groups, provide AWS access and secret key along with region details in aws provider resource

2. Run template awsinstance.tf to create instances on AWS, add the required fields to create instances like ami, subnets, SG.

3. Run template elasticip.tf to add an elastic IP to an AWS instance, add instance id for which elastic IP to be attached. 