output "app_hostname" {
  description = "Web App hostname"
  value       = azurerm_linux_web_app.webapp.default_hostname
}