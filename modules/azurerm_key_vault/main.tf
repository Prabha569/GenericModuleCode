resource "azurerm_key_vault" "kv" {
  for_each = var.key_vaults

  name                = each.value.kv_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  sku_name            = "standard"
  tenant_id           = data.azurerm_client_config.current.tenant_id

  enabled_for_deployment          = lookup(each.value, "enabled_for_deployment", false)
  enabled_for_disk_encryption     = lookup(each.value, "enabled_for_disk_encryption", true)
  enabled_for_template_deployment = lookup(each.value, "enabled_for_template_deployment", false)
  rbac_authorization_enabled      = lookup(each.value, "rbac_authorization_enabled", false)
  purge_protection_enabled        = lookup(each.value, "purge_protection_enabled", false)
  public_network_access_enabled   = lookup(each.value, "public_network_access_enabled", true)
  soft_delete_retention_days      = lookup(each.value, "soft_delete_retention_days", 7)
  tags                            = lookup(each.value, "tag', {}")


  dynamic "access_policy" {
    for_each = each.value.access_policy != [] ? each.value.access_policy : []
    content {
      tenant_id = data.azurerm_client_config.current.tenant_id
      object_id = data.azurerm_client_config.current.object_id

      application_id          = lookup(access_policy.value, "application_id", null)
      certificate_permissions = access_policy.value.certificate_permissions
      key_permissions         = access_policy.value.key_permissions
      secret_permissions      = access_policy.value.secret_permissions
      storage_permissions     = access_policy.value.storage_permissions
    }
  }

  dynamic "network_acls" {
    for_each = each.value.network_acls != null ? [each.value.network_acls] : []
    content {
      bypass                     = network_acls.value.bypass
      default_action             = network_acls.value.default_action
      ip_rules                   = network_acls.value.ip_rules
      virtual_network_subnet_ids = network_acls.value.virtual_network_subnet_ids
    }
  }
}


























#     secret_permissions = [
#       "Get",
#       "Backup",
#       "Delete",
#       "List",
#       "Purge",
#       "Recover",
#       "Restore",
#       "Set"
#     ]

#     storage_permissions = [
#       "Get",
#     ]
#   }
# }
