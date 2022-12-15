module "dev_elb_alb_1" {
  source  = "app.terraform.io/devopsb30vinay/devopsb30-elb-alb/aws"
  version = "1.0.0"
  albname             = "devb30-alb"
  sg_id               = module.dev_sg_1.sg_id
  subnets             = module.dev_vpc_1.public_subnets_id
  env                 = module.dev_vpc_1.environment
  albtgname           = "devb30-alb-tg"
  vpc_id              = module.dev_vpc_1.vpc_id
  private_servers     = module.dev_compute_1.private_servers
  alb_certificate_arn = "arn:aws:acm:us-east-1:739906396761:certificate/ed4f7f00-52a8-412a-a6e1-c09c90657604"
}