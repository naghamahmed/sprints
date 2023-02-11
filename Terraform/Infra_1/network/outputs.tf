output "public_subnet1_id" {
    value = aws_subnet.public1.id
}

output "public_subnet2_id" {
    value = aws_subnet.public2.id
}

output "private_subnet1_id" {
    value = aws_subnet.private1.id
}

output "private_subnet2_id" {
    value = aws_subnet.private2.id
}

output "sg_1" {
    value = aws_security_group.sg_1.id
}

output "sg_2" {
    value = aws_security_group.sg_2.id
}

output "vpc_id" {
    value = aws_vpc.main.id
}