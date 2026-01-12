rgs = {
  "rg1" = {
    name       = "rg-prabha"
    location   = "Central India"
    managed_by = "terraform"
    tags = {
      environment = "dev"
      owner       = "team-azure"
      project     = "demo"
    }
  }

  # "rg2" = {
  #   name       = "rg-prabha10"
  #   location   = "East US"
  #   managed_by = "terraform"
  #   tags = {
  #     environment = "prod"
  #     owner       = "team-azure"
  #     project     = "demo"
  #   }
  # }

}

virtual_networks = {
  "vnet1" = {
    name                = "vnet-prabha"
    location            = "Central India"
    resource_group_name = "rg-prabha"

    address_space                  = ["10.0.0.0/16"]
    bgp_community                  = null
    dns_servers                    = ["10.0.0.4", "10.0.0.5"]
    edge_zone                      = null
    flow_timeout_in_minutes        = null
    private_endpoint_vnet_policies = "Disabled"

    tags = {
      environment = "dev"
      owner       = "team-azure"
      project     = "demo"
    }
    ddos_protection_plan = null
    encryption = {
      enforcement = "AllowUnencrypted"
    }
    # ip_address_pool = [{
    #   id                     = "pool-01"
    #   number_of_ip_addresses = "256"
    # }]

    subnets = {
      "subnet1" = {
        name                                          = "frontend-subnet"
        address_prefixes                              = ["10.0.1.0/24"]
        private_endpoint_network_policies             = "Disabled" # Required
        private_link_service_network_policies_enabled = false      # Default false
      }
      "subnet2" = {
        name                                          = "backend-subnet"
        address_prefixes                              = ["10.0.2.0/24"]
        private_endpoint_network_policies             = "Disabled" # Required
        private_link_service_network_policies_enabled = false      # Default false
      }
    }
  }

  # "vnet2" = {
  #   name                = "vnet-prabha10"
  #   location            = "East US"
  #   resource_group_name = "rg-prabha10"

  #   address_space                  = ["10.0.0.0/16"]
  #   bgp_community                  = null
  #   dns_servers                    = ["10.0.0.4", "10.0.0.5"]
  #   edge_zone                      = null
  #   flow_timeout_in_minutes        = null
  #   private_endpoint_vnet_policies = "Disabled"

  #   tags = {
  #     environment = "prod"
  #     owner       = "team-azure"
  #     project     = "demo"
  #   }
  #   ddos_protection_plan = null
  #   encryption = {
  #     enforcement = "AllowUnencrypted"
  #   }
  #   # ip_address_pool = [{
  #   #   id                     = "pool-01"
  #   #   number_of_ip_addresses = "256"
  #   # }]

  #   subnets = {
  #     "subnet1" = {
  #       name                                          = "frontend-subnet10"
  #       address_prefixes                              = ["10.0.1.0/24"]
  #       private_endpoint_network_policies             = "Disabled" # Required
  #       private_link_service_network_policies_enabled = false      # Default false
  #     }
  #     "subnet2" = {
  #       name                                          = "backend-subnet10"
  #       address_prefixes                              = ["10.0.2.0/24"]
  #       private_endpoint_network_policies             = "Disabled" # Required
  #       private_link_service_network_policies_enabled = false      # Default false
  #     }
  #   }
  # }

}


public_ips = {
  ip1 = {
    name                    = "prabha-pip"
    resource_group_name     = "rg-prabha"
    location                = "Central India"
    allocation_method       = "Static"
    domain_name_label       = null
    domain_name_label_scope = null
    edge_zone               = null
    public_ip_prefix_id     = null
    reverse_fqdn            = null
    ddos_protection_mode    = "VirtualNetworkInherited"
    ddos_protection_plan_id = null
    idle_timeout_in_minutes = 4

    sku        = "Standard"
    sku_tier   = "Regional"
    ip_version = "IPv4"
    tags = {
      environment = "dev"
      owner       = "team-azure"
      project     = "demo"
    }
  }

  # ip2 = {
  #   name                 = "prabha10-pip"
  #   resource_group_name  = "rg-prabha10"
  #   location             = "East US"
  #   allocation_method    = "Static"
  #   ddos_protection_mode = "Disabled"
  #   zones                = ["2"]
  #   tags = {
  #     environment = "dev"
  #     owner       = "team-azure"
  #     project     = "demo"
  #   }
  # }

}

vms = {
  "vm1" = {
    nic_name       = "nic-prabhavm"
    location       = "Central India"
    rg_name        = "rg-prabha"
    vnet_name      = "vnet-prabha"
    subnet_name    = "frontend-subnet"
    pip_name       = "prabha-pip"
    vm_name        = "prabhaVM001"
    size           = "Standard_F2"
    admin_username = "azureuser"
    admin_password = "azure@123"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}
