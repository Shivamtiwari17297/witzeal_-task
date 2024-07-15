# witzeal_-task

1.Setup a Linux server in Custom VPC server with use of terraform and ansible and install and configure MySQL, tomcat on 8080 port Memcached Redis and deploy a sample war file.


2- Create ALB Using Terraform and add machine and configure health check on 80 port and share URL.


3.Create an EC2 instance with a Linux based OS that is accessible over the internet via SSH.

## Inputs

The following inputs should be accepted:

 

- **Region**: AWS region where the instance will be deployed

- **KeyName**: Name of the SSH key to be installed on the instance

  - **InstanceType**: EC2 instance type (i.e size of the instance)

- **SubnetId**: ID of the subnet where the instance will be deployed

- **VpcId**: ID of the VPC where the instance will be deployed

 

The following outputs should be produced:

## Outputs

- **InstanceId**: ID of the newly created instance

- **PublicIpAddress**: publicly accessible ip address as an output

 

4. Create Ansible Playbook to restart tomact application if new if any change war file.How to check process up and running using ansible.Also print top 10 running process.
