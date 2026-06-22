![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)

# EKS-Baseline-with-Istio-Karpenter-ArgoCD

Baseline de um cluster Amazon EKS provisionado com OpenTofu/Terraform, já integrado com service mesh (Istio), autoscaling de nós (Karpenter), entrega contínua via GitOps (ArgoCD) e stack de observabilidade.

## Componentes

| Componente | Função |
|------------|--------|
| **Istio** (base, istiod, gateway) | Service mesh e ingress gateway para o tráfego do cluster |
| **Karpenter** | Autoscaling de nós sob demanda |
| **ArgoCD** | Entrega contínua via GitOps |
| **kube-prometheus-stack** | Observabilidade com Prometheus e Grafana |
| **AWS Load Balancer Controller** | Provisiona e gerencia NLB/ALB no cluster |
| **Metrics Server** | Métricas de recursos para HPA e `kubectl top` |
| **EKS Add-ons** | CNI, CoreDNS, kube-proxy e EBS CSI Driver |

> [!NOTE]
> O listener 443 é controlado pela variável `use_tls`. Quando `use_tls = true`, o NLB termina TLS usando o certificado informado em `certificate_arn` (ACM). Quando `use_tls = false`, a porta 443 é encaminhada como TCP puro (passthrough). Defina ambos os valores em `variables.tfvars`.

## Provisioning

```bash
tofu init
```

```bash
tofu plan --var-file variables.tfvars
```

```bash
tofu apply --var-file variables.tfvars
```

## ArgoCD

- Recuperar password inicial ArgoCD:

```sh
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```

