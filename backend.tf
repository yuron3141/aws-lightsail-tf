terraform {
    # Please make these file in S3 before do terraform plan
    backend s3 {
        bucket = "unit-cloud9-bucket"
        region = "ap-northeast-1"
        encrypt = true
        key    = "hogehoge/terraform.tfstate"
    }

    required_version = "1.5.2"
}