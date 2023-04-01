
##################################################################
##  Terraform Remote Azure Backend (via Azure Srorage Account)  ##
##################################################################

terraform {
  # ## Configure the backend Azure Storage Account to keep "*.tfstate" file in
  backend "azurerm" {
    resource_group_name = "landing-zone-eus-iac-rg"
    storage_account_name = "landingzoneeusiacst"
    container_name = "landing-zone-tf-state"
    key = "landing-zone.tfstate"
    access_key = "XXXXXX"
  }

  required_providers {

    # ## Connect "Azuread" provider for creation and interaction with Azure AD objects
    # ## Ref.: https://registry.terraform.io/providers/hashicorp/azuread/latest/docs
    azuread = {
      source = "hashicorp/azuread"
      version = "2.24.0"
    }

    # ## Connect "Azurerm" provider for creation and interaction with all major resources
    # ## Ref.:https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.35.0"
    }

    # ## Connect "Random" provider for creation of random strings
    # ## Ref.: https://registry.terraform.io/providers/hashicorp/random/latest/docs
    random = {
      source = "hashicorp/random"
      version = "3.3.1"
    }

    # ## Connect "Null" provider for creation of null resources
    # ## Ref.: https://registry.terraform.io/providers/hashicorp/null/latest/docs
    null = {
      source = "hashicorp/null"
      version = "3.1.1"
    }

    # ## Connect "Local" provider for interaction with local files
    # ## Ref.: https://registry.terraform.io/providers/hashicorp/local/latest/docs
    local = {
      source = "hashicorp/local"
      version = "2.2.3"
    }

    # ## Connect "Template" provider for parametrizing template files
    # ## https://registry.terraform.io/providers/hashicorp/template/latest/docs
    template = {
      source = "hashicorp/template"
      version = "2.2.0"
    }

    # ## Connect "TLS" provider to allow private keys, certificates and certificate requests to be created as part of a Terraform deployment
    # ## https://registry.terraform.io/providers/hashicorp/tls/latest/docs
    tls = {
      source = "hashicorp/tls"
      version = "3.4.0"
    }

  }

}

############################
##  Terrafrorm Providers  ##
############################

# ## Connect "Azurerm" provider for creation and interaction with all major resources
# ## Terraform will automatically recover a soft-deleted Key Vault during Creation if one is found
# ##  this can be opt out using the features block within the Provider block.
provider "azurerm" {
  client_id = var.azure_client_id
  subscription_id = var.azure_subscription_id
  tenant_id = var.azure_tenant_id
  client_secret = var.azure_client_secret

  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

# ## Connect "Azuread" provider for creation and interaction with Azure AD objects
provider "azuread" {
}