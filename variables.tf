# variables.tf

variable "namespace" {
  description = "Kubernetes namespace for HAProxy Unified Gateway"
  type        = string
  default     = "haproxy-unified-gateway"
}

variable "name" {
  description = "Helm release name"
  type        = string
  default     = "haproxy-unified-gateway"
}

variable "ns_labels" {
  type        = map(string)
  description = "Map with labels for k8s namespace"
  default = {}
}

variable "ingress_controller_kind" {
  type    = string
  default = "Deployment"
}

variable "replica_count" {
  description = "Number of controller replicas"
  type        = number
  default     = 1
}

variable "ingress_class_name" {
  description = "Custom IngressClass name (analogous to ingressClass in NGINX). If empty, default is used."
  type        = string
}

variable "service_type" {
  description = "Kubernetes Service type (LoadBalancer, NodePort, ClusterIP)"
  type        = string
  default     = "LoadBalancer"
}

variable "service_annotations" {
  description = "Annotations for the controller Service"
  type        = map(string)
  default     = {}
}

variable "load_balancer_ip" {
  type        = string
  description = "IP address for creating LoadBalancer with NLB, on k8s"
}

variable "src_ip_header" {
  description = "Enable passing real client IP (analogous to enable-real-ip in NGINX)"
  type        = string
  default     = ""
}


variable "log_format" {
  description = "Custom log format string (analogous to log-format-upstream in NGINX). If empty, default is used."
  type        = string
  default     = ""
}

variable "log_level" {
  description = "Controller log level (e.g., Info, Debug)"
  type        = string
  default     = "Info"
}

variable "tolerations" {
  description = <<EOF
    Node tolerations for server scheduling to nodes with taints
    Ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/
    Example value:
      - key: app
        operator: Equal
        value: infra
        effect: NoSchedule
  EOF
  type        = string
  default     = ""
}

variable "affinity" {
  description = <<EOF
    Affinity and anti-affinity rules for server scheduling to nodes
    Ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity
    Example value:
      nodeAffinity:
        preferredDuringSchedulingIgnoredDuringExecution:
          - weight: 100
            preference:
              matchExpressions:
              - key: "app"
                operator: "In"
                values:
                - "infra"
  EOF
  type        = string
  default     = ""
}