output "sql_server_fqdn" {
  description = "SQL Server FQDN"
  value       = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}

output "sql_connection_string" {
  description = "SQL connection string"
  value       = "Server=tcp:${azurerm_mssql_server.sql_server.fully_qualified_domain_name},1433;Database=${azurerm_mssql_database.sql_database.name};User ID=${var.admin_username};Password=${random_password.sql_password.result};Encrypt=true;TrustServerCertificate=false;Connection Timeout=30;"
  sensitive   = true
}