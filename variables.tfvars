## PROJECT BASE

cluster_name = "pegasus"
environment  = "staging"
project      = "devops"
aws_region   = "us-east-2"
az1          = "us-east-2a"
az2          = "us-east-2b"

## CLUSTER OPTIONS

k8s_version = "1.32"

endpoint_private_access = true

instance_type = [
  "m5a.large"
]

desired_size = "1"
min_size     = "1"
max_size     = "1"

enabled_cluster_log_types = [
  "api", "audit", "authenticator", "controllerManager", "scheduler"
]

create_cluster_access_entry           = false
cluster_role_or_user_arn_access_entry = ["arn:aws:iam::AWS_ACCOUNT_ID:role/AWS_ROLE_NAME"]

addon_csi_version       = "v1.41.0-eksbuild.1"
addon_cni_version       = "v1.19.3-eksbuild.1"
addon_coredns_version   = "v1.11.4-eksbuild.2"
addon_kubeproxy_version = "v1.32.3-eksbuild.2"

## INGRESS OPTIONS (ISTIO NLB)

nlb_ingress_internal = false
enable_cross_zone_lb = true
nlb_ingress_type     = "network"
proxy_protocol_v2    = false
grafana_virtual_service_host = "grafana.sevira.cloud"
# kiali_virtual_service_host   = "kiali.sevira.cloud"
# jaeger_virtual_service_host  = "jaeger.sevira.cloud"
argocd_virtual_service_host  = "argocd.sevira.cloud"

## KARPENTER OPTIONS

karpenter_instance_class = [
  "m5",
  "c5",
  "t3a"
]
karpenter_instance_size = [
  "large",
  "2xlarge"
]
karpenter_capacity_type = [
  "spot"
]
karpenter_azs = [
  "us-east-2a",
  "us-east-2b"
]

## NETWORKING

vpc_cidr                = "10.0.0.0/16"
public_subnet_az1_cidr  = "10.0.16.0/20"
public_subnet_az2_cidr  = "10.0.32.0/20"
private_subnet_az1_cidr = "10.0.48.0/20"
private_subnet_az2_cidr = "10.0.64.0/20"
