variable "fsn_name" {
    type = string
}
variable "fsn_virtual_network_name" {
    type = string
}
variable "fsn_resource_group_name" {
    type = string
}
variable "fsn_address_prefixes" {
    type = list(string)
}
resource "azurerm_subnet" "snfrontend" {
    name = var.fsn_name
    virtual_network_name = var.fsn_virtual_network_name
    resource_group_name = var.fsn_resource_group_name
    address_prefixes = var.fsn_address_prefixes
}