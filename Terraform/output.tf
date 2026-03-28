output "vpc_id" {
  value = aws_vpc.devops_vpc.id
}
output "ec2_public_ip" {
  value = aws_instance.devops_instance.public_ip
}