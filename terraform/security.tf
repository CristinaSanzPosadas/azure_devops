resource "azurerm_network_security_group" "nsg" {
  name                = "vm-security-group"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = {
    environment = "casopractico2"
  }
}

resource "azurerm_network_security_rule" "ssh" {
  name                        = "allow_ssh"
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.nsg.name
  resource_group_name         = var.resource_group_name
}

resource "azurerm_network_security_rule" "http" {
  name                        = "allow_http"
  priority                    = 1002
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.nsg.name
  resource_group_name         = var.resource_group_name
}

resource "azurerm_public_ip" "vm_ip" {
  name                = "vm-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"

  tags = {
    environment = "casopractico2"
  }
}

resource "azurerm_network_interface" "nic" {
  name                = "vm-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "vm-nic-configuration"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_ip.id
  }

  tags = {
    environment = "casopractico2"
  }
}

resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
