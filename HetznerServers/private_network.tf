# Create a private network 
resource "hcloud_network" "private_network" {
  name     = "${terraform.workspace}-priv_network"
  ip_range = "10.0.0.0/24"
  # delete_protection = true
}
# create a private subnetwork 10.0.0.0/28 

resource "hcloud_network_subnet" "private_subnet" {
  network_id   = hcloud_network.private_network.id
  ip_range     = "10.0.0.0/28"
  network_zone = "eu-central"
  type         = "cloud"
}
