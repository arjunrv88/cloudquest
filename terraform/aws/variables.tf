variable "vpc" {
  type        = string
  description = "Name of the VPC in which you want to deploy"
}

variable "cluster_name" {
  type        = string
  description = "Name of the cluster"
}

variable "image_name" {
  type        = string
  description = "Name of the Image"
}

variable "no_of_containers" {
  type        = number
  description = "The number of containers needed for the service"
}

variable "domain_name" {
  type        = string
  description = "Domain Name for ACM"
}

variable "route53_name" {
  type        = string
  description = "Route53 Domain Name"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
  default = {
    "Env"   = "Dev"
    Project = "Cloud Quest"
    Owner   = "Cloud-Eng-Team"
  }
}