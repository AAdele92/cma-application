variable "vpc_id" {
  type        = string
  description = "vpc_id"
  default     = "vpc-07f2d83f135c4840e"
}

variable "instance_type" {
  type        = string
  description = "instance type"
  default     = "t3.medium"
}

variable "key_name" {
  type        = string
  description = "key name"
  default     = "adele-key"
}

variable "environment" {
  type        = string
  description = "environment"
  default     = "dev"
}

variable "ami" {
  type        = string
  description = "ami"
  default     = "ami-0acc77abdfc7ed5a6"
}

variable "region" {
  type        = string
  description = "region to deploy"
  default     = "eu-west-2"
}

variable "launch_template" {
  type        = string
  description = "launch template name"
  default     = "cma-app-lt"
}

variable "autoscaling_group" {
  type        = string
  description = "asg name"
  default     = "cma-app-asg"
}

variable "autoscaling_min_size" {
  type        = number
  description = "The minimum size of the auto scale group"
  default     = 1
}

variable "autoscaling_max_size" {
  type        = number
  description = "The maximum size of the auto scale group"
  default     = 1
}

variable "autoscaling_desired_capacity" {
  type        = number
  description = "The desired capacity of the auto scale group"
  default     = 1
}

variable "autoscaling_health_check" {
  type        = string
  description = "The health of the auto scale group"
  default     = "EC2"
}

variable "vpc_security_group_ids" {
  type        = string
  description = "sg to allow access to app"
  default     = "cma-app-sg"
}

variable "vpc_security_group_lb_ids" {
  type        = string
  description = "sg to allow http"
  default     = "cma-app-lb-sg"
}

variable "load_balancer" {
  type        = string
  description = "load balancer"
  default     = "cma-app-lb"
}

variable "lb_type" {
  type        = string
  description = "load balancer type"
  default     = "network"
}

variable "security_group_lb" {
  type        = string
  description = "security group load balancer"
  default     = "cma-app-lb-sg"
}

variable "subnet" {
  type        = list(string)
  description = "subnet ranges"
  default     = ["subnet-0d74d63ea2a950227", "subnet-0e6002439ede94db9", "subnet-0b83a1faa0021da96"]
}

variable "availability_zones" {
  type        = list(string)
  description = "availabilty zones"
  default     = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

variable "zone_id" {
  type        = string
  description = "route53 zone_id"
  default     = "Z00434632WAOO9POFSCTL"
}

# variable "domain_name" {
#   type        = string
#   description = "domain_name"
#   default     = "cma-app-dev.lamtech.io"
# }