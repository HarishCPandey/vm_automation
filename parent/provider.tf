terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "4.33.0"
        }
    }
backend "azurerm" {
    resource_group_name = "automate-todoapp-using-pipeline"
    storage_account_name = "mystg5577"
    container_name = "myxontainer5577"
    key = "mykey5577"
}
}
provider "azurerm" {
    features {}
    subscription_id = "b02b567a-e4cb-4c73-975e-4664c82c8fc3"

} 

