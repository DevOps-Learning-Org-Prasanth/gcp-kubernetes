# Kubernetes Cluster

- Consist of 3 nodes(1 master and 2 worker) of centos7
- Will install all req for creating kubernetes cluster via chef
- Chef installation and setup will be done by creating a startup script
- From kubeadm part steps need to be done manually
<!-- - create a vnc server so that a centos vm with GUI can be used: https://medium.com/@piyushraj246800/your-guide-to-vnc-server-on-gcp-ed8255c81b43  -->
- Create a cloud load balancer to connect the subnet to public

## Steps
- Create a service account which has access to create vms or any other resource
- Write terraform code to create the vm nodes.
- Write a shell script which will include the download of rpm pkg from cloud bucket and install chef-client
  - post installation copy the node validation pem file from the cloud bucket to desired location
  - create a firstboot.json file for policyname and policygroupname
  - Run chef client

## Reference
- gsutil cli tool(comes installed with the vm creation)

## Creating vms
<!-- 1. Create a custom vpc network. -->
1. create a subnet for gcp cluster
2. create firewallrules on both the subnets
3. create vm's three for kubernetes cluster's subnet

## VPC and Firewall rules
- https://cloud.google.com/vpc/docs/vpc

## Cloud loadbalancing
- https://cloud.google.com/load-balancing/docs