# Standalone coreos instance
## Usage

### deployment.tf file
```hcl
module "demo" {
  source                            = "git::ssh://git@github.com/tf-modules/aws-coreos-instance.git?//ref=0.0.2"

  # instance overrides
  ## base configs
  ami                               = "${var.amis[format("%s.%s",var.deployment["region"],var.demo_instance["ami"])]}"
  instance_type                     = "${var.demo_instance["instance_type"]}"
  iam_instance_profile              = "${var.demo_instance["iam_instance_profile"]}"
  role                              = "${var.demo_instance["role"]}"
  ebs_optimized                     = "${var.demo_instance["ebs_optimized"]}"

  ## disk configs
  root_volume_type                  = "${var.demo_instance["root_volume_type"]}"
  root_volume_size                  = "${var.demo_instance["root_volume_size"]}"
  root_volume_encrypted             = "${var.demo_instance["root_volume_encrypted"]}"
  root_volume_delete_on_termination = "${var.demo_instance["root_volume_delete_on_termination"]}"
  var_volume_path                   = "${var.demo_instance["var_volume_path"]}"
  var_volume_type                   = "${var.demo_instance["var_volume_type"]}"
  var_volume_size                   = "${var.demo_instance["var_volume_size"]}"
  var_volume_encrypted              = "${var.demo_instance["var_volume_encrypted"]}"
  var_volume_delete_on_termination  = "${var.demo_instance["var_volume_delete_on_termination"]}"
  data_volume_path                  = "${var.demo_instance["data_volume_path"]}"
  data_volume_type                  = "${var.demo_instance["data_volume_type"]}"
  data_volume_size                  = "${var.demo_instance["data_volume_size"]}"
  data_volume_encrypted             = "${var.demo_instance["data_volume_encrypted"]}"
  data_volume_delete_on_termination = "${var.demo_instance["data_volume_delete_on_termination"]}"
  associate_public_ip               = "${var.demo_instance["associate_public_ip"]}"
  subnet_id                         = "${var.demo_instance["subnet_id"]}"
  vpc_security_group_ids            = "${aws_security_group.demo.id}"

  # deployment configs
  version                           = "${var.deployment["version"]}"
  environment                       = "${var.deployment["environment"]}"
  app_name                          = "${var.deployment["app_name"]}"
  site_name                         = "${var.deployment["site_name"]}"
  region                            = "${var.deployment["region"]}"
  aws_account_id                    = "${var.deployment["aws_account_id"]}"
  ssh_key_name                      = "${aws_key_pair.authorized_key.key_name}"
  ssh_key                           = "${data.template_file.ssh_public_key.rendered}"
  password                          = "${data.template_file.password.rendered}"
  customer                          = "${var.deployment["customer"]}"
  consortium                        = "${var.deployment["consortium"]}"
  dns_domain                        = "${var.deployment["dns_domain"]}"
  aws_tag_version                   = "${var.deployment["aws_tag_version"]}"
  r53zone_id                        = "${var.deployment["r53zone_id"]}"
  configuration_bucket              = "${format("%s-%s-%s-%s",var.deployment["customer"],var.deployment["site_name"],var.deployment["region"],var.deployment["aws_account_id"])}"
}
```

### terraform get the modules

```bash
$ terraform get
```

### terraform apply

```bash
$ terraform apply
```

