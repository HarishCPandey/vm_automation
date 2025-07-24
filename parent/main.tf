module "call_rg_child" {
    source = "../modules/azurerm_resource_group/"

    rg_name = "rgfortodoapp"
    rg_location = "Australia East"
}
module "call_vn_child" {
    depends_on = [ module.call_rg_child ]
    source = "../modules/azurerm_virtual_network"
    vn_name = "vnfortodoapp"
    vn_location = "Australia East"
    vn_resource_group_name = "rgfortodoapp"
    vn_address_space = [ "10.0.0.0/16" ]
}
module "call_fesn_child" {
    depends_on = [module.call_vn_child]
    source = "../modules/azurerm_subnet"
    fsn_name = "frontend_sn_fortodoapp"
    fsn_virtual_network_name = "vnfortodoapp"
    fsn_resource_group_name = "rgfortodoapp"
    fsn_address_prefixes = ["10.0.1.0/28"]
}

module "call_fepip" {
    source = "../modules/azurerm_public_ip"
    depends_on = [ module.call_fesn_child ]
    fpip_name = "todo_frontend_public_ip"
    fpip_location = "Australia East"
    resource_group_name = "rgfortodoapp"
    fpip_allocation_method = "Static"
}
module "call_fe_nic" {
    source = "../modules/azurerm_nic"
    depends_on = [module.call_fepip, module.call_fesn_child, module.call_rg_child]
    frontend_nic_name = "todo_frontend_nic"
    frontend_nic_location = "Australia East"
    frontend_nic_resource_group_name = "rgfortodoapp"
    ipconfig_name =  "Internal"
    /*** Attaching subnet resource_id to NIC using Data block***/
    fe_subnet_id = data.azurerm_subnet.fsubnet_data.id
    /***********************************************************/

    /*** Attaching public_ip resource_id to NIC using Data block***/
    pipid = data.azurerm_public_ip.fpublic_ip_data.id
    /**************************************************************/
    fpip_address_allocation = "Dynamic"
}
module "call_fe_vm" {
    source = "../modules/azurerm_linux_virtual_machine"
    depends_on = [module.call_fepip, module.call_fesn_child, module.call_rg_child,module.call_fe_nic]
    fevm_name = "todofrontendvm"
    fevm_rg_name = "rgfortodoapp"
    fevm_location = "Australia East"
    fevm_size = "Standard_F2"
    fevm_username = "adminuser"
    //fevm_password = data.azurerm_key_vault_secret.keyvault_secret_password.value
    fevm_password = "admin@123456"
    fevm_caching = "ReadWrite"
    fevm_storage_account_type = "Standard_LRS"
    fevm_publisher = "Canonical"
    fevm_offer = "0001-com-ubuntu-server-jammy"
    fevm_sku = "22_04-lts"
    fevm_version = "latest"
    network_interface_id = [
    data.azurerm_network_interface.fnetwork_interface.id,
  ]

 }

module "call_sql_server" {
    depends_on = [module.call_rg_child]
    source = "../modules/azurerm_mysql_server"
    server_name = "mytodomysqlserver"
    server_location = "Australia East"
    rg_name = "rgfortodoapp"
    server_version = "12.0"
    admin_login = "adminuser"
    admin_password = "admin@123456"
}
module "call_sql_database" {
    depends_on = [module.call_fesn_child, module.call_sql_server]
    source = "../modules/azurerm_mysql_db"
    mssql_name = "mytodomysqldb"
    mssql_server_id = data.azurerm_mssql_server.todosqlserverdata.id
    mssql_collation = "SQL_Latin1_General_CP1_CI_AS"
    mssql_license_type = "LicenseIncluded"
    mssql_max_size_gb = "2"
    mssql_sku_name = "S0"
    enclave_type = "VBS"
}
