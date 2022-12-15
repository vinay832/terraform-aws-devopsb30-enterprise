module "dev_vpc_2" {
  source  = "app.terraform.io/devopsb30vinay/devopsb30-network/aws"
  version = "1.0.0"
  vpc_cidr           = "10.80.0.0/16"
  vpc_name           = "dev_vpc_2"
  environment        = var.env
  public_cidr_block  = ["10.80.1.0/24", "10.80.2.0/24", "10.80.3.0/24", "10.80.3.0/24", "10.80.2.0/24", "10.80.1.0/24"]
  private_cidr_block = ["10.80.10.0/24", "10.80.20.0/24", "10.80.30.0/24", "10.80.30.0/24", "10.80.20.0/24", "10.80.10.0/24"]
  azs                = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1a", "us-east-1b"]
  owner              = "India-Dev-Team"

}