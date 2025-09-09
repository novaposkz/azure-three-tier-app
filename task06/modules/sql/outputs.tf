output "sql_server_fqdn" {
  description = "SQL Server FQDN"
  value       = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}

output "sql_connection_string" {
  description = "SQL connection string"
  value       = local.adonet_conn_string # используйте local
  sensitive   = true
}