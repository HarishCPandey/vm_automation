data "azurerm_subnet" "fsubnet_data" {
    depends_on = [module.call_fepip, module.call_fesn_child, module.call_rg_child]
    name = "frontend_sn_fortodoapp"
    virtual_network_name = "vnfortodoapp"
    resource_group_name = "rgfortodoapp"
}
data "azurerm_public_ip" "fpublic_ip_data" {
    depends_on = [module.call_fepip, module.call_fesn_child, module.call_rg_child]
    name = "todo_frontend_public_ip"
    resource_group_name = "rgfortodoapp"
}
data "azurerm_network_interface" "fnetwork_interface" {
    depends_on = [module.call_fepip, module.call_fesn_child, module.call_rg_child,module.call_fe_nic]
    name = "todo_frontend_nic"
    resource_group_name = "rgfortodoapp"
}
data "azurerm_mssql_server" "todosqlserverdata" {
    depends_on = [module.call_rg_child,module.call_sql_server]
    name = "mytodomysqlserver"
    resource_group_name = "rgfortodoapp"
}
/*
data "azurerm_key_vault" "mykv" {
  name                = "keyvaultyami"
  resource_group_name = "keyvaultrg"
}
data "azurerm_key_vault_secret" "keyvault_secret_password" {
  name         = "newkv"
  key_vault_id = data.azurerm_key_vault.mykv.id
} */
#data "azurerm_key_vault_secret" "keyvault_secret_username" {
 # name         = "newkv"
 # key_vault_id = data.azurerm_key_vault.mykv.id
#}