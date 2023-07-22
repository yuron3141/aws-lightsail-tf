module "wp-lightsail" {
    source = "./modules/lightsail"
    project_name = "${var.project_name}"
    yourip = "${var.yourip}"
    aws_region = "${var.aws_region}"
    blueprint_id = "${var.blueprint_id}"
    bundle_id = "${var.bundle_id}"

}

module "static_host" {
    source = "./modules/static_host"
    project_name = "${var.project_name}"
    domain = "${var.domain}"
    lightsail_ip = module.wp-lightsail.instance_ip
}