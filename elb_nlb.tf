module "dev_elb_1" {
  source  = "app.terraform.io/devopsb30vinay/devopsb30-elb/aws"
  version = "1.0.0"
  env             = module.dev_vpc_1.environment
  nlbname         = "devb29-nlb"
  subnets         = module.dev_vpc_1.public_subnets_id
  tgname          = "devb29-nlb-tg"
  vpc_id          = module.dev_vpc_1.vpc_id
  private_servers = module.dev_compute_1.private_servers
  certificate_arn = "arn:aws:acm:us-east-1:739906396761:certificate/ed4f7f00-52a8-412a-a6e1-c09c90657604"
}