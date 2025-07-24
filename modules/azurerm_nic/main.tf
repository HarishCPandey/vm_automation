resource "azurerm_network_interface" "frontend_nic" {
    name = var.frontend_nic_name
    location = var.frontend_nic_location
    resource_group_name = var.frontend_nic_resource_group_name

    ip_configuration {
        name = var.ipconfig_name
        subnet_id = var.fe_subnet_id
        public_ip_address_id = var.pipid
        private_ip_address_allocation = var.fpip_address_allocation
    }
}