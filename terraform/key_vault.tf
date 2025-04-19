# Get current client config for tenant ID

/*
data "azurerm_client_config" "current" {}

# Create a Key Vault with RBAC 
resource "azurerm_key_vault" "portfolio" {
  name                       = "${var.client}-Keyvault-${var.suffix}"
  location                   = azurerm_resource_group.main.location
  resource_group_name        = azurerm_resource_group.main.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = 7
  purge_protection_enabled   = false
  enable_rbac_authorization  = true  

  sku_name = "standard"
}

# Upload certificate to Key Vault
resource "azurerm_key_vault_certificate" "portfolio" {
  name         = "portfolio-cert"
  key_vault_id = azurerm_key_vault.portfolio.id

  certificate {
    contents = filebase64("path/to/your/certificate.pfx")
    password = "your-certificate-password"
  }

  certificate_policy {
    issuer_parameters {
      name = "Self"
    }

    key_properties {
      exportable = true
      key_size   = 2048
      key_type   = "RSA"
      reuse_key  = false
    }

    secret_properties {
      content_type = "application/x-pkcs12"
    }
  }

  # This is needed for the deployment user to upload the certificate
  depends_on = [azurerm_role_assignment.terraform_key_vault_admin]
}

# Grant Terraform deployment identity Key Vault admin permissions
resource "azurerm_role_assignment" "terraform_key_vault_admin" {
  scope                = azurerm_key_vault.portfolio.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}

*/