output "container_app_fqdn" {
  value = azurerm_container_app.portfolio.latest_revision_fqdn
}