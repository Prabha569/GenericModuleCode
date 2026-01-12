


# Generic module: TYPE:-01
# ========================
# resource "azurerm_public_ip" "pip" {
#   for_each = var.public_ips

#   name                = each.value.name
#   resource_group_name = each.value.resource_group_name
#   location            = each.value.location
#   allocation_method   = each.value.allocation_method

#   domain_name_label       = each.value.domain_name_label
#   domain_name_label_scope = each.value.domain_name_label_scope
#   edge_zone               = each.value.edge_zone
#   public_ip_prefix_id     = each.value.public_ip_prefix_id
#   reverse_fqdn            = each.value.reverse_fqdn
#   ddos_protection_mode    = each.value.ddos_protection_mode
#   ddos_protection_plan_id = each.value.ddos_protection_plan_id
#   idle_timeout_in_minutes = each.value.idle_timeout_in_minutes
#   # Smart SKU defaults and dependencies
#   sku        = each.value.sku
#   sku_tier   = each.value.sku_tier
#   ip_version = each.value.ip_version
#   ip_tags    = each.value.ip_tags
#   # Zones - length & lookup based logic
#   zones = each.value.zones
#   tags  = each.value.tags

# }

# Generic module:try() function:  TYPE:-02
# =======================================

# resource "azurerm_public_ip" "pip" {
#   for_each = var.public_ips

#   name                = try(each.value.name)
#   resource_group_name = try(each.value.resource_group_name)
#   location            = try(each.value.location)
#   allocation_method   = try(each.value.allocation_method)

#   domain_name_label       = try(each.value.domain_name_label, null )
#   domain_name_label_scope = try(each.value.domain_name_label_scope, null)
#   edge_zone               = try(each.value.edge_zone, null)
#   public_ip_prefix_id     = try(each.value.public_ip_prefix_id, null)
#   reverse_fqdn            = try(each.value.reverse_fqdn, null)
#   ddos_protection_mode    = try(each.value.ddos_protection_mode, "VirtualNetworkInherited")
#   ddos_protection_plan_id = try(each.value.ddos_protection_plan_id, null)
#   idle_timeout_in_minutes = try(each.value.idle_timeout_in_minutes, 4)
#   # Smart SKU defaults and dependencies
#   sku        = try(each.value.sku, "Standard")
#   sku_tier   = try(each.value.sku_tier, "Regional")
#   ip_version = try(each.value.ip_version, "IPv4")
#   ip_tags    = try(each.value.ip_tags, null)
#   # Zones - length & lookup based logic
#   zones = try(each.value.zones, null)
#   tags  = try(each.value.tags, {} )
# }

# Generic module: TYPE:-03
# ===========================

resource "azurerm_public_ip" "pip" {
  for_each = var.public_ips

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method

  domain_name_label       = lookup(each.value, "domain_name_label", null)
  domain_name_label_scope = lookup(each.value, "domain_name_label_scope", null)
  edge_zone               = lookup(each.value, "edge_zone", null)
  public_ip_prefix_id     = lookup(each.value, "public_ip_prefix_id", null)
  reverse_fqdn            = lookup(each.value, "reverse_fqdn", null)
  ddos_protection_mode    = lookup(each.value, "ddos_protection_mode", "VirtualNetworkInherited")
  ddos_protection_plan_id = lookup(each.value, "ddos_protection_plan_id", null)
  idle_timeout_in_minutes = lookup(each.value, "idle_timeout_in_minutes", 4)
  # Smart SKU defaults and dependencies
  sku        = lookup(each.value, "sku", "Standard")
  sku_tier   = lookup(each.value, "sku_tier", "Regional")
  ip_version = lookup(each.value, "ip_version", "IPv4")
  ip_tags    = lookup(each.value, "ip_tags", null)
  # Zones - length & lookup based logic
  zones = length(coalesce(each.value.zones, [])) > 0 ? coalesce(each.value.zones, []) : []
  tags  = lookup(each.value, "tags", {})

}
