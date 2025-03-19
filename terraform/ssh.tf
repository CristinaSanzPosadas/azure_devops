resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_ssh_public_key" "ssh_key" {
  name                = "vm-ssh-key"
  resource_group_name = var.resource_group_name
  location            = var.location
  public_key          = tls_private_key.ssh_key.public_key_openssh

  tags = {
    environment = "casopractico2"
  }
}
