#AZURE AKS

#Resource Group
resource "azurerm_resource_group" "iac_aks" {
  name     = "iac_aks"
  location = "eastus"
}

#AKS
resource "azurerm_kubernetes_cluster" "ttech_aks" {
  name                = "ttech_aks_poc"
  location            = azurerm_resource_group.ttech_iac.location
  resource_group_name = azurerm_resource_group.ttech_iac.name
  dns_prefix          = "ttechakspoc" #Opcional

  default_node_pool {
    name       = "agentpool"
    node_count = 3
    vm_size    = "Standard_D2ds_v5"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Name        = "T-Tech IaC AKS Poc"
    Owner       = "T-Tech"
    Project     = "IaC"
    Environment = "POC"
  }
}

#Output
#output "kube_config" {
#  value = azurerm_kubernetes_cluster.ttech_aks.kube_config_raw
#}

#Local File > Saída do kubeconfig
resource "local_file" "kube_config" {
  content  = azurerm_kubernetes_cluster.ttech_aks.kube_config_raw
  filename = "kubeconfig"
}