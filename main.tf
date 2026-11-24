# main.tf
resource "kubernetes_namespace" "this" {
  metadata {
    name   = var.namespace
    labels = var.ns_labels
  }
}

resource "helm_release" "this" {
  name       = var.name
  namespace  = var.namespace
  chart      = "${path.module}/helm-chart"

  create_namespace = true
  wait             = true
  timeout          = 600

  values = [
    templatefile("${path.module}/ingress-controller.tftpl", {
      ingress_controller_kind   = var.ingress_controller_kind
      replica_count             = var.replica_count
      ingress_class_name        = var.ingress_class_name
      service_type              = var.service_type
      service_annotations       = var.service_annotations
      load_balancer_ip          = var.load_balancer_ip
      src_ip_header             = var.src_ip_header
      log_format                = var.log_format
      tolerations               = var.tolerations
      affinity                  = var.affinity
    })
  ]
}