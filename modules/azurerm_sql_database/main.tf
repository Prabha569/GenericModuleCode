resource "azurerm_mssql_database" "sql_db" {
  for_each = var.sql_dbs

  name         = each.value.sql_dbname
  server_id    = data.azurerm_mssql_server.sql_server[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = {
   environment = "Dev"
  }
}  

data "azurerm_mssql_server" "sql_server" {
  for_each = var.sql_dbs

  name                = each.value.server_name
  resource_group_name = each.value.rg_name
}