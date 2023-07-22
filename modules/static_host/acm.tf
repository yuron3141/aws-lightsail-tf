# Defined AWS secondary provider
# This region exists to make ACM certificate that associate cloudfront
provider "aws" {
    alias = "virginia"
    region = "us-east-1"
}

resource "aws_acm_certificate" "certificate" {
    provider                  = aws.virginia
    domain_name               = "${var.domain}"
    subject_alternative_names = ["*.${data.aws_route53_zone.root_no_www.name}"]
    validation_method         = "DNS"

    lifecycle {
        create_before_destroy = true
    }
}