resource "azurerm_network_security_rule" "sac_network_security_rule_inbound" {
  name                        = "sac-testing-network-security-rule-inbound"
  resource_group_name         = azurerm_resource_group.sac_nsg_resource_group.name
  network_security_group_name = azurerm_network_security_group.sac_network_security_group.name
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "sac_network_security_rule_outbound" {
  name                        = "sac-testing-network-security-rule-outbound"
  resource_group_name         = azurerm_resource_group.sac_nsg_resource_group.name
  network_security_group_name = azurerm_network_security_group.sac_network_security_group.name
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}