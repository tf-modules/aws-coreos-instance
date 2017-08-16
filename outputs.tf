# instance
output "ami"                                  { value="${var.ami}" }
output "instance_type"                        { value="${var.instance_type}" }
output "iam_instance_profile"                 { value="${var.iam_instance_profile}" }
output "role"                                 { value="${var.tags["role"]}" }
output "ebs_optimized"                        { value="${var.ebs_optimized}" }
output "instance_dns"                         { value="${aws_route53_record.coreos.name}" }
output "instance_id"                          { value="${aws_instance.coreos.id}" }
output "instance_public_ip"                   { value="${aws_instance.coreos.public_ip}" }
output "instance_private_ip"                  { value="${aws_instance.coreos.private_ip}" }
output "version"                              { value="${var.version}" }
output "region"                               { value="${var.region}" }
output "key_name"                             { value="${var.key_name}" }
output "key_contents"                         { value="${var.key_contents}" }
output "password"                             { value="${var.password}" }
output "dns_domain"                           { value="${var.dns_domain}" }
output "associate_public_ip"                  { value="${var.associate_public_ip}" }
output "vpc_security_group_ids"               { value="${var.vpc_security_group_ids}" }
output "subnet_id"                            { value="${var.subnet_id}" }
output "node_name"                            { value="${format("%s-%s-%s", var.tags["app_name"], var.tags["role"], var.tags["environment"])}" }
output "ec2_tag"                              { value="${var.ec2_tag}" }
output "r53zone_id"                           { value="${var.r53zone_id}" }
output "configuration_bucket"                 { value="${var.configuration_bucket}" }
