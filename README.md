![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)

# EKS-Baseline-with-Istio-Karpenter-ArgoCD

    # ISTIO-INGRESS
    # ISTIOD
    # ISTIO-BASE
    # KUBE-PROMETHEUS-STACK
    # ALB INGRESS CONTROLLER
    # METRICS SERVER
    # EKS ADDONS
    # KARPENTER
    # ARGOCD

> [!NOTE]
> Caso não utilize certificado do ACM, altere o resource "aws_lb_listener" "ingress_443" no arquivo 'nlb.tf' comentando as linhas 38, 39 e 40. Remova o comentário da linha 37. Caso utilize, altere o ARN na linha 39.

## ArgoCD ConfigMaps

> [!NOTE]
> As alterações nos ConfigMaps do Argo já estão feitas no manifesto 'argocd_install_2_10_5.yaml'. Mantendo essa nota apenas para conhecimento.

- Adicionar ao ConfigMap (argocd-cmd-params-cm):

```sh
kubectl edit cm argocd-cmd-params-cm -n argocd
```

```sh
data:
  server.insecure: 'true'
```

- Adicionar ao ConfigMap (argocd-cm):

```sh
kubectl edit cm argocd-cm -n argocd
```

```sh
data:
  application.resourceTrackingMethod: annotation
```

- Recuperar password ArgoCD:

