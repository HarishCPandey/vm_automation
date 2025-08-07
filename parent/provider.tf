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
    subscription_id = "b02b567a-e4cb-4c73-975e-4664c82c8fc3"

} 
