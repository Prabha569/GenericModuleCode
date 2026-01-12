output "pip_id" {
value = {for key, pip in azurerm_public_ip.pip : key => pip.id}
}