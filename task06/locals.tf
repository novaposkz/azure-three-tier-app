locals {
  name_prefix = "cmaz-f4p05tns-mod6"

  rg_name            = local.name_prefix
  sql_server_name    = format("%s-sql", local.name_prefix)
  sql_db_name        = join("-", [local.name_prefix, "sql", "db"])
  asp_name           = "${local.name_prefix}-asp"
  app_name           = join("-", [local.name_prefix, "app"])
  firewall_rule_name = "allow-verification-ip"

  sql_admin_name_secret     = "sql-admin-name"
  sql_admin_password_secret = "sql-admin-password"
}