module "dev_iam_1" {
  source  = "app.terraform.io/devopsb30vinay/devopsb30-iam/aws"
  version = "1.0.0"
  env                 = module.dev_vpc_1.environment
  rolename            = "devopsb30testrole"
  instanceprofilename = "devopsb30instprofile"
}
module "dev_compute_1" {
  source  = "app.terraform.io/devopsb30vinay/devopsb30-compute/aws"
  version = "1.0.0"
  env    = module.dev_vpc_1.environment
  amis = {
    us-east-1 = "ami-04505e74c0741db8d" # ubuntu 20.04 LTS
    us-east-2 = "ami-04505e74c0741db90" # ubuntu 20.04 LTS
  }
  aws_region           = var.aws_region
  instance_type        = "t2.nano"
  key_name             = "Z_AWSB7"
  iam_instance_profile = module.dev_iam_1.instprofile
  public_subnets       = module.dev_vpc_1.public_subnets_id
  private_subnets      = module.dev_vpc_1.private_subnets_id
  sg_id                = module.dev_sg_1.sg_id
  vpc_name             = module.dev_vpc_1.vpc_name
  project_name         = "Phoenix"
}