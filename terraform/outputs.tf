output "public_ip" {
  value       = aws_instance.web_instance.public_ip
  description = "The public IP address of the web instance."
}

output "private_ip" {
  value       = aws_instance.web_instance.private_ip
  description = "The private IP address of the web instance."
}