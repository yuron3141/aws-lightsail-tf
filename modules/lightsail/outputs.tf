output "instance_ip" {
    description = "The instance IP of the lightsail instance"
    value = aws_lightsail_instance.lightsail_instance_a.public_ip_address
}

output "static_ip" {
    description = "The static IP of the lightsail instance"
    value = aws_lightsail_static_ip.static_ip
}