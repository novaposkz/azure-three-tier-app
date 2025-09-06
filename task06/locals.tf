locals {
  name_prefix = "cmaz-f4p05tns-mod6"

  rg_name            = format("%s-rg", local.name_prefix)
  sql_server_name    = format("%s-sql", local.name_prefix)
  sql_db_name        = format("%s-sql-db", local.name_prefix)
  asp_name           = format("%s-asp", local.name_prefix)
  app_name           = format("%s-app", local.name_prefix)
  firewall_rule_name = "allow-verification-ip"

  sql_admin_name_secret     = "sql-admin-name"
  sql_admin_password_secret = "sql-admin-password"
}