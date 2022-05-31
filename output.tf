output "PUBLIC_IP_1st_Instance" {
 value = aws_instance.os1.public_ip
}

output "PRIVATE_IP_1st_Instance" {
 value = aws_instance.os1.private_ip
}

output "First_Instance" {
 value = aws_instance.os1.tags.Name
}

output "PUBLIC_IP_2nd_Instance" {
 value = aws_instance.os1.public_ip
}

output "PRIVATE_IP_2nd_Instance" {
 value = aws_instance.os1.private_ip
}

output "Second_Instance" {
 value = aws_instance.os1.tags.Name
}
