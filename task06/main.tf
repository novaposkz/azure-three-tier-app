# Get existing Key Vault
data "azurerm_key_vault" "existing" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_rg
}

# Create resource group
resource "azurerm_resource_group" "main" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}

# SQL Module
module "sql" {
  source = "./modules/sql"

  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  sql_server_name     = local.sql_server_name
  sql_db_name         = local.sql_db_name
  key_vault_id        = data.azurerm_key_vault.existing.id
  admin_username      = var.sql_admin_username
  firewall_rule_name  = "allow-verification-ip"
  allowed_ip_address  = var.allowed_ip_address
  tags                = var.tags
}

# WebApp Module
module "webapp" {
  source = "./modules/webapp"

  resource_group_name   = azurerm_resource_group.main.name
  location              = var.location
  asp_name              = local.asp_name
  app_name              = local.app_name
  sql_connection_string = module.sql.sql_connection_string
  dotnet_version        = "8.0"
  tags                  = var.tags

  depends_on = [module.sql]
}