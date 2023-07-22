# Create a CloudFront distribution
resource "aws_cloudfront_distribution" "distribution" {
    origin {
        domain_name = "origin.a.${data.aws_route53_zone.root_no_www.name}"
        origin_id   = "${var.domain}-origin"

        custom_origin_config {
            http_port              = 80
            https_port             = 443
            origin_protocol_policy = "match-viewer"
            origin_ssl_protocols   = ["TLSv1.2"]
        }
    }

    enabled             = true
    is_ipv6_enabled     = true
    default_root_object = "/"

    aliases = [var.domain, "www.${var.domain}"]

    default_cache_behavior {
        allowed_methods  = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
        cached_methods   = ["GET", "HEAD", "OPTIONS"]
        target_origin_id = "${var.domain}-origin"


        forwarded_values {
            query_string = true
            headers      = ["*"]

            cookies {
                forward = "all"
            }
        }

        viewer_protocol_policy = "redirect-to-https"
    }

    restrictions {
        geo_restriction {
            restriction_type = "none"
        }
    }

    viewer_certificate {
        acm_certificate_arn      = aws_acm_certificate.certificate.arn
        cloudfront_default_certificate = true
        ssl_support_method       = "sni-only"
        minimum_protocol_version = "TLSv1.2_2021"
    }
}