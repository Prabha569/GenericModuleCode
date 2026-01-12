  
# #  Simple Virtual Network Generic module: TYPE:-01

# resource "azurerm_virtual_network" "vnet" {
#   for_each = var.virtual_networks

#   name                           = each.value.name
#   location                       = each.value.location
#   resource_group_name            = each.value.resource_group_name
#   address_space                  = each.value.address_space
#   dns_servers                    = each.value.dns_servers
#   bgp_community                  = each.value.bgp_community
#   edge_zone                      = each.value.edge_zone
#   flow_timeout_in_minutes        = each.value.flow_timeout_in_minutes
#   private_endpoint_vnet_policies = each.value.private_endpoint_vnet_policies
#   tags                           = each.value.tags

#   dynamic "ddos_protection_plan" {
#     for_each = each.value.ddos_protection_plan == null ? [] : [each.value.ddos_protection_plan]
#     content {
#       id     = ddos_protection_plan.value.id
#       enable = ddos_protection_plan.value.enable
#     }
#   }
#   dynamic "encryption" {
#     for_each = each.value.encryption == null ? [] : [each.value.encryption]
#     content {
#       enforcement = encryption.value.enforcement
#     }
#   }
#   dynamic "ip_address_pool" {
#     for_each = each.value.ip_address_pool != null ? each.value.ip_address_pool : []
#     content {
#       id                     = ip_address_pool.value.id
#       number_of_ip_addresses = ip_address_pool.value.number_of_ip_addresses
#     }
#   }

#   dynamic "subnet" {
#     for_each = each.value.subnets != null ? each.value.subnets : {}
#     content {
#       name                                          = subnet.value.name
#       address_prefixes                              = subnet.value.address_prefixes
#       default_outbound_access_enabled               = subnet.value.default_outbound_access_enabled
#       private_endpoint_network_policies             = subnet.value.private_endpoint_network_policies
#       private_link_service_network_policies_enabled = subnet.value.private_link_service_network_policies_enabled
#     }

#   }

# }


  
  # USES OF LOOKUP() FUNCTION CODE: TYPE-02

# resource "azurerm_virtual_network" "vnet" {
#   for_each = var.virtual_networks

#   name                           = each.value.name
#   location                       = each.value.location
#   resource_group_name            = each.value.resource_group_name
#   address_space                  = each.value.address_space
#   dns_servers                    = lookup(each.value, "dns_servers", null)
#   bgp_community                  = lookup(each.value, "bgp_community", null)
#   edge_zone                      = lookup(each.value, "edge_zone", null)
#   flow_timeout_in_minutes        = lookup(each.value, "flow_timeout_in_minutes", null)
#   private_endpoint_vnet_policies = lookup(each.value, "private_endpoint_network_policies", "Disabled" )
#   tags                           = lookup(each.value, "tags", {} )

#   dynamic "ddos_protection_plan" {
#     for_each = lookup(each.value, "ddos_protection_plan", null ) != null ? [lookup(each.value, "ddos_protection_plan", null )] : [] 
#     content {
#       id     = ddos_protection_plan.value.id
#       enable = ddos_protection_plan.value.enable
#     }
#   }
#   dynamic "encryption" {
#     for_each = lookup(each.value, "encryption", null ) != null ? [each.value.encryption] : [] 
#     content {
#       enforcement = encryption.value.enforcement
#     }
#   }
#   dynamic "ip_address_pool" {
#     for_each = lookup(each.value, "ip_address_pool", null) != null ? each.value.ip_address_pool : []
#     content {
#       id                     = ip_address_pool.value.id
#       number_of_ip_addresses = ip_address_pool.value.number_of_ip_addresses
#     }
#   }

#   dynamic "subnet" {
#     for_each = lookup(each.value, "subnets", {} ) != null ? lookup(each.value, "subnets", {} ) : {}
#     content {
#       name                                          = subnet.value.name
#       address_prefixes                              = subnet.value.address_prefixes
#       default_outbound_access_enabled               = subnet.value.default_outbound_access_enabled
#       private_endpoint_network_policies             = subnet.value.private_endpoint_network_policies
#       private_link_service_network_policies_enabled = subnet.value.private_link_service_network_policies_enabled
#     }

#   }

# }

    # USES OF TRY() FUNCTION CODE: TYPE-03

resource "azurerm_virtual_network" "vnet" {
  for_each = var.virtual_networks

  name                           = each.value.name
  location                       = each.value.location
  resource_group_name            = each.value.resource_group_name
  address_space                  = each.value.address_space
  dns_servers                    = try(each.value.dns_servers, null )
  bgp_community                  = try(each.value.bgp_community, null)
  edge_zone                      = try(each.value.edge_zone, null )
  flow_timeout_in_minutes        = try(each.value.flow_timeout_in_minutes, null)
  private_endpoint_vnet_policies = try(each.value.private_endpoint_network_policies, "Disabled" )
  tags                           = lookup(each.value, "tags", {} )

  dynamic "ddos_protection_plan" {
    for_each = try(each.value.ddos_protection_plan, null) != null ? [each.value.ddos_protection_plan] : [] 
    content {
      id     = ddos_protection_plan.value.id
      enable = ddos_protection_plan.value.enable
    }
  }
  dynamic "encryption" {
    for_each = try(each.value.encryption, null ) != null ? [each.value.encryption] : [] 
    content {
      enforcement = encryption.value.enforcement
    }
  }
  dynamic "ip_address_pool" {
    for_each = lookup(each.value, "ip_address_pool", null) != null ? each.value.ip_address_pool : []
    content {
      id                     = ip_address_pool.value.id
      number_of_ip_addresses = ip_address_pool.value.number_of_ip_addresses
    }
  }

  dynamic "subnet" {
    for_each = lookup(each.value, "subnets", {} ) != null ? lookup(each.value, "subnets", {} ) : {}
    content {
      name                                          = subnet.value.name
      address_prefixes                              = subnet.value.address_prefixes
      default_outbound_access_enabled               = subnet.value.default_outbound_access_enabled
      private_endpoint_network_policies             = subnet.value.private_endpoint_network_policies
      private_link_service_network_policies_enabled = subnet.value.private_link_service_network_policies_enabled
    }

  }

}

