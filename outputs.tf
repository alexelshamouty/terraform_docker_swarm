data "google_compute_instance" "nat_ips" {
    name = "*"
    zone = var.gcp_zone
    depends_on = [
        "google_compute_instance.worker",
        "google_compute_instance.manager"
    ]
}

output "worker_ips" {
    value = "google_compute_instance.worker.*.network_interface.0.access_config.0.nat_ip"
}

output "managers_ips" {
    value = "google_compute_instance.manager.*.network_interface.0.access_config.0.nat_ip"
}