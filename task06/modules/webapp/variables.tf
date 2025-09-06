variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "asp_name" {
  description = "App Service Plan name"
  type        = string
}

variable "app_name" {
  description = "Web App name"
  type        = string
}

variable "sql_connection_string" {
  description = "SQL connection string"
  type        = string
  sensitive   = true
}

variable "dotnet_version" {
  description = ".NET version"
  type        = string
  default     = "8.0"
}

variable "tags" {
  description = "Tags"
  type        = map(string)
}