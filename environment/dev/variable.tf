variable "rgs" {
  description = "This is rg variable"
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}

variable "virtual_networks" {
  description = "Complete configuration map for the Virtual Network"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

    address_space                  = optional(list(string))
    bgp_community                  = optional(string)
    dns_servers                    = optional(list(string))
    edge_zone                      = optional(string)
    flow_timeout_in_minutes        = optional(number)
    private_endpoint_vnet_policies = optional(string)
    tags                           = optional(map(string))

    ddos_protection_plan = optional(object({
      id     = string
      enable = bool
    }))
    encryption = optional(object({
      enforcement = string
    }))
    ip_address_pool = optional(list(object({
      id                     = string
      number_of_ip_addresses = string
    })))

    subnets = optional(map(object({
      name                                          = string
      address_prefixes                              = list(string)
   #   security_group                                = optional(string)
      default_outbound_access_enabled               = optional(bool, true)
      private_endpoint_network_policies             = optional(string, "disabled")
      private_link_service_network_policies_enabled = optional(bool, true)
    #  route_table_id                                = optional(string)
    #  service_endpoints                             = optional(list(string))
    #  service_endpoint_policy_ids                   = optional(list(string))
      # delegation = optional(list(object({
      #   name = string
      #   service_delegation = object({
      #     name    = string
      #     actions = optional(list(string))
      #   })
      # })))
    })))

   }))
}

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

# Map of VMS usine for_each
variable "vms" {
  type = map(object({

    nic_name               = string
    location               = string
    rg_name                = string
    pip_name               = string
    subnet_name            = string
    vnet_name              = string
    vm_name                = string
    size                   = string
    admin_username         = string
    admin_password         = string
    source_image_reference = map(string)

  }))

}


