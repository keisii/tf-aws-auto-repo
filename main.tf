provider "aws" {
  region = "ap-northeast-2"
}

module "vpc" {
  source = "./vpc/"
}

module "security_group" {
  source = "./security_group/"
  vpc_id = module.vpc.vpc_id
}

module "load_balancer" {
  source = "./load_balancer/"
  vpc_id = module.vpc.vpc_id
  subnet01_id = module.vpc.subnet01_id
  subnet02_id = module.vpc.subnet02_id
  subnet03_id = module.vpc.subnet03_id
  subnet04_id = module.vpc.subnet04_id
  web_app_security_group_id = module.security_group.web_app_security_group_id
}

module "auto_scaling" {
  source = "./auto_scaling/"
  subnet01_id = module.vpc.subnet01_id
  subnet02_id = module.vpc.subnet02_id
  subnet03_id = module.vpc.subnet03_id
  subnet04_id = module.vpc.subnet04_id
  web_app_security_group_id = module.security_group.web_app_security_group_id
  web_lb_tg = module.load_balancer.web_lb_tg
  app_lb_tg = module.load_balancer.web_lb_tg
}

module "route_table" {
  source = "./route_table/"
  vpc_id = module.vpc.vpc_id
  subnet01_id = module.vpc.subnet01_id
  subnet02_id = module.vpc.subnet02_id
  subnet03_id = module.vpc.subnet03_id
  subnet04_id = module.vpc.subnet04_id
  subnet05_id = module.vpc.subnet05_id
  subnet06_id = module.vpc.subnet06_id
  igw_id = module.vpc.igw_id
  ngw_id = module.vpc.ngw_id
}

module "rds" {
  source = "./rds/"
  subnet05_id = module.vpc.subnet05_id
  subnet06_id = module.vpc.subnet06_id
  db_security_group_id = module.security_group.db_security_group_id
}
