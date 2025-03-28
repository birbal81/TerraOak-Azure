resource "azurerm_resource_group" "sac_aks_resource_group" {
  name     = "sac-testing-aks-resource-group"
  location = "East US 2"
}

resource "azurerm_kubernetes_cluster" "sac_aks_cluster" {
  name                = "sac-testing-aks-cluster"
  location            = azurerm_resource_group.sac_aks_resource_group.location
  resource_group_name = azurerm_resource_group.sac_aks_resource_group.name
  dns_prefix = "sac-testing-cluster"
  
  default_node_pool {
    name       = "sacakspool"
    vm_size    = "Standard_D2_v2"
    node_count = 1
    enable_auto_scaling = false
    zones = []
  }

  local_account_disabled = false
  private_cluster_enabled = false

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "standard"
  }

  azure_active_directory_role_based_access_control {
    managed = true
    azure_rbac_enabled = false
  }
}