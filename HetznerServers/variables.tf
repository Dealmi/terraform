# Servers names

variable "app_name" {
  description = "The name of the APP server"
  type        = string
}

variable "master_name" {
  description = "The name of the MASTER server"
  type        = string
}

variable "slave_name" {
  description = "The name of the SLAVE server"
  type        = string
}

variable "bastion_name" {
  description = "The name of the Bastion server"
  type        = string
}

# define variable image_name

variable "image_name" {
  description = "The name of the image"
  type        = string
}

# Servers types

variable "app_type" {
  description = "The type of the APP server"
  type        = string
}

variable "master_type" {
  description = "The type of the MASTER server"
  type        = string
}

variable "slave_type" {
  description = "The type of the SLAVE server"
  type        = string
}

variable "bastion_type" {
  description = "The type of the Bastion server"
  type        = string
}

#define variable datacenter in Hetzner Falkenstein

variable "datacenter" {
  description = "Falkenstein 1 virtual DC 14"
  type        = string
}


# define variable priv_network_name 

variable "priv_network_name" {
  description = "The name of the private network"
  type        = string
}

# define variables for volumes

variable "mysql_master_name" {
  description = "The name of the mysql master volume"
  type        = string
}

variable "mysql_slave_name" {
  description = "The name of the mysql slave volume"
  type        = string
}

variable "slave_backup_name" {
  description = "The name of the slave buckup volume"
  type        = string
}

#define variable for balancer

variable "lb_name" {
  description = "sas2 load balancer"
  type        = string
}

# placement group
variable "placement_group_name" {
  description = "placement group"
  type        = string
}

# We get the variable from shell script and .env file
variable "hcloud_token" {}

