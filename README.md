# tf-azure-aks
Módulo do Azure AKS com Terraform

Este módulo cria um cluster AKS com 1 ou mais nodes groups, além de importar para seu kubeconfig, as configurações de acesso ao cluster criado.

Exemplo de uso do módulo:

module "aks" {
source         = "git@github.com:TTech-CCoE/tf-azure-aks.git?ref=main"
