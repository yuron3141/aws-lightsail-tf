variable "project_name" {
    type        = string
    default     = "wp_example"
    description = "Set up project name"
}

variable "yourip" {
    type = string
    default = "xx.xx.xx.xxx/32"
    description = "Set up your client global ip"
}

variable "domain" {
    type        = string
    default = "example.com"
    description = "Set up your domain"
}


variable "blueprint_id" {
    type = string
    default = "wordpress"
    description = "Set up lightsail blueprintID"
}

variable "bundle_id" {
    type = string
    default = "nano_2_0"
    description = "Set up lightsail bundleID"
}


variable "aws_region" {
    type        = string
    default     = "ap-northeast-1"
    description = "Set up region you want to use"
}