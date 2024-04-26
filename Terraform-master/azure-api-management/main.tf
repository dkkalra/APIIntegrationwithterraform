provider "azurerm" {
  version = "=2.0.0"
  features {}
}
resource "azurerm_resource_group" "resource-gp" {
  name     = "${var.prefix}-resources"
  location = "${var.location}"
}

resource "azurerm_api_management" "api-management" {
  name                = "mycomp-apim-terra"
  location            = "${azurerm_resource_group.resource-gp.location}"
  resource_group_name = "${azurerm_resource_group.resource-gp.name}"
  publisher_name      = "My Company"
  publisher_email     = "company@terraform.io"

  sku_name = "Developer_1"
}