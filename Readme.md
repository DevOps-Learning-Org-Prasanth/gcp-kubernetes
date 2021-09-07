# Kubernetes Cluster

- Consist of 3 nodes(1 master and 2 worker) of centos7
- Will install all req for creating kubernetes cluster via chef
- Chef installation and setup will be done by creating a startup script
- From kubeadm part steps need to be done manually

## Steps
- Create a service account which has access to create vms or any other resource
- Write terraform code to create the vm nodes.
- Write a shell script which will include the download of rpm pkg from cloud bucket and install chef-client
  - post installation copy the node validation pem file from the cloud bucket to desired location
  - create a firstboot.json file for policyname and policygroupname
  - Run chef client

## Reference
- gsutil cli tool(comes installed with the vm creation)
