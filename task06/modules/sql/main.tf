resource "random_password" "sql_password" {
  length           = 20
  special          = true
  override_special = "!#$%&*+-_=?"
  min_lower        = 1
  min_upper        = 1
  min_numeric      = 1
}

resource "azurerm_mssql_server" "sql_server" {
  name                          = var.sql_server_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = "12.0"
  administrator_login           = var.admin_username
  administrator_login_password  = random_password.sql_password.result
  minimum_tls_version           = "1.2"
  public_network_access_enabled = true

  tags = var.tags
}

resource "azurerm_mssql_firewall_rule" "allow_azure_services" {
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_mssql_firewall_rule" "allow_specific_ip" {
  name             = var.firewall_rule_name
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = var.allowed_ip_address
  end_ip_address   = var.allowed_ip_address
}

resource "azurerm_mssql_database" "sql_database" {
  name           = var.sql_db_name
  server_id      = azurerm_mssql_server.sql_server.id
  sku_name       = "S2"
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  zone_redundant = false

  tags = var.tags
}

resource "azurerm_key_vault_secret" "sql_admin_name" {
  name         = "sql-admin-name"
  value        = var.admin_username
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "sql_admin_password" {
  name         = "sql-admin-password"
  value        = random_password.sql_password.result
  key_vault_id = var.key_vault_id
}

locals {
  adonet_conn_string = format(
    "Server=tcp:%s,1433;Initial Catalog=%s;Persist Security Info=False;User ID=%s;Password=%s;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;",
    azurerm_mssql_server.sql_server.fully_qualified_domain_name,
    azurerm_mssql_database.sql_database.name,
    var.admin_username,
    random_password.sql_password.result
  )
}