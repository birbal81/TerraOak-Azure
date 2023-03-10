resource "azurerm_api_management_backend" "sac_api_management_backend" {
  name = "sac-testing-apim-backend"   # Required
  resource_group_name = azurerm_resource_group.apim_resource_group.name   # Required
  api_management_name = azurerm_api_management.sac_api_management.name   # Required
  protocol = "http"   # Required
  url = "https://conferenceapi.azurewebsites.net?format=json"

  tls {
    validate_certificate_chain = false
    validate_certificate_name = false
  }
}