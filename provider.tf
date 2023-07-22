terraform {
    # Configure version about AWS provider
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 4.51.0"
        }
    }

    required_version = "1.5.2"
}

# Defined AWS default provider
provider aws {
    region = "ap-northeast-1"

    default_tags {
        tags = {
            env = "yuuronacademy-wp"
        }
    }
}