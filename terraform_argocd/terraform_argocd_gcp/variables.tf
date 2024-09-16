variable "cluster_name" {
  description = "GKE Cluster name to deploy ArgoCD"
  type        = string
}

variable "region" {
  description = "The region where the GKE cluster is located"
  type        = string
}

variable "chart_version" {
  description = "Helm Chart Version of ArgoCD"
  type        = string
  default     = "5.46.0"
}
