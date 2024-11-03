resource "hcloud_primary_ip" "bastion_ip" {
  name          = "${terraform.workspace}-primary_ip_address_for_bastion"
  datacenter    = var.datacenter
  type          = "ipv4"
  assignee_type = "server"
  auto_delete   = true
}