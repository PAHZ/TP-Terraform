resource "google_compute_network" "vpc_tp" {
  name                    = "vpc-tp"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "app_subnet" {
  name          = "app-subnet"
  network       = google_compute_network.vpc_tp.self_link
  ip_cidr_range = "10.0.1.0/24"
}

resource "google_compute_subnetwork" "db_subnet" {
  name          = "db-subnet"
  network       = google_compute_network.vpc_tp.self_link
  ip_cidr_range = "10.0.2.0/24"
}

resource "google_compute_subnetwork" "web_subnet" {
  name          = "web-subnet"
  network       = google_compute_network.vpc_tp.self_link
  ip_cidr_range = "10.0.3.0/24"
}
