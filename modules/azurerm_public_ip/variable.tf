variable "public_ips" {
  description = "Map of public IP configurations."
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string # Static or Dynamic

    domain_name_label       = optional(string)
    domain_name_label_scope = optional(string)
    edge_zone               = optional(string)
    public_ip_prefix_id     = optional(string)
    reverse_fqdn            = optional(string)
    ddos_protection_plan_id = optional(string)
    ddos_protection_mode    = optional(string, "VirtualNetworkInherited")
    idle_timeout_in_minutes = optional(number, 4)
    sku                     = optional(string, "Standard")
    sku_tier                = optional(string, "Regional")
    ip_version              = optional(string, "IPv4")
    ip_tags                 = optional(map(string))
    zones                   = optional(list(string))
    tags                    = optional(map(string))
    
  }))
}
