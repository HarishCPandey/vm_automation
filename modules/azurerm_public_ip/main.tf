resource "azurerm_public_ip" "frontend_pip" {
    name = var.fpip_name
    location = var.fpip_location
    resource_group_name = var.resource_group_name
    allocation_method = var.fpip_allocation_method
}