# Simple for_each generic type--01

# resource "azurerm_resource_group" "rg" {
#   for_each = var.rgs

#   name       = each.value.name
#   location   = each.value.location
#   managed_by = each.value.managed_by
#   tags       = each.value.tags
# }

# Using try() functionl:-02

# resource "azurerm_resource_group" "rg" {
#   for_each = var.rgs

#   name       = each.value.name
#   location   = each.value.location
#   managed_by = try(each.value.managed_by, null )
#   tags       = try(each.value.tags, {} )
# }

# lookup() function use:-03
resource "azurerm_resource_group" "rg" {
  for_each = var.rgs

  name       = each.value.name
  location   = each.value.location
  managed_by = lookup(each.value, "managed_by", null)
  tags       = lookup(each.value, "tags", {} )
}


