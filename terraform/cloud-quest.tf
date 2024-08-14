module "cloud_quest" {
  source           = "./aws"
  vpc              = "Default"
  cluster_name     = "cloud-quest"
  image_name       = ""
  no_of_containers = 1
  domain_name      = ""
  route53_name     = ""

}
