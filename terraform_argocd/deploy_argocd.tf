module "argocd" {
  source           = "./terraform_argocd_gcp"
  cluster_name     = "a-cluster"
  chart_version    = "5.46.7"
  region           = "europe-west1"

}