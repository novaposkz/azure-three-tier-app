locals {
  rg_name         = format("%s-rg", var.name_prefix)
  sql_server_name = format("%s-sql", var.name_prefix)
  sql_db_name     = format("%s-sql-db", var.name_prefix)
  asp_name        = format("%s-asp", var.name_prefix)
  app_name        = format("%s-app", var.name_prefix)

  sql_sku_name  = "S2"
  plan_sku_name = "P0v3"

  fw_rule_allow_azure = "allow-azure-services"
  fw_rule_verify_ip   = "allow-verification-ip"

  kv_secret_sql_admin_name     = "sql-admin-name"
  kv_secret_sql_admin_password = "sql-admin-password"
}