resource "hcloud_placement_group" "placement-group" {
  name = "${terraform.workspace}-placement_group"
  type = "spread"
}
