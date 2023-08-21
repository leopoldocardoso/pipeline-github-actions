terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.12.1"
    }
  }
}
provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Owner     = "Leopoldo Cardoso"
      Managedby = "Terraform"
      Objective = "Estudos Terraform"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {
    #skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  }
}
