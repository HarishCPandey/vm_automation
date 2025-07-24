resource "azurerm_key_vault" "mykv" {
    name = "mylocalkv"
    location = "Central US"
    resource_group_name = "rgforkv"
    tenant_id = "57767752-6f22-443b-a9da-fe065c4f3994"
    sku_name = "standard"
    soft_delete_retention_days = 7
    purge_protection_enabled = true
}