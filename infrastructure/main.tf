# Создаем VPC
resource "google_compute_network" "vpc_network" {
  name = var.network_name
}

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

  network    = google_compute_network.vpc_network.name
  subnetwork = google_compute_subnetwork.vpc_subnet.name

  initial_node_count = var.node_count

  node_config {
    machine_type = var.node_machine_type
    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append",
    ]
  }
}

# Создаем node pool (если нужно отдельным ресурсом)
# resource "google_container_node_pool" "primary_nodes" {
#   name       = "primary-node-pool"
#   cluster    = google_container_cluster.primary_cluster.name
#   location   = var.region
#   node_count = var.node_count

#   node_config {
#     machine_type = var.node_machine_type
#   }
# }