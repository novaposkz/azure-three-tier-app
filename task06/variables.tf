variable "name_prefix" {
  description = "Base prefix used to construct all resource names."
  type        = string
  default     = "cmaz-f4p05tns-mod6"
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "Central US"
}

variable "kv_rg_name" {
  description = "Existing Key Vault resource group name."
  type        = string
  default     = "cmaz-f4p05tns-mod6-kv-rg"
}

variable "kv_name" {
  description = "Existing Key Vault name."
  type        = string
  default     = "cmaz-f4p05tns-mod6-kv"
}

variable "allowed_ip_address" {
  description = "IP address allowed to access SQL Server."
  type        = string
}

variable "sql_admin_login" {
  description = "SQL admin username."
  type        = string
  default     = "sqladmin"
}

variable "tags" {
  description = "Common tags applied to all resources."
  type        = map(string)
  default = {
    Creator = "tani_bekeshev@epam.com"
  }
}