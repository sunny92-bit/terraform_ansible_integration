# how to use aws cloud by TF
terraform {

#  terraform.exe  version
  required_version = "~> 1.2"

  required_providers {
    myawscloud = {
      source  = "registry.terraform.io/hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

