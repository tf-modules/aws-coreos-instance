#provider "aws" {
#  region = "${var.region}"
#}

terraform {
#  backend "s3" {}
  required_version = "~> 0.9.2"
}

data "template_file" "user-data" {
  template = "${file("./templates/userdata/ignition.json")}"
  vars {
    region               = "%{var.region}"

    var_volume_path      = "${var.varfs["path"]}"
    data_volume_path     = "${var.datafs["path"]}"
    app_name             = "${var.tags["app_name"]}"
    role                 = "${var.tags["role"]}"
    environment          = "${var.tags["environment"]}"
    customer             = "${var.tags["customer"]}"
    billing_code         = "${var.tags["billing_code"]}"
    iam_instance_profile = "${var.iam_instance_profile}"
    version              = "${var.version}"

    aws_account_id       = "${var.aws_account_id}"
    ssh_key_name         = "${var.key_name}"
    ssh_public_key       = "${var.key_contents}"
    password             = "${var.password}"
    dns_domain           = "${var.dns_domain}"
    node_name            = "${format("%s-%s-%s", var.tags["app_name"], var.tags["environment"], var.tags["billing_code"])}"
    ec2_tag              = "${var.ec2_tag}"
  }
}

resource "aws_instance" "coreos" {
    depends_on                  = ["data.template_file.user-data"]
    ami                         = "${var.ami}"
    instance_type               = "${var.instance_type}"
    iam_instance_profile        = "${var.iam_instance_profile}"
    key_name                    = "${var.key_name}"
    associate_public_ip_address = "${var.associate_public_ip}"
    vpc_security_group_ids      = ["${var.vpc_security_group_ids}"]
    user_data                   = "${length(var.override_user_data) > 0 ? var.override_user_data : data.template_file.user-data.rendered}"
    ebs_optimized               = "${var.ebs_optimized}"
    subnet_id                   = "${var.subnet_id}"

    # /
    root_block_device {
      volume_type               = "${var.rootfs["type"]}"
      volume_size               = "${var.rootfs["size"]}"
      delete_on_termination     = "${var.rootfs["delete_on_termination"]}"
    }

    # docker /var/lib/docker
    ebs_block_device {
      device_name               = "${var.varfs["path"]}"
      volume_type               = "${var.varfs["type"]}"
      volume_size               = "${var.varfs["size"]}"
      encrypted                 = "${var.varfs["encrypted"]}"
      delete_on_termination     = "${var.varfs["delete_on_termination"]}"
    }

    # docker /mnt
    ebs_block_device {
      device_name               = "${var.datafs["path"]}"
      volume_type               = "${var.datafs["type"]}"
      volume_size               = "${var.datafs["size"]}"
      encrypted                 = "${var.datafs["encrypted"]}"
      delete_on_termination     = "${var.datafs["delete_on_termination"]}"
    }

    lifecycle {
      create_before_destroy     = false
    }
}

# resource record set resource
resource "aws_route53_record" "coreos" {
  depends_on = ["aws_instance.coreos"]
  name       = "${format("%s-%s-%s.%s", var.tags["app_name"], var.tags["environment"], var.tags["customer"], var.dns_domain)}"
  zone_id    = "${var.r53zone_id}"
  type       = "A"
  ttl        = "30"
  records    = ["${aws_instance.coreos.public_ip}"]
}
