terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "4.33.0"
        }
    }
}
provider "azurerm" {
    features {}
    subscription_id = "b397c2d0-369a-47dd-9100-9467b7447185"
} 