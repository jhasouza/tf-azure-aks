#AZURE AKS

#Resource Group
resource "azurerm_resource_group" "resource_group" {
  name     = "${var.resource_group_name_prefix}-${var.resource_group_name}"
  location = var.resource_group_location
}

#AKS
resource "azurerm_kubernetes_cluster" "cluster" {
  name                = var.cluster_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = var.node_pool_name
    node_count = var.pool_node_count
    vm_size    = var.vm_size
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

#Local File > Saída do kubeconfig
resource "local_file" "kube_config" {
  content  = azurerm_kubernetes_cluster.cluster.kube_config_raw
  filename = "kubeconfig"
}
