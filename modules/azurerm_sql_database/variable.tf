variable "sql_dbs" {
  description = "Databases to create on servers"
  type = map(object({
    sql_dbname  = string
    rg_name     = string
    server_name = string
    license_type = optional(string)
    max_size_gb  = optional(number)
    sku_name     = optional(string)
    enclave_type = optional(string)
    tags         = optional(map(string), {})
  }))
}

