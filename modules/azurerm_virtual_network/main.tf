resource "azurerm_virtual_network" "vn" {
    name = var.vn_name
    location = var.vn_location
    resource_group_name = var.vn_resource_group_name
    address_space = var.vn_address_space
}