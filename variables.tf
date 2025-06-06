variable "cluster_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "project" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "az1" {
  type = string
}

variable "az2" {
  type = string
}

variable "k8s_version" {
  type = string
}

variable "instance_type" {
  type = list(string)
}

variable "enabled_cluster_log_types" {
  type = list(string)
}

variable "create_cluster_access_entry" {
  description = "Flag to indicate whether to create additional IAM access entries for the cluster."
  type        = bool
  default     = false
}

variable "cluster_role_or_user_arn_access_entry" {
  description = "List of IAM Role or User ARNs to grant cluster access."
  type        = list(string)
  default     = ["arn:aws:iam::ACCOUNT_ID:user/USER1"]
}

variable "endpoint_private_access" {
  type = bool
}

variable "desired_size" {
  type = string
}

variable "min_size" {
  type = string
}

variable "max_size" {
  type = string
}

variable "karpenter_instance_class" {
  type = list(any)
}

variable "karpenter_instance_size" {
  type = list(any)
}

variable "karpenter_capacity_type" {
  type = list(any)
}

variable "karpenter_azs" {
  type = list(any)
}

variable "grafana_virtual_service_host" {
  type = string
}

# variable "kiali_virtual_service_host" {
#   type = string
# }

variable "argocd_virtual_service_host" {
  type = string
}

# variable "jaeger_virtual_service_host" {
#   type = string
# }

variable "nlb_ingress_internal" {
  type = bool
}

variable "enable_cross_zone_lb" {
  type = bool
}

variable "nlb_ingress_type" {
  type = string
}

variable "proxy_protocol_v2" {
  type = bool
}

variable "addon_cni_version" {
  type        = string
  description = "CNI Version"
}

variable "addon_coredns_version" {
  type        = string
  description = "CoreDNS Version"
}

variable "addon_kubeproxy_version" {
  type        = string
  description = "Kubeproxy Version"
}

variable "addon_csi_version" {
  type        = string
  description = "CSI Version"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
}

variable "public_subnet_az1_cidr" {
  type        = string
  description = "Public Subnet CIDR"
}

variable "public_subnet_az2_cidr" {
  type        = string
  description = "Public Subnet CIDR"
}

variable "private_subnet_az1_cidr" {
  type        = string
  description = "Private Subnet CIDR"
}

variable "private_subnet_az2_cidr" {
  type        = string
  description = "Private Subnet CIDR"
}
