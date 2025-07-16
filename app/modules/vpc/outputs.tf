output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_1a_subnet_id" {
  value = aws_subnet.public_1a.id
}

output "public_1b_subnet_id" {
  value = aws_subnet.public_1b.id
}

output "private_1a_subnet_id" {
  value = aws_subnet.private_1a.id
}

output "private_1b_subnet_id" {
  value = aws_subnet.private_1b.id
}
