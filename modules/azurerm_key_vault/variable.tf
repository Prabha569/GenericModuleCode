# variable "key_vaults" {
#   description = "Map of Key Vault configurations"
#   type = map(object({
#     kv_name                    = string
#     location                   = string
#     rg_name                    = string
#     enabled_for_disk_encryption = optional(bool)
#     soft_delete_retention_days  = optional(number)
#     purge_protection_enabled    = optional(bool)
#     sku_name                    = optional(string)
#     key_permissions             = optional(list(string))
#     secret_permissions          = optional(list(string))
#     storage_permissions         = optional(list(string))
#   }))
# }


variable "key_vaults" {
  description = "Map of Key Vault definitions"
  type = map(object({
    name                           = string
    location                       = string
    resource_group_name            = string
    sku_name                       = string
    tenant_id                      = string
    access_policy                  = optional(list(object({
      tenant_id               = string
      object_id               = string
      application_id          = optional(string)
      certificate_permissions = optional(list(string))
      key_permissions         = optional(list(string))
      secret_permissions      = optional(list(string))
      storage_permissions     = optional(list(string))
    })), [])
    enabled_for_deployment          = optional(bool, false)
    enabled_for_disk_encryption     = optional(bool, false)
    enabled_for_template_deployment = optional(bool, false)
    rbac_authorization_enabled      = optional(bool, false)
    purge_protection_enabled        = optional(bool, false)
    public_network_access_enabled   = optional(bool, true)
    soft_delete_retention_days      = optional(number, 90)
    network_acls = optional(object({
      bypass                     = string
      default_action              = string
      ip_rules                    = optional(list(string))
      virtual_network_subnet_ids  = optional(list(string))
    }))
    tags = optional(map(string), {})
  }))
}

