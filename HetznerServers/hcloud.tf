# Set the variable value in *.tfvars file
# or using the -var="hcloud_token=..." CLI option
#variable "hcloud_token" {}
#variable "globalbet_cert" {}

#--------------------- SERVERS ----------------

# Create the APP server
resource "hcloud_server" "app" {
  name        = var.app_name
  image       = var.image_name
  server_type = var.app_type
  # delete_protection  = true
  # rebuild_protection = true
  datacenter = var.datacenter
  public_net {
    ipv4_enabled = false
    ipv6_enabled = false
  }
  network {
    network_id = hcloud_network.private_network.id
    ip         = "10.0.0.2"
  }
  backups            = true
  placement_group_id = hcloud_placement_group.placement-group.id
}

# Create the MASTER server
resource "hcloud_server" "master" {
  name        = var.master_name
  image       = var.image_name
  server_type = var.master_type
  # delete_protection  = true
  # rebuild_protection = true
  datacenter = var.datacenter
  backups    = true
  network {
    network_id = hcloud_network.private_network.id
    ip         = "10.0.0.3"
  }
  public_net {
    ipv4_enabled = false
    ipv6_enabled = false
  }
  placement_group_id = hcloud_placement_group.placement-group.id
}

# Create the SLAVE server
resource "hcloud_server" "slave" {
  name        = var.slave_name
  image       = var.image_name
  server_type = var.slave_type
  # delete_protection  = true
  # rebuild_protection = true
  datacenter = var.datacenter
  backups    = true
  network {
    network_id = hcloud_network.private_network.id
    ip         = "10.0.0.4"
  }
  public_net {
    ipv4_enabled = false
    ipv6_enabled = false
  }
  placement_group_id = hcloud_placement_group.placement-group.id
}

# Create the bastion server
resource "hcloud_server" "bastion" {
  name        = var.bastion_name
  image       = var.image_name
  server_type = var.bastion_type
  # delete_protection  = true
  # rebuild_protection = true
  datacenter = var.datacenter
  public_net {
    ipv4_enabled = true
    ipv4         = hcloud_primary_ip.bastion_ip.id
    ipv6_enabled = false
  }
  network {
    network_id = hcloud_network.private_network.id
    ip         = "10.0.0.5"
  }
  placement_group_id = hcloud_placement_group.placement-group.id
}


