# # Get Existing Subnet
# data "azurerm_subnet" "subnet" {
#   for_each = var.vms

#   name                 = each.value.subnet_name
#   virtual_network_name = each.value.vnet_name
#   resource_group_name  = each.value.rg_name
# }

# # Get Existing public IP

# data "azurerm_public_ip" "pip" {
#   for_each = var.vms

#   name                = each.value.pip_name
#   resource_group_name = each.value.rg_name

# }
