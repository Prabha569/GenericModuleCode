module "resource_group" {
  source = "../../modules/azurerm_resource_group"

  rgs = var.rgs
}

module "virtual_network" {
  source     = "../../modules/azurerm_virtual_network"
  depends_on = [module.resource_group]

  virtual_networks = var.virtual_networks
}

module "public_ip" {
    source = "../../modules/azurerm_public_ip"
    depends_on = [ module.resource_group ]
  
  public_ips = var.public_ips
}

module "virtual_machine" {
  source = "../../modules/azurerm_compute"
  depends_on = [ module.resource_group, module.virtual_network, module.public_ip ]

  vms =var.vms
}