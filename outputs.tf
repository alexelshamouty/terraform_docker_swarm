data "google_compute_instance" "nat_ips" {
    name = "*"
    zone = var.gcp_zone
    depends_on = [
        "google_compute_instance.workers",
        "google_compute_instance.managers"
    ]
}

output "worker_ips" {
    value = "google_compute_instance.workers.*.network_interface.0.access_config.0.nat_ip"
}

output "managers_ips" {
    value = "google_compute_instance.managers.*.network_interface.0.access_config.0.nat_ip"
}