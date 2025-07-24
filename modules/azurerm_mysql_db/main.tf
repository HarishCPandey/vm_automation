variable "mssql_name" {
    type = string
}
variable "mssql_server_id" {
    type = string
}
variable "mssql_collation" {
    type = string
}
variable "mssql_license_type" {
    type = string
}
variable "mssql_max_size_gb" {
    type = string
}
variable "mssql_sku_name" {
    type = string
}
variable "enclave_type" {
    type = string
}
resource "azurerm_mssql_database" "todomysqldb" {
    name    = var.mssql_name
    server_id = var.mssql_server_id
    collation = var.mssql_collation
    license_type = var.mssql_license_type
    max_size_gb = var.mssql_max_size_gb
    sku_name = var.mssql_sku_name
    enclave_type = var.enclave_type
}