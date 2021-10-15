# Firewall
- Will be creating 3 firewalls
  1. Firewall for master node - tags to use: master
  2. firewall for worker node - tags to use: worker
  3. firewall for opening ports for outbound traffic - tags to use: outbound
  4. firewall to allow ssh on vm's

# `Note`
Make sure that the tags are provided to the resource(vms) as the firewalls are assigned to resources based on the tags.
VM's should atleast contain outbound,ssh tag