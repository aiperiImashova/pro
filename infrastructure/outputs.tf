output "cluster_name" {
  description = "Имя созданного GKE кластера"
  value       = google_container_cluster.primary_cluster.name
}

output "cluster_endpoint" {
  description = "API endpoint GKE кластера"
  value       = google_container_cluster.primary_cluster.endpoint
}

output "client_certificate" {
  description = "Клиентский сертификат для подключения к кластеру"
  value       = google_container_cluster.primary_cluster.master_auth.0.client_certificate
}

output "network_name" {
  description = "Имя VPC сети"
  value       = google_compute_network.vpc_network.name
}

output "subnet_name" {
  description = "Имя подсети"
  value       = google_compute_subnetwork.vpc_subnet.name
}
