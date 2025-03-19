resource "azurerm_role_assignment" "ra-perm" {
  principal_id         = azurerm_kubernetes_cluster.tf-aks.identity[0].principal_id
  role_definition_name = "AcrPull"
  scope               = azurerm_container_registry.acr.id
}
