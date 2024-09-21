module "argocd" {
  source           = "./terraform_argocd_gcp"
  cluster_name     = "aiperi-1"
  chart_version    = "5.46.7"
  region           = "europe-west1"

}