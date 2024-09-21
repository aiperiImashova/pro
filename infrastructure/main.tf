# Создаем VPC
resource "google_compute_network" "vpc_network" {
  name = var.network_name
  auto_create_subnetworks = false
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

  initial_node_count = 1  
  node_config {
    machine_type = var.node_machine_type
    disk_size_gb = 20  # Уменьшите размер диска до 20 GB
  }
}

provider "kubernetes" {
  host                   = google_container_cluster.primary_cluster.endpoint
  cluster_ca_certificate = base64decode(google_container_cluster.primary_cluster.master_auth.0.cluster_ca_certificate)
  token                  = data.google_client_config.default.access_token
}

# Устанавливаем Helm
provider "helm" {
  kubernetes {
    host                   = google_container_cluster.primary_cluster.endpoint
    cluster_ca_certificate = base64decode(google_container_cluster.primary_cluster.master_auth.0.cluster_ca_certificate)
    token                  = data.google_client_config.default.access_token
  }
}

# Установка ArgoCD через Helm
resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = "argocd"
  create_namespace = true

  chart      = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  version    = "5.32.1"  # Укажите желаемую версию Helm-чарта

  set {
    name  = "server.service.type"
    value = "LoadBalancer"  # Установим тип сервиса как LoadBalancer для внешнего доступа
  }

  set {
    name  = "redis.enabled"
    value = "false"  # Выключим встроенный Redis (опционально)
  }
}
