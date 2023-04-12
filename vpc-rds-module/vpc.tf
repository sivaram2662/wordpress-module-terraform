
module "vpc" {
  source        = "../VPC"
  publicsubnet  = var.publicsubnet
  privatesubnet = var.privatesubnet
  datasubnet    = var.datasubnet
  az            = var.az
  cidr          = var.cidr
  ami           = var.ami
  region        = var.region
  # ami_ubuntu    = var.ami_ubuntu
  # type_biger    = var.type_biger
  type = var.type
  # type_small    = var.type_small



}

module "rds" {
  source      = "../RDS"
  datasubnet1 = module.vpc.datasubnet1
  datasubnet2 = module.vpc.datasubnet2
  datasubnet3 = module.vpc.datasubnet3
  # pubsubnet1  = module.vpc.pubsubnet1
  # pubsubnet2  = module.vpc.pubsubnet2
  vpcid       = module.vpc.vpcid
  # ami         = var.ami
  # type        = var.type

  depends_on = [module.vpc]


}




