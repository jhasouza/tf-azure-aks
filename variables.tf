variable "resource_group_name_prefix" {
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "resource_group_name" {
  default = "azure-k8stest"
}

variable "resource_group_location" {
  default     = "eastus"
  description = "Location of the resource group."
}

variable "pool_node_count" {
  default = 3
}

variable "cluster_name" {
  default = "k8stest"
}

variable "node_pool_name" {
  default = "agentpool"
}

variable "dns_prefix" {
  default = "k8stest"
}

variable "vm_size" {
  default = "Standard_D2ds_v5"
}
