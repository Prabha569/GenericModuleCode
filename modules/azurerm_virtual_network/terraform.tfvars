# virtual_networks = {
#   "vnet1" = {
#     name                = "vnet-prabha"
#     location            = "Central India"
#     resource_group_name = "rg-prabha"

#     address_space                  = ["10.0.0.0/16"]
#     bgp_community                  = null
#     dns_servers                    = ["10.0.0.4", "10.0.0.5"]
#     edge_zone                      = null
#     flow_timeout_in_minutes        = null
#     private_endpoint_vnet_policies = "Disabled"

#     tags = {
#       environment = "dev"
#       owner       = "team-azure"
#       project     = "demo"
#     }
#     ddos_protection_plan = null
#     encryption = {
#       enforcement = "AllowUnencrypted"
#     }
#     # ip_address_pool = [{
#     #   id                     = "pool-01"
#     #   number_of_ip_addresses = "256"
#     # }]

#     subnets = {
#       "subnet1" = {
#         name                                          = "frontend-subnet"
#         address_prefixes                              = ["10.0.1.0/24"]
#         private_endpoint_network_policies             = "Disabled" # Required
#         private_link_service_network_policies_enabled = false      # Default false
#       }
#       "subnet2" = {
#         name                                          = "backend-subnet"
#         address_prefixes                              = ["10.0.2.0/24"]
#         private_endpoint_network_policies             = "Disabled" # Required
#         private_link_service_network_policies_enabled = false      # Default false
#       }
#     }
#   }

#   "vnet2" = {
#     name                = "vnet-prabha10"
#     location            = "East US"
#     resource_group_name = "rg-prabha10"

#     address_space                  = ["10.0.0.0/16"]
#     bgp_community                  = null
#     dns_servers                    = ["10.0.0.4", "10.0.0.5"]
#     edge_zone                      = null
#     flow_timeout_in_minutes        = null
#     private_endpoint_vnet_policies = "Disabled"

#     tags = {
#       environment = "prod"
#       owner       = "team-azure"
#       project     = "demo"
#     }
#     ddos_protection_plan = null
#     encryption = {
#       enforcement = "AllowUnencrypted"
#     }
#     # ip_address_pool = [{
#     #   id                     = "pool-01"
#     #   number_of_ip_addresses = "256"
#     # }]

#     subnets = {
#       "subnet1" = {
#         name                                          = "frontend-subnet10"
#         address_prefixes                              = ["10.0.1.0/24"]
#         private_endpoint_network_policies             = "Disabled" # Required
#         private_link_service_network_policies_enabled = false      # Default false
#       }
#       "subnet2" = {
#         name                                          = "backend-subnet10"
#         address_prefixes                              = ["10.0.2.0/24"]
#         private_endpoint_network_policies             = "Disabled" # Required
#         private_link_service_network_policies_enabled = false      # Default false
#       }
#     }
#   }

# }
