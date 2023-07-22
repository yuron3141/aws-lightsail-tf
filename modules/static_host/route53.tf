# Please set below hostzone mannualy on AWS console
data "aws_route53_zone" "root_no_www" {
    name = "${var.domain}."
}

resource "aws_route53_record" "root_no_www" {
    type    = "A"
    zone_id = data.aws_route53_zone.root_no_www.id
    name    = "www.${data.aws_route53_zone.root_no_www.name}"

    alias {
        name                   = aws_cloudfront_distribution.distribution.domain_name
        zone_id                = aws_cloudfront_distribution.distribution.hosted_zone_id
        evaluate_target_health = false
    }

}