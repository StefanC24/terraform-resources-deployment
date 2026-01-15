resource "azurerm_key_vault" "key_vault" {
    name                        = "kv${random_string.kv_name.result}"
    location                    = azurerm_resource_group.resource_group.location
    resource_group_name         = azurerm_resource_group.resource_group.name
    enabled_for_disk_encryption = true
    tenant_id                   = "104e77d4-81e7-4c16-ab44-935220bed6dd"
    sku_name                    = "standard"
    purge_protection_enabled    = false

    access_policy {
        tenant_id = "104e77d4-81e7-4c16-ab44-935220bed6dd"
        object_id = "1a55ef0e-bda7-4c12-9f98-9440486bfe81"

        key_permissions = [
            "Get",
            "Create",
            "Delete",
            "List",
            "Update",
        ]

        secret_permissions = [
            "Get",
            "Set",
            "Delete",
            "List",
        ]
    }

    tags = {
        environment = "production"
    }
}

resource "random_string" "kv_name" {
    length  = 8
    special = false
    upper   = false
}
