resource "hcloud_load_balancer" "lb" {
  name               = "${terraform.workspace}-load_balancer"
  load_balancer_type = "lb11"
  location           = "fsn1"
  delete_protection  = true
}


resource "hcloud_load_balancer_target" "load_balancer_target" {
  type             = "server"
  load_balancer_id = hcloud_load_balancer.lb.id
  server_id        = hcloud_server.app.id
  use_private_ip   = true
}

resource "hcloud_load_balancer_network" "srvnetwork" {
  load_balancer_id = hcloud_load_balancer.lb.id
  subnet_id        = hcloud_network_subnet.private_subnet.id
  ip               = "10.0.0.6"
}

resource "hcloud_load_balancer_service" "load_balancer_service_1" {
  load_balancer_id = hcloud_load_balancer.lb.id
  protocol         = "https"

  http {
    certificates = [var.globalbet_cert]

  }

  health_check {
    protocol = "http"
    port     = 443
    interval = 15
    timeout  = 10
    retries  = 3

    http {
      path         = "/engine/time"
      tls          = true
      status_codes = ["2??", "3??"]
    }
  }
}

resource "hcloud_load_balancer_service" "load_balancer_service_2" {
  load_balancer_id = hcloud_load_balancer.lb.id
  protocol         = "http"

  health_check {
    protocol = "http"
    port     = 80
    interval = 15
    timeout  = 10
    retries  = 3

    http {
      path         = "/"
      tls          = true
      status_codes = ["2??", "3??"]
    }
  }
}