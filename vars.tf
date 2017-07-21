# instance
variable "ami"                                {}
variable "instance_type"                      { default = "t2.micro" }
variable "iam_instance_profile"               {}
variable "role"                               { default = "generic" }
variable "ebs_optimized"                      { default = true }
variable "root_volume_type"                   { default = "gp2" }
variable "root_volume_size"                   { default = 10 }
variable "root_volume_encrypted"              { default = true }
variable "root_volume_delete_on_termination"  { default = false }
variable "var_volume_path"                    { default = "/dev/xvdd" }
variable "var_volume_type"                    { default = "gp2" }
variable "var_volume_size"                    { default = 100 }
variable "var_volume_encrypted"               { default = false }
variable "var_volume_delete_on_termination"   { default = false }
variable "data_volume_path"                   { default = "/dev/xvde" }
variable "data_volume_type"                   { default = "gps2" }
variable "data_volume_size"                   { default = 10 }
variable "data_volume_encrypted"              { default = false }
variable "data_volume_delete_on_termination"  { default = false }

# deployment
variable "version"                            {}
variable "environment"                        {}
variable "app_name"                           {}
variable "site_name"                          {}
variable "region"                             {}
variable "aws_account_id"                     {}
variable "ssh_key"                            {}
variable "ssh_key_name"                       {}
variable "password"                           {}
variable "customer"                           {}
variable "consortium"                         {}
variable "dns_domain"                         {}
variable "associate_public_ip"                { default = false }
variable "vpc_security_group_ids"             {}
variable "subnet_id"                          {}
variable "aws_tag_version"                    {}
variable "r53zone_id"                         {}
variable "configuration_bucket"               {}
