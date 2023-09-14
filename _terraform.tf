terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.4.1"
    }
  }
}

variable "vault_address" {}
variable "vault_token" {}

provider "vault" {
  address = var.vault_address
  token   = var.vault_token
}
