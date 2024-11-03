
#Create a volume resource section of the Hetzner Cloud with attachement to server "master" with automount and format= ext4
resource "hcloud_volume" "master" {
  name      = "${terraform.workspace}-mysql_master"
  server_id = hcloud_server.master.id
  automount = true
  format    = "ext4"
  size      = 500
  # delete_protection = true
}

#Create a volume resource section of the Hetzner Cloud with attachement to server "slave" with automount and format= ext4 and size= 500  
resource "hcloud_volume" "slave" {
  name      = "${terraform.workspace}-mysql_slave"
  server_id = hcloud_server.slave.id
  automount = true
  format    = "ext4"
  size      = 500
  # delete_protection = true
}

#Create a volume resource section of the Hetzner Cloud named "backup" with attachement to server "slave" with automount and format= ext4 and size= 700  
resource "hcloud_volume" "backup" {
  name      = "${terraform.workspace}-slave_backup"
  server_id = hcloud_server.slave.id
  automount = true
  format    = "ext4"
  size      = 700
  # delete_protection = true
}
