resource "azurerm_linux_virtual_machine" "fevmfortodoapp" {
  name                = var.fevm_name
  resource_group_name = var.fevm_rg_name
  location            = var.fevm_location
  size                = var.fevm_size
  admin_username      = var.fevm_username
  admin_password      = var.fevm_password
  disable_password_authentication = false  
  network_interface_ids = var.network_interface_id
  os_disk {
    caching              = var.fevm_caching
    storage_account_type = var.fevm_storage_account_type
  }

  source_image_reference {
    publisher = var.fevm_publisher
    offer     = var.fevm_offer
    sku       = var.fevm_sku
    version   = var.fevm_version
  }
  /*****Installing nginx after VM creation using custom_data****/
    custom_data = base64encode(<<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
    systemctl enable nginx
    systemctl start nginx
    EOF 
    )
}