# Создаем VPC
# resource "google_compute_network" "vpc_network" {
#   name = var.network_name
#   auto_create_subnetworks = false
# }

# Создаем подсеть
resource "google_compute_subnetwork" "vpc_subnet" {
  name          = var.subnet_name
  network       = google_compute_network.vpc_network.self_link
  ip_cidr_range = "10.0.0.0/16"
  region        = var.region
}

# Создаем GKE кластер
resource "google_container_cluster" "primary_cluster" {
  name     = var.cluster_name
  location = var.region

  # network    = google_compute_network.vpc_network.name
  subnetwork = google_compute_subnetwork.vpc_subnet.name

  initial_node_count = 1  
  node_config {
    machine_type = var.node_machine_type
    disk_size_gb = 20  # Уменьшите размер диска до 20 GB
  }
}

