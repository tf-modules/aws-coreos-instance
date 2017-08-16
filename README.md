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
  ebs_optimized                     = "${var.demo_instance["ebs_optimized"]}"

  ## disk configs
  rootfs                            = "${var.rootfs}"
  datafs                            = "${var.datafs}"
  varfs                             = "${var.varfs}"
  associate_public_ip               = "${var.demo_instance["associate_public_ip"]}"
  subnet_id                         = "${var.demo_instance["subnet_id"]}"
  vpc_security_group_ids            = "${aws_security_group.demo.id}"

  # deployment configs
  version                           = "${var.deployment["version"]}"
  region                            = "${var.deployment["region"]}"
  aws_account_id                    = "${var.deployment["aws_account_id"]}"
  key_name                          = "${aws_key_pair.authorized_key.key_name}"
  key_contents                      = "${data.template_file.ssh_public_key.rendered}"
  password                          = "${data.template_file.password.rendered}"
  tags                              = "${var.tags}"
  dns_domain                        = "${var.deployment["dns_domain"]}"
  ec2_tag                           = "${var.deployment["ec2_tag"]}"
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

