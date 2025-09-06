locals {
  rg_name            = var.name_prefix
  sql_server_name    = "${var.name_prefix}-sql"
  sql_db_name        = "${var.name_prefix}-sql-db"
  asp_name           = "${var.name_prefix}-asp"
  app_name           = "${var.name_prefix}-app"
  firewall_rule_name = "allow-verification-ip"

  # Key Vault secret names
  sql_admin_name_secret     = "sql-admin-name"
  sql_admin_password_secret = "sql-admin-password"
}