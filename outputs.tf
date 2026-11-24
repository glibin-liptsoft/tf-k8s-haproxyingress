# outputs.tf

output "namespace" {
  description = "Namespace where HAProxy is installed"
  value       = helm_release.this.namespace
}

output "release_name" {
  description = "Helm release name"
  value       = helm_release.this.name
}
