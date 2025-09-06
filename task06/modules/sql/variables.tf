variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "sql_server_name" {
  description = "SQL Server name"
  type        = string
}

variable "sql_db_name" {
  description = "SQL Database name"
  type        = string
}

variable "key_vault_id" {
  description = "Key Vault ID"
  type        = string
}

variable "admin_username" {
  description = "SQL admin username"
  type        = string
}

variable "firewall_rule_name" {
  description = "Firewall rule name"
  type        = string
}

variable "allowed_ip_address" {
  description = "Allowed IP address"
  type        = string
}

variable "tags" {
  description = "Tags"
  type        = map(string)
}