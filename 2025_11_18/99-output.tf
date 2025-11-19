output "ip_address" {
  value = aws_instance.web_server.public_ip  
}

output "website_ur" {
  value = "http://${aws_lb.web-tier-app-lb.dns_name}"
}