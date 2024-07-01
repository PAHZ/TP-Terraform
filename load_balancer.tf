resource "google_compute_global_address" "lb_address" {
  name = "lb-address"
}

resource "google_compute_health_check" "default" {
  name               = "health-check"
  check_interval_sec = 5
  timeout_sec        = 5

  http_health_check {
    request_path = "/"
    port         = 80
  }
}

resource "google_compute_backend_service" "default" {
  name          = "backend-service"
  health_checks = [google_compute_health_check.default.self_link]

  backend {
    group = google_compute_instance_group.web_instance_group.self_link
  }
}

resource "google_compute_url_map" "default" {
  name            = "url-map"
  default_service = google_compute_backend_service.default.self_link
}

resource "google_compute_target_http_proxy" "default" {
  name   = "http-proxy"
  url_map = google_compute_url_map.default.self_link
}

resource "google_compute_global_forwarding_rule" "default" {
  name        = "forwarding-rule"
  ip_address  = google_compute_global_address.lb_address.address
  ip_protocol = "TCP"
  port_range  = "80"
  target      = google_compute_target_http_proxy.default.self_link
}
