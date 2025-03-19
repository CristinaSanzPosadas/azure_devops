# Azure

output "subscription_id" {
  description = "ID de la suscripción de Azure"
  value       = var.subscription_id
  sensitive   = true
}

output "tenant_id" {
  description = "ID del Tenant de Azure"
  value       = var.tenant_id
  sensitive   = true
}

output "resource_group_name" {
  description = "El nombre del Resource Group creado"
  value       = var.resource_group_name
}

output "location" {
  description = "Ubicación"
  value       = var.location
}

# VM

output "vm_public_ip" {
  description = "IP pública de la VM"
  value       = azurerm_public_ip.vm_ip.ip_address
}

output "vm_name" {
  description = "Nombre de la Máquina Virtual"
  value       = azurerm_linux_virtual_machine.vm.name
}

output "ssh_private_key" {
  description = "Clave SSH privada para acceder a la VM"
  value       = tls_private_key.ssh_key.private_key_pem
  sensitive   = true
}

# ACR

output "acr_login_server" {
  description = "URL del servidor de login del ACR"
  value       = azurerm_container_registry.acr.login_server
}

# AKS

output "kubernetes_cluster_name" {
  description = "Nombre del clúster AKS"
  value       = azurerm_kubernetes_cluster.tf-aks.name
}

output "kube_config" {
  description = "Archivo de configuración de Kubeconfig"
  value       = azurerm_kubernetes_cluster.tf-aks.kube_config_raw
  sensitive   = true
}
