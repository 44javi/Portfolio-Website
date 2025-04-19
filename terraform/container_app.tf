data "azurerm_container_app_environment" "shared" {
  name                = "${var.client}-projects-${var.suffix}"
  resource_group_name = "${var.client}_shared_${var.suffix}"
}

resource "azurerm_container_app" "portfolio" {
  name                         = "portfolio"
  container_app_environment_id = data.azurerm_container_app_environment.shared.id
  resource_group_name          = azurerm_resource_group.main.name

  revision_mode = "Single"

  template {
    container {
      name   = "portfolio"
      image  = "${var.docker_usr}/portfolio:latest"
      cpu    = 0.25
      memory = "0.5Gi"

      env {
        name  = "PORT"
        value = "80"
      }
    }

    min_replicas = 1
    max_replicas = 1
  }

  ingress {
    external_enabled = true
    target_port      = 80

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }
}

# Custom domain with managed certificate
resource "azurerm_container_app_custom_domain" "portfolio" {
  name             = var.custom_domain
  container_app_id = azurerm_container_app.portfolio.id

  # This enables the free managed certificate
  certificate_binding_type = "SniEnabled"

  lifecycle {
    // When using an Azure created Managed Certificate these values must be added to ignore_changes to prevent resource recreation.
    ignore_changes = [certificate_binding_type, container_app_environment_certificate_id]
  }
}

resource "azurerm_container_app_custom_domain" "portfolio_www" {
  name             = "www.${var.custom_domain}"
  container_app_id = azurerm_container_app.portfolio.id
  
  certificate_binding_type = "SniEnabled"
  
  lifecycle {
    ignore_changes = [certificate_binding_type, container_app_environment_certificate_id]
  }
}
