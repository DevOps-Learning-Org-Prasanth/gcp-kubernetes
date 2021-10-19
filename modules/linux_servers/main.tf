data "google_service_account" "main" {
  account_id = "instance-sa"
}
data "google_secret_manager_secret_version" "main" {
  secret  = "gcp-validator"
  version = 1
}
resource "google_compute_instance" "main" {
  count = var.server_count
  name  = local.instances[count.index]
  zone  = var.zone
  tags  = local.tags

  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = "centos-7"
    }
  }
  allow_stopping_for_update = true
  network_interface {
    subnetwork = var.subnet_self_link
  }

  service_account {
    scopes = ["cloud-platform"]
    email  = data.google_service_account.main.email
  }
  metadata_startup_script = <<-EOF
    #! /bin/bash

    # Install chef-client
    gsutil cp gs://chef-prasanth-155518/chef-17.4.38-1.el7.x86_64.rpm.
    rpm -i chef-17.4.38-1.el7.x86_64.rpm

    # Generate client.rb file
    client_exist=`find /etc/chef -name client.rb -type f -perm 644 | wc -l`
    if [ "$client_exist" -eq 1 ]
    then
    rm -f /etc/chef/client.rb
    fi
    node=`hostname`
    cat > /etc/chef/client.rb <<- EOM
    node_name         "${local.instances[count.index]}"
    chef_server_url   "https://api.chef.io/organizations/chef_training155"
    chef_license      "accept"

    validation_key    "/etc/chef/validation.pem"
    validation_client "gcp-validator"
    EOM

    # Generate validation.pem
    validation_key_exist=`find /etc/chef/ -name validation.pem -type f -perm 644 | wc -l`
    if [ "$validation_key_exist" -eq 1 ]
    then
    continue
    else
    cat > /etc/chef/validation.pem <<-EOM
    ${data.google_secret_manager_secret_version.main.secret_data}
    EOM

    # Generate first-boot.json file
    json_exist=`find /etc/chef -name first-boot.json -type f -perm 644| wc -l`
    if [ "$json_exist" -eq 1 ]
    then
    echo "First-boot already exists"
    chef-client
    else
    cat > /etc/chef/first-boot.json <<-EOM
    {
     "policy_name" : "${var.policy_name}",
     "policy_group" : "${var.policy_group}"
    }
    EOM
    chef-client -j /etc/chef/first-boot.json
    fi 
  EOF
}
