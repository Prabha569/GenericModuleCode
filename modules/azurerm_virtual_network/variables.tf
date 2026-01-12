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
