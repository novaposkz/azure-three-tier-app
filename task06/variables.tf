variable "name_prefix" {
  description = "Name prefix for resources"
  type        = string
  default     = "cmaz-f4p05tns-mod6"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central US"
}

variable "kv_rg_name" {
  description = "Existing Key Vault resource group name"
  type        = string
  default     = "cmaz-f4p05tns-mod6-kv-rg"
}

variable "kv_name" {
  description = "Existing Key Vault name"
  type        = string
  default     = "cmaz-f4p05tns-mod6-kv"
}

variable "allowed_ip_address" {
  description = "IP address to allow SQL Server connections"
  type        = string
}

variable "sql_admin_login" {
  description = "SQL admin username"
  type        = string
  default     = "sqladmin"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
    Creator = "tani_bekeshev@epam.com"
  }
}