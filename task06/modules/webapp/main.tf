resource "azurerm_service_plan" "asp" {
  name                = var.asp_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "P0v3" # маленькая v!

  tags = var.tags
}

resource "azurerm_linux_web_app" "webapp" {
  name                = var.app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.asp.id
  https_only          = true

  site_config {
    always_on  = false
    ftps_state = "Disabled"

    application_stack {
      dotnet_version = var.dotnet_version
    }
  }

  # Connection string для Web App (правильное имя!)
  connection_string {
    name  = "DefaultConnection" # именно такое имя!
    type  = "SQLAzure"
    value = var.sql_connection_string
  }

  tags = var.tags
}