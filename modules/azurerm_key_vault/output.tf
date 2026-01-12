output "kv_ids" {

value = { for key, kv in azurerm_key_vault.kv : key => kv.id }

}