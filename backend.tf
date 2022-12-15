terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "devopsb30vinay"

    workspaces {
      name = "terraform-aws-devopsb30-enterprise"
    }
  }
}

#run commmand terraform login in powershell and generate api token copy paste the token 