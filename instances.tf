data "google_compute_image" "debian_image" {
  family  = "debian-10"
  project = "debian-cloud"
}

resource "google_compute_instance" "app_instances" {
  count        = var.app_instance_count
  name         = "app-instance-${count.index}"
  machine_type = var.machine_type
  tags         = ["app", "tp1"]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian_image.self_link
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.app_subnet.self_link
  }
}

resource "google_compute_instance" "web_instances" {
  count        = var.web_instance_count
  name         = "web-instance-${count.index}"
  machine_type = var.machine_type
  tags         = ["web", "tp1"]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian_image.self_link
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.web_subnet.self_link
  }
}

resource "google_compute_instance" "db_instances" {
  count        = var.create_db_instances ? var.db_instance_count : 0
  name         = "db-instance-${count.index}"
  machine_type = var.machine_type
  tags         = ["db", "tp1"]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian_image.self_link
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.db_subnet.self_link
  }
}

resource "google_compute_instance_group" "web_instance_group" {
  name        = "web-instance-group"
  zone        = var.zone
  instances   = [for i in google_compute_instance.web_instances : i.id]
  named_port {
    name = "http"
    port = 80
  }
}
