#servers
app_name     = "vs-sas2-app"
master_name  = "vs-sas2-master"
slave_name   = "vs-sas2-slave"
bastion_name = "vs-sas2-bastion"
###############

image_name = "ubuntu-22.04"

#Hetzner VM Types
app_type     = "ccx33"
master_type  = "ccx23"
slave_type   = "cx41"
bastion_type = "cx11"
###############

datacenter = "fsn1-dc14"

#Private network
priv_network_name = "sas2-network"

#volumes
mysql_master_name = "sas2-master-mysql"
mysql_slave_name  = "sas2-slave-mysql"
slave_backup_name = "sas2-slave-backup"
###########

#load balancer
lb_name = "sas2-balancer"

placement_group_name = "sas2-group"
###########

