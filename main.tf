terraform {
  required_providers {
    vagrant = {
      source = "bmatcuk/vagrant"
      version = ">= 0.0.3"
    }
  }
}

provider "vagrant" {}

resource "vagrant_vm" "example" {
  name   = "local-vm"
}