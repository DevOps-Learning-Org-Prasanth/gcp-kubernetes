output subnets {
  value = { for subnet in var.subnets: 
        (subnet.name) => {
          cidr = subnet.cidr
          id = google_compute_subnetwork.main[subnet.name].id
        }
      }
  description = <<-DESC
    Will output the subnets created in following format.
    subnets = {
      "web" : {
        "cidr" : "10.255.44.0/24",
        "id" : "1"
      },
      "app" : {
        "cidr" : 10.256.44.0/24",
        "id" : "2"
      }
    }
  DESC
}