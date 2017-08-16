variable "region"                             {}
variable "ami"                                {}
variable "instance_type"                      { default = "t2.micro" }
variable "iam_instance_profile"               {}
variable "ebs_optimized"                      { default = true }
variable "version"                            {}
variable "aws_account_id"                     {}
variable "key_name"                           {}
variable "key_contents"                       {}
variable "password"                           {}
variable "dns_domain"                         {}
variable "associate_public_ip"                { default = false }
variable "vpc_security_group_ids"             {}
variable "subnet_id"                          {}
variable "ec2_tag"                            {}
variable "r53zone_id"                         {}
variable "configuration_bucket"               {}
variable "override_user_data"                 {}

variable "tags"                               {
  type = "map" 
  default = {
    environment           = "demo"
    customer              = "demo"
    role                  = "demo"
    billing_code          = "demo"
    app_name              = "demo"
  }
}

variable "rootfs"                             {
  type = "map"
  default = {
    type                  = "gp2"
    size                  = "10"
    path                  = "/dev/xvda"
    encrypted             = "true"
    delete_on_termination = false
  }
}
variable "varfs"                              {
  type = "map"
  default = {
    type                  = "gp2"
    size                  = "1000"
    path                  = "/dev/xvdd"
    encrypted             = "true"
    delete_on_termination = false
  }
}
variable "datafs"                             {
  type = "map"
  default = {
    type                  = "gp2"
    size                  = "100"
    path                  = "/dev/xvde"
    encrypted             = "true"
    delete_on_termination = false
  }
}
