resource "azurerm_container_registry" "acr" {
  name                     = "casopractico2acrcristina"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sku                      = "Basic"
  admin_enabled            = true

  tags = {
    environment = "casopractico2"
  }
}
