
resource "azurerm_mssql_server" "todomysqlserver" {
    name = var.server_name
    location = var.server_location
    resource_group_name = var.rg_name
    version = var.server_version
    administrator_login = var.admin_login
    administrator_login_password = var.admin_password
}