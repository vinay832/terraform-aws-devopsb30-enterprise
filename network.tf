module "dev_vpc_1" {
  source  = "app.terraform.io/devopsb30vinay/devopsb30-network/aws"
  version = "1.0.0"
  vpc_cidr           = "10.90.0.0/16"
  vpc_name           = "dev_vpc_1"
  environment        = var.env
  public_cidr_block  = ["10.90.1.0/24", "10.90.2.0/24", "10.90.3.0/24", "10.90.3.0/24", "10.90.2.0/24", "10.90.1.0/24"]
  private_cidr_block = ["10.90.10.0/24", "10.90.20.0/24", "10.90.30.0/24", "10.90.30.0/24", "10.90.20.0/24", "10.90.10.0/24"]
  azs                = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1a", "us-east-1b"]
  owner              = "India-Dev-Team"

}
module "dev_sg_1" {
  source  = "app.terraform.io/devopsb30vinay/devopsb30-sg/aws"
  version = "1.0.0"
  vpc_name      = module.dev_vpc_1.vpc_name
  vpc_id        = module.dev_vpc_1.vpc_id
  environment   = module.dev_vpc_1.environment
  service_ports = ["80", "443", "445", "8080", "22", "3389", "80", "443", "445", "8080", "22", "3389"]
}
module "dev_natgw_1" {
  source  = "app.terraform.io/devopsb30vinay/devopsb30-nat/aws"
  version = "1.0.0"
  public_subnet_id = module.dev_vpc_1.public_subnets_id_1
  vpc_name         = module.dev_vpc_1.vpc_name
  private_rt_id    = module.dev_vpc_1.private_route_table_id
}