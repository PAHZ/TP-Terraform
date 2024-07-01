output "app_instance_ips" {
  value = [for instance in google_compute_instance.app_instances : instance.network_interface[0].network_ip]
}

output "db_instance_ips" {
  value = [for instance in google_compute_instance.db_instances : instance.network_interface[0].network_ip]
}

output "web_instance_ips" {
  value = [for instance in google_compute_instance.web_instances : instance.network_interface[0].network_ip]
}

output "load_balancer_ip" {
  value = google_compute_global_address.lb_address.address
}
