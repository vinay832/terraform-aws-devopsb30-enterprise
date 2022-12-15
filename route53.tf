module "dev_route53_1" {
  source  = "app.terraform.io/devopsb30vinay/devopsb30-route53/aws"
  version = "1.0.0"
  domainname = "awsb37vinay.xyz"
  nlb_id     = module.dev_elb_1.elb_id
  dns_name   = module.dev_elb_1.elb_dns_name
  zone_id    = module.dev_elb_1.elb_zone_id
  recordname = "devopsb30"
}
module "dev_route53_1_alb" {
  source  = "app.terraform.io/devopsb30vinay/devopsb30-route53/aws"
  version = "1.0.0"
  domainname = "awsb37vinay.xyz"
  nlb_id     = module.dev_elb_alb_1.elb_id
  dns_name   = module.dev_elb_alb_1.elb_dns_name
  zone_id    = module.dev_elb_alb_1.elb_zone_id
  recordname = "httpsdevopsb30"
}