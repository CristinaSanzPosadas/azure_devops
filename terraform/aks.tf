resource "azurerm_kubernetes_cluster" "tf-aks" {
  name                = "casopractico2akscristina"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "casopractico2"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2ms"
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true

  tags = {
    environment = "casopractico2"
  }
}