```sh
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~> 1.14 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.66.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.15.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 1.14.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.32.0 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.12.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.vpc_iep_1](https://registry.terraform.io/providers/aws/latest/docs/resources/eip) | resource |
| [aws_eip.vpc_iep_2](https://registry.terraform.io/providers/aws/latest/docs/resources/eip) | resource |
| [aws_eks_addon.cni](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.coredns](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.csi_driver](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.kubeproxy](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_cluster.eks_cluster](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.cluster](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_instance_profile.karpenter](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_openid_connect_provider.eks](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_policy.aws_load_balancer_controller_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.csi_driver](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.karpenter_controller](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.aws_load_balancer_controller_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.csi_driver](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.alb_controller](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.argocd_image_updater](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_cluster_role](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_nodes_roles](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.karpenter_controller](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.aws_load_balancer_controller_attach](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cloudwatch](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cni](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.csi_default](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecr](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecr_access_origination](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-cluster-cluster](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-cluster-service](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.node](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ssm](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_internet_gateway.gw](https://registry.terraform.io/providers/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_kms_alias.eks](https://registry.terraform.io/providers/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.eks](https://registry.terraform.io/providers/aws/latest/docs/resources/kms_key) | resource |
| [aws_lb.istio_ingress](https://registry.terraform.io/providers/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.ingress_443](https://registry.terraform.io/providers/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.ingress_80](https://registry.terraform.io/providers/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.http](https://registry.terraform.io/providers/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group.https](https://registry.terraform.io/providers/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_nat_gateway.nat_az1](https://registry.terraform.io/providers/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_nat_gateway.nat_az2](https://registry.terraform.io/providers/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route.nat_access_az1](https://registry.terraform.io/providers/aws/latest/docs/resources/route) | resource |
| [aws_route.nat_access_az2](https://registry.terraform.io/providers/aws/latest/docs/resources/route) | resource |
| [aws_route.public_internet_access](https://registry.terraform.io/providers/aws/latest/docs/resources/route) | resource |
| [aws_route_table.igw_route_table](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.nat_az1](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.nat_az2](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private_az1](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_az2](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_az1](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_az2](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.cluster_nodes_sg](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.cluster_sg](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.cluster_ingress_https](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.nodeport](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.nodeport_cluster](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.nodeport_cluster_udp](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_subnet.private_subnet_az1](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_subnet_az2](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_az1](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_az2](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.cluster_vpc](https://registry.terraform.io/providers/aws/latest/docs/resources/vpc) | resource |
| [helm_release.alb_ingress_controller](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.istio_base](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.istio_ingress](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.istiod](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.karpenter](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.metrics_server](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.prometheus](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [kubectl_manifest.argocd](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.argocd_gw](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.argocd_ns](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.argocd_virtual_service](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.grafana_gateway](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.grafana_service](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.image_updater](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.istio_target_group_binding_http](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.istio_target_group_binding_https](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.karpenter-nodeclass](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.karpenter-nodepool-default](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubernetes_config_map.aws-auth](https://registry.terraform.io/providers/kubernetes/latest/docs/resources/config_map) | resource |
| [time_sleep.wait_30_seconds_karpenter](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [time_sleep.wait_40_seconds_albcontroller](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_eks_cluster_auth.default](https://registry.terraform.io/providers/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [aws_iam_policy_document.argocd_image_updater](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.aws_load_balancer_controller_assume_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.aws_load_balancer_controller_policy](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.csi_driver](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.eks_cluster_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.eks_nodes_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.karpenter_controller_assume_role_policy](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [kubectl_file_documents.argocd](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/data-sources/file_documents) | data source |
| [kubectl_file_documents.argocd_ns](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/data-sources/file_documents) | data source |
| [kubectl_file_documents.image_updater](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/data-sources/file_documents) | data source |
| [tls_certificate.eks](https://registry.terraform.io/providers/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_addon_cni_version"></a> [addon\_cni\_version](#input\_addon\_cni\_version) | CNI Version | `string` | n/a | yes |
| <a name="input_addon_coredns_version"></a> [addon\_coredns\_version](#input\_addon\_coredns\_version) | CoreDNS Version | `string` | n/a | yes |
| <a name="input_addon_csi_version"></a> [addon\_csi\_version](#input\_addon\_csi\_version) | CSI Version | `string` | n/a | yes |
| <a name="input_addon_kubeproxy_version"></a> [addon\_kubeproxy\_version](#input\_addon\_kubeproxy\_version) | Kubeproxy Version | `string` | n/a | yes |
| <a name="input_argocd_virtual_service_host"></a> [argocd\_virtual\_service\_host](#input\_argocd\_virtual\_service\_host) | n/a | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | n/a | yes |
| <a name="input_az1"></a> [az1](#input\_az1) | n/a | `string` | n/a | yes |
| <a name="input_az2"></a> [az2](#input\_az2) | n/a | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | n/a | `string` | n/a | yes |
| <a name="input_enable_cross_zone_lb"></a> [enable\_cross\_zone\_lb](#input\_enable\_cross\_zone\_lb) | n/a | `bool` | n/a | yes |
| <a name="input_enabled_cluster_log_types"></a> [enabled\_cluster\_log\_types](#input\_enabled\_cluster\_log\_types) | n/a | `list(string)` | n/a | yes |
| <a name="input_endpoint_private_access"></a> [endpoint\_private\_access](#input\_endpoint\_private\_access) | n/a | `bool` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_grafana_virtual_service_host"></a> [grafana\_virtual\_service\_host](#input\_grafana\_virtual\_service\_host) | n/a | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `list(string)` | n/a | yes |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | n/a | `string` | n/a | yes |
| <a name="input_karpenter_azs"></a> [karpenter\_azs](#input\_karpenter\_azs) | n/a | `list(any)` | n/a | yes |
| <a name="input_karpenter_capacity_type"></a> [karpenter\_capacity\_type](#input\_karpenter\_capacity\_type) | n/a | `list(any)` | n/a | yes |
| <a name="input_karpenter_instance_class"></a> [karpenter\_instance\_class](#input\_karpenter\_instance\_class) | n/a | `list(any)` | n/a | yes |
| <a name="input_karpenter_instance_size"></a> [karpenter\_instance\_size](#input\_karpenter\_instance\_size) | n/a | `list(any)` | n/a | yes |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | n/a | `string` | n/a | yes |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | n/a | `string` | n/a | yes |
| <a name="input_nlb_ingress_internal"></a> [nlb\_ingress\_internal](#input\_nlb\_ingress\_internal) | n/a | `bool` | n/a | yes |
| <a name="input_nlb_ingress_type"></a> [nlb\_ingress\_type](#input\_nlb\_ingress\_type) | n/a | `string` | n/a | yes |
| <a name="input_private_subnet_az1_cidr"></a> [private\_subnet\_az1\_cidr](#input\_private\_subnet\_az1\_cidr) | Private Subnet CIDR | `string` | n/a | yes |
| <a name="input_private_subnet_az2_cidr"></a> [private\_subnet\_az2\_cidr](#input\_private\_subnet\_az2\_cidr) | Private Subnet CIDR | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_proxy_protocol_v2"></a> [proxy\_protocol\_v2](#input\_proxy\_protocol\_v2) | n/a | `bool` | n/a | yes |
| <a name="input_public_subnet_az1_cidr"></a> [public\_subnet\_az1\_cidr](#input\_public\_subnet\_az1\_cidr) | Public Subnet CIDR | `string` | n/a | yes |
| <a name="input_public_subnet_az2_cidr"></a> [public\_subnet\_az2\_cidr](#input\_public\_subnet\_az2\_cidr) | Public Subnet CIDR | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | VPC CIDR | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |
| <a name="output_istio_ingress_nlb"></a> [istio\_ingress\_nlb](#output\_istio\_ingress\_nlb) | n/a |
<!-- END_TF_DOCS -->

---