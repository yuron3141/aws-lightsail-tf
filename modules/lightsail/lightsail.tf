# Create lightsail instance
resource "aws_lightsail_instance" "lightsail_instance_a" {
    name              = "${var.project_name}_instance"
    availability_zone = "${var.aws_region}a"
    blueprint_id      = "${var.blueprint_id}"
    bundle_id         = "${var.bundle_id}"
    key_pair_name     = "${var.project_name}_key_pair"
}

# Create static global ip 
resource "aws_lightsail_static_ip" "static_ip" {
    name = "${var.project_name}_static_ip"
}

# Attache static global ip on lightsail
resource "aws_lightsail_static_ip_attachment" "static_ip_attach" {
    static_ip_name = aws_lightsail_static_ip.static_ip.id
    instance_name  = aws_lightsail_instance.lightsail_instance_a.id
}

# Define wirewall to lightsail instance
resource "aws_lightsail_instance_public_ports" "lightsail_instance_fw" {
    instance_name = aws_lightsail_instance.lightsail_instance_a.name

    # Allow HTTP
    port_info {
        protocol  = "tcp"
        from_port = 80
        to_port   = 80
        cidrs    = ["0.0.0.0/0"]
    }

    # Allow HTTPS
    port_info {
        protocol  = "tcp"
        from_port = 443
        to_port   = 443
        cidrs    = ["0.0.0.0/0"]
    }
}