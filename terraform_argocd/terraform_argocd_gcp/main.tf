data "google_container_cluster" "gcp_cluster" {
  name     = var.cluster_name
  location = var.region
}

provider "kubernetes" {
  host                   = data.google_container_cluster.gcp_cluster.endpoint
  token                  = data.google_container_cluster.gcp_cluster.master_auth[0].access_token
  cluster_ca_certificate = base64decode(data.google_container_cluster.gcp_cluster.master_auth[0].cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = data.google_container_cluster.gcp_cluster.endpoint
    token                  = data.google_container_cluster.gcp_cluster.master_auth[0].access_token
    cluster_ca_certificate = base64decode(data.google_container_cluster.gcp_cluster.master_auth[0].cluster_ca_certificate)
  }
}

resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  version          = var.chart_version
  create_namespace = true
  values           = [file("${path.module}/argocd.yaml")]
}
