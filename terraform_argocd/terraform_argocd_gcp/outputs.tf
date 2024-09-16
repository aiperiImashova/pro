output "argocd_version" {
  description = "Version of ArgoCD application installed"
  value       = helm_release.argocd.metadata[0].app_version
}

output "helm_revision" {
  description = "Revision of the Helm release"
  value       = helm_release.argocd.metadata[0].revision
}

output "chart_version" {
  description = "Version of the Helm chart used"
  value       = helm_release.argocd.metadata[0].version
}